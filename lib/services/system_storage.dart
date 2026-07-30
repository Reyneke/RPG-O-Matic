import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../models/game_system.dart';
import '../models/system_status.dart';

/// Service für Datenpersistenz der RPG-Systeme mittels Hive.
class SystemStorage {
  static const String _boxName = 'rpg_systems';
  static const String _trashBoxName = 'rpg_trash';
  static const String _systemsKey = 'systems';
  static const String _trashKey = 'trash_items';

  static Box? _box;
  static Box? _trashBox;

  /// Initialisiert Hive und öffnet die Boxen.
  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
    _trashBox = await Hive.openBox(_trashBoxName);
  }

  /// Speichert alle Systeme.
  static Future<void> saveSystems(List<GameSystem> systems) async {
    final data = systems.map((s) => _systemToMap(s)).toList();
    await _box?.put(_systemsKey, data);
  }

  /// Lädt alle Systeme.
  static List<GameSystem> loadSystems() {
    final data = _box?.get(_systemsKey) as List<dynamic>?;
    if (data == null) return [];
    return data.map((e) => _mapToSystem(e as Map<String, dynamic>)).toList();
  }

  /// Speichert gelöschte Systeme für Undo.
  static Future<void> saveTrashItem(TrashItem item) async {
    final items = loadTrashItems();
    items.add(item);
    final data = items.map((i) => _trashItemToMap(i)).toList();
    await _trashBox?.put(_trashKey, data);
  }

  /// Lädt alle Papierkorb-Items.
  static List<TrashItem> loadTrashItems() {
    final data = _trashBox?.get(_trashKey) as List<dynamic>?;
    if (data == null) return [];
    return data.map((e) => _mapToTrashItem(e as Map<String, dynamic>)).toList();
  }

  /// Entfernt ein Trash-Item.
  static Future<void> removeTrashItem(String id) async {
    final items = loadTrashItems();
    items.removeWhere((i) => i.id == id);
    final data = items.map((i) => _trashItemToMap(i)).toList();
    await _trashBox?.put(_trashKey, data);
  }

  /// Leert den Papierkorb.
  static Future<void> clearTrash() async {
    await _trashBox?.put(_trashKey, []);
  }

  // ---------------------------------------------------------------------------
  // System-Ordner-Struktur
  // ---------------------------------------------------------------------------

  /// Erstellt einen Ordner für ein System im App-Dokumentenverzeichnis.
  static Future<String?> createSystemFolder(String systemName) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final sanitized = systemName.replaceAll(RegExp(r'[^\w\s-]'), '').trim();
      final folder = Directory('${appDir.path}/systems/$sanitized');
      if (!await folder.exists()) {
        await folder.create(recursive: true);
      }
      return folder.path;
    } catch (e) {
      debugPrint('Fehler beim Erstellen des System-Ordners: $e');
      return null;
    }
  }

  /// Löscht einen System-Ordner.
  static Future<bool> deleteSystemFolder(String folderPath) async {
    try {
      final folder = Directory(folderPath);
      if (await folder.exists()) {
        await folder.delete(recursive: true);
      }
      return true;
    } catch (e) {
      debugPrint('Fehler beim Löschen des System-Orners: $e');
      return false;
    }
  }

  // ---------------------------------------------------------------------------
  // Hilfsmethoden für Serialisierung
  // ---------------------------------------------------------------------------

  static Map<String, dynamic> _systemToMap(GameSystem system) {
    return {
      'id': system.id,
      'name': system.name,
      'filePath': system.filePath,
      'status': system.status.name,
      'createdAt': system.createdAt.toIso8601String(),
      'lastUsedAt': system.lastUsedAt?.toIso8601String(),
      'iconColor': system.iconColor.toARGB32(),
    };
  }

  static GameSystem _mapToSystem(Map<String, dynamic> map) {
    return GameSystem(
      id: map['id'] as String,
      name: map['name'] as String,
      filePath: map['filePath'] as String? ?? '',
      status: SystemStatus.values.firstWhere(
        (s) => s.name == map['status'],
        orElse: () => SystemStatus.ready,
      ),
      createdAt: DateTime.parse(map['createdAt'] as String),
      lastUsedAt: map['lastUsedAt'] != null
          ? DateTime.parse(map['lastUsedAt'] as String)
          : null,
      iconColor: Color(map['iconColor'] as int),
    );
  }

  static Map<String, dynamic> _trashItemToMap(TrashItem item) {
    return {
      'id': item.id,
      'system': _systemToMap(item.system),
      'deletedAt': item.deletedAt.toIso8601String(),
    };
  }

  static TrashItem _mapToTrashItem(Map<String, dynamic> map) {
    return TrashItem(
      id: map['id'] as String,
      system: _mapToSystem(map['system'] as Map<String, dynamic>),
      deletedAt: DateTime.parse(map['deletedAt'] as String),
    );
  }
}

/// Repräsentiert ein gelöschtes System im Papierkorb.
class TrashItem {
  final String id;
  final GameSystem system;
  final DateTime deletedAt;

  TrashItem({
    required this.id,
    required this.system,
    DateTime? deletedAt,
  }) : deletedAt = deletedAt ?? DateTime.now();
}