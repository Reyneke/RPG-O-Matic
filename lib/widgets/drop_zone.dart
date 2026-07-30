import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:desktop_drop/desktop_drop.dart';

/// Eine Drop-Zone zum Ziehen von Regelwerken per OS-Drag & Drop
/// oder Anklicken, um einen FilePicker zu öffnen.
class DropZone extends StatefulWidget {
  final void Function(List<String> filePaths) onFilesPicked;

  const DropZone({
    super.key,
    required this.onFilesPicked,
  });

  @override
  State<DropZone> createState() => _DropZoneState();
}

class _DropZoneState extends State<DropZone> {
  bool _isDragging = false;

  static const _allowedExtensions = [
    'pdf', 'md', 'json', 'xml',
    'docx', 'doc', 'rtf', 'odt',
    'txt',
  ];

  Future<void> _openFilePicker() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: _allowedExtensions,
    );

    if (result != null && result.files.isNotEmpty) {
      final paths = result.files
          .where((f) => f.path != null)
          .map((f) => f.path!)
          .toList();
      if (paths.isNotEmpty) {
        widget.onFilesPicked(paths);
      }
    }
  }

  void _onDragEntered() {
    setState(() => _isDragging = true);
  }

  void _onDragExited() {
    setState(() => _isDragging = false);
  }

  void _onDragDone(DropDoneDetails details) {
    setState(() => _isDragging = false);
    final paths = details.files
        .map((f) => f.path)
        .where((path) {
          final ext = path.toLowerCase();
          return _allowedExtensions.any((e) => ext.endsWith('.$e'));
        })
        .toList();
    if (paths.isNotEmpty) {
      widget.onFilesPicked(paths);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      label:
          'Drop-Zone: Ziehe hier Regelwerke per Drag & Drop hinein, '
          'drücke Enter zum Auswählen oder klicke mit der Maus. '
          'Unterstützte Formate: PDF, Markdown, Word, JSON, XML und mehr.',
      button: true,
      child: DropTarget(
        onDragEntered: (_) => _onDragEntered(),
        onDragExited: (_) => _onDragExited(),
        onDragDone: _onDragDone,
        child: Focus(
          onKeyEvent: (node, event) {
            if (event is KeyDownEvent &&
                event.logicalKey == LogicalKeyboardKey.enter) {
              _openFilePicker();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: GestureDetector(
            onTap: _openFilePicker,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(
                  vertical: 32, horizontal: 24),
              decoration: BoxDecoration(
                color: _isDragging
                    ? theme.colorScheme.primaryContainer
                        .withValues(alpha: 0.3)
                    : theme.colorScheme.surfaceContainerHighest
                        .withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _isDragging
                      ? theme.colorScheme.primary
                      : theme.colorScheme.outlineVariant,
                  width: _isDragging ? 2.0 : 1.5,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    _isDragging ? Icons.cloud_upload : Icons.upload_file,
                    size: 48,
                    color: _isDragging
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _isDragging
                        ? 'Dateien ablegen'
                        : 'Regelwerke hier ziehen oder klicken',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: _isDragging
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'PDF, Markdown (.md), Word (.docx), JSON, XML u. v. m.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}