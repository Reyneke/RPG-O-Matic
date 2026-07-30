import 'package:flutter/material.dart';
import '../models/game_system.dart';
import '../models/system_status.dart';

/// Listeneintrag für ein System oder eine Datei, mit Status-Anzeige.
class SystemListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final SystemStatus status;
  final Color iconColor;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final bool showCheckbox;
  final bool? isChecked;
  final ValueChanged<bool?>? onCheckedChanged;

  const SystemListItem({
    super.key,
    required this.title,
    this.subtitle,
    required this.status,
    this.iconColor = Colors.blueGrey,
    this.onTap,
    this.onDelete,
    this.showCheckbox = false,
    this.isChecked,
    this.onCheckedChanged,
  });

  /// Factory: Erstellt einen ListItem aus einem GameSystem.
  factory SystemListItem.fromGameSystem({
    required GameSystem system,
    VoidCallback? onTap,
    VoidCallback? onDelete,
    bool showCheckbox = false,
    bool? isChecked,
    ValueChanged<bool?>? onCheckedChanged,
  }) {
    return SystemListItem(
      title: system.name,
      subtitle: system.lastUsedAt != null
          ? 'Zuletzt verwendet: ${_formatDate(system.lastUsedAt!)}'
          : system.status == SystemStatus.pending
              ? 'Noch nicht verarbeitet'
              : 'Erstellt: ${_formatDate(system.createdAt)}',
      status: system.status,
      iconColor: system.iconColor,
      onTap: onTap,
      onDelete: onDelete,
      showCheckbox: showCheckbox,
      isChecked: isChecked,
      onCheckedChanged: onCheckedChanged,
    );
  }

  static String _formatDate(DateTime date) {
    return '${date.day}.${date.month}.${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      label: '$title - Status: ${status.label}',
      button: onTap != null,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: status.color.withValues(alpha: 0.15),
            child: Icon(
              status.icon,
              color: status.color,
              size: 20,
            ),
          ),
          title: Text(
            title,
            style: theme.textTheme.titleSmall,
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                )
              : null,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showCheckbox && onCheckedChanged != null)
                Semantics(
                  label: '$title auswählen',
                  child: Checkbox(
                    value: isChecked ?? false,
                    onChanged: onCheckedChanged,
                  ),
                ),
              if (onDelete != null)
                Semantics(
                  label: '$title löschen',
                  child: IconButton(
                    icon: const Icon(Icons.delete_outline, size: 20),
                    onPressed: onDelete,
                    tooltip: '$title löschen',
                  ),
                ),
            ],
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}