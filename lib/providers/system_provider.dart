import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/game_system.dart';
import '../models/system_status.dart';
import '../services/file_parser.dart';
import '../services/system_storage.dart';

/// Verwaltet den Zustand aller RPG-Systeme, Uploads und Verarbeitungsprozesse.
class SystemProvider extends ChangeNotifier {
  final List<GameSystem> _systems = [];
  final List<String> _pendingFiles = [];
  final List<TrashItem> _trash = [];
  final _uuid = const Uuid();
  final _parser = FileParser();
  bool _initialized = false;

  /// Initialisiert den Provider und lädt gespeicherte Daten.
  Future<void> init() async {
    if (_initialized) return;

    await SystemStorage.init();

    // Gespeicherte Systeme laden
    final saved = SystemStorage.loadSystems();
    _systems.addAll(saved);

    // Papierkorb laden
    _trash.addAll(SystemStorage.loadTrashItems());

    _initialized = true;
    notifyListeners();
  }

  // ---------------------------------------------------------------------------
  // Öffentliche Getter
  // ---------------------------------------------------------------------------

  List<GameSystem> get systems => List.unmodifiable(_systems);
  List<String> get pendingFiles => List.unmodifiable(_pendingFiles);
  List<GameSystem> get readySystems =>
      _systems.where((s) => s.status == SystemStatus.ready).toList();
  List<GameSystem> get errorSystems =>
      _systems.where((s) => s.status == SystemStatus.error).toList();
  List<GameSystem> get importingSystems =>
      _systems.where((s) => s.status == SystemStatus.importing).toList();
  List<TrashItem> get trash => List.unmodifiable(_trash);
  bool isLoading = false;

  // ---------------------------------------------------------------------------
  // Datei-Operationen
  // ---------------------------------------------------------------------------

  /// Datei(en) der Pending-Liste hinzufügen (mit Validierung).
  void addPendingFiles(List<String> filePaths) {
    for (final path in filePaths) {
      if (FileParser.isSupported(path) && !_pendingFiles.contains(path)) {
        _pendingFiles.add(path);
      }
    }
    notifyListeners();
  }

  /// Datei aus der Pending-Liste entfernen.
  void removePendingFile(String filePath) {
    _pendingFiles.remove(filePath);
    notifyListeners();
  }

  /// Verarbeitung aller ausstehenden Dateien mit echtem Parsing.
  Future<void> processAllPending() async {
    final batch = List<String>.from(_pendingFiles);
    if (batch.isEmpty) return;

    isLoading = true;
    notifyListeners();

    for (final filePath in batch) {
      await _processSingleFile(filePath);
    }

    _pendingFiles.removeWhere((f) => batch.contains(f));
    isLoading = false;
    notifyListeners();

    // Speichern nach Verarbeitung
    await _persist();
  }

  /// Ein neues, leeres System anlegen (erzeugt auch Ordner).
  Future<GameSystem> createEmptySystem(String name) async {
    final system = GameSystem(
      id: _uuid.v4(),
      name: name,
      filePath: '',
      status: SystemStatus.ready,
    );
    _systems.add(system);
    notifyListeners();

    // System-Ordner erstellen
    await SystemStorage.createSystemFolder(name);
    await _persist();

    return system;
  }

  // ---------------------------------------------------------------------------
  // Löschen & Papierkorb
  // ---------------------------------------------------------------------------

  /// System in den Papierkorb verschieben.
  Future<void> deleteSystem(String systemId) async {
    final index = _systems.indexWhere((s) => s.id == systemId);
    if (index == -1) return;

    final system = _systems.removeAt(index);

    // In Papierkorb legen
    final trashItem = TrashItem(
      id: _uuid.v4(),
      system: system,
    );
    _trash.add(trashItem);
    await SystemStorage.saveTrashItem(trashItem);

    notifyListeners();
    await _persist();
  }

  /// Gelöschtes System aus dem Papierkorb wiederherstellen.
  Future<void> restoreSystem(String trashId) async {
    final index = _trash.indexWhere((t) => t.id == trashId);
    if (index == -1) return;

    final item = _trash.removeAt(index);
    _systems.add(item.system);
    await SystemStorage.removeTrashItem(trashId);

    notifyListeners();
    await _persist();
  }

  /// Papierkorb endgültig leeren.
  Future<void> clearTrash() async {
    // System-Ordner der endgültig gelöschten Systeme entfernen
    for (final item in _trash) {
      if (item.system.filePath.isNotEmpty) {
        await SystemStorage.deleteSystemFolder(item.system.filePath);
      }
    }
    _trash.clear();
    await SystemStorage.clearTrash();
    notifyListeners();
  }

  /// Papierkorb-Eintrag dauerhaft löschen.
  Future<void> permanentlyDeleteTrashItem(String trashId) async {
    final index = _trash.indexWhere((t) => t.id == trashId);
    if (index == -1) return;

    final item = _trash.removeAt(index);
    if (item.system.filePath.isNotEmpty) {
      await SystemStorage.deleteSystemFolder(item.system.filePath);
    }
    await SystemStorage.removeTrashItem(trashId);
    notifyListeners();
  }

  // ---------------------------------------------------------------------------
  // Status & Update-Operationen
  // ---------------------------------------------------------------------------

  void updateSystemStatus(String systemId, SystemStatus newStatus) {
    final index = _systems.indexWhere((s) => s.id == systemId);
    if (index == -1) return;

    _systems[index] = _systems[index].copyWith(status: newStatus);
    notifyListeners();
    _persist();
  }

  void markSystemUsed(String systemId) {
    final index = _systems.indexWhere((s) => s.id == systemId);
    if (index == -1) return;

    _systems[index] = _systems[index].copyWith(
      lastUsedAt: DateTime.now(),
    );
    notifyListeners();
    _persist();
  }

  void updateSystemColor(String systemId, Color color) {
    final index = _systems.indexWhere((s) => s.id == systemId);
    if (index == -1) return;

    _systems[index] = _systems[index].copyWith(iconColor: color);
    notifyListeners();
    _persist();
  }

  // ---------------------------------------------------------------------------
  // Interne Hilfsmethoden
  // ---------------------------------------------------------------------------

  Future<void> _processSingleFile(String filePath) async {
    final fileName = filePath.split('\\').last.split('/').last;
    final systemName = fileName.replaceAll(RegExp(r'\.[^.]+$'), '');

    final system = GameSystem(
      id: _uuid.v4(),
      name: systemName,
      filePath: filePath,
      status: SystemStatus.importing,
    );
    _systems.add(system);
    notifyListeners();

    try {
      // Echtes Parsing der Datei
      final result = await _parser.parse(filePath);

      if (result.success) {
        // System-Ordner erstellen
        final folderPath = await SystemStorage.createSystemFolder(
          result.systemName,
        );

        final index = _systems.indexWhere((s) => s.id == system.id);
        if (index != -1) {
          _systems[index] = _systems[index].copyWith(
            name: result.systemName,
            status: SystemStatus.ready,
            filePath: folderPath ?? filePath,
          );
        }
      } else {
        final index = _systems.indexWhere((s) => s.id == system.id);
        if (index != -1) {
          _systems[index] = _systems[index].copyWith(
            status: SystemStatus.error,
          );
        }
        debugPrint('Fehler beim Verarbeiten von $filePath: ${result.errorMessage}');
      }
    } catch (e) {
      final index = _systems.indexWhere((s) => s.id == system.id);
      if (index != -1) {
        _systems[index] = _systems[index].copyWith(
          status: SystemStatus.error,
        );
      }
      debugPrint('Fehler beim Verarbeiten von $filePath: $e');
    }
    notifyListeners();
  }

  Future<void> _persist() async {
    await SystemStorage.saveSystems(_systems);
  }
}