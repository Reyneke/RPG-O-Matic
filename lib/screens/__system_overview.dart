import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/system_status.dart';
import '../providers/system_provider.dart';
import '../widgets/drop_zone.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/system_list_item.dart';

/// Vollständig implementierte Systemübersicht.
class SystemOverview extends StatelessWidget {
  const SystemOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SystemProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          body: _buildBody(context, provider),
          floatingActionButton: provider.readySystems.isNotEmpty
              ? FloatingActionButton.extended(
                  heroTag: 'new_system',
                  onPressed: () => _showNewSystemDialog(context, provider),
                  icon: const Icon(Icons.add),
                  label: const Text('Neues System'),
                  tooltip: 'Ein neues, leeres System anlegen',
                )
              : null,
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, SystemProvider provider) {
    if (provider.isLoading) {
      return _buildLoadingState(context);
    }

    if (provider.systems.isEmpty && provider.pendingFiles.isEmpty) {
      return _buildEmptyState(context, provider);
    }

    return _buildContent(context, provider);
  }

  // ---------------------------------------------------------------------------
  // Loading State
  // ---------------------------------------------------------------------------

  Widget _buildLoadingState(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      label: 'Systeme werden geladen',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Importiere Systeme...',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              color: theme.colorScheme.primary,
              backgroundColor:
                  theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Empty State
  // ---------------------------------------------------------------------------

  Widget _buildEmptyState(BuildContext context, SystemProvider provider) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        children: [
          const SizedBox(height: 16),
          EmptyStateWidget(
            icon: Icons.library_books,
            title: 'Noch keine Systeme',
            subtitle:
                'Füge dein erstes RPG-System hinzu, indem du Regelwerke auf die Drop-Zone ziehst oder über "System importieren" auswählst.',
            actionLabel: 'Erstes System hinzufügen',
            onAction: () => _addFiles(context, provider),
          ),
          const SizedBox(height: 16),
          _buildDropZoneSection(context, provider),
          if (provider.trash.isNotEmpty) _buildTrashIndicator(context, provider),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Content (Systems vorhanden)
  // ---------------------------------------------------------------------------

  Widget _buildContent(BuildContext context, SystemProvider provider) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        children: [
          // Drop-Zone
          _buildDropZoneSection(context, provider),

          // Ausstehende Dateien
          if (provider.pendingFiles.isNotEmpty) ...[
            _buildSectionHeader(
              context,
              icon: Icons.hourglass_empty,
              title: 'Noch zu verarbeitende Regelwerke',
              subtitle: '${provider.pendingFiles.length} Datei(en)',
              trailing: FilledButton.tonal(
                onPressed: () => provider.processAllPending(),
                child: const Text('Verarbeitung starten'),
              ),
            ),
            ...provider.pendingFiles.map(
              (filePath) => SystemListItem(
                title: filePath.split('\\').last.split('/').last,
                subtitle: filePath,
                status: SystemStatus.pending,
                onDelete: () => provider.removePendingFile(filePath),
              ),
            ),
          ],

          // Verarbeitung läuft
          if (provider.importingSystems.isNotEmpty) ...[
            _buildSectionHeader(
              context,
              icon: Icons.downloading,
              title: 'Importiere Systeme...',
              subtitle: '${provider.importingSystems.length} System(e)',
            ),
            ...provider.importingSystems.map(
              (system) => SystemListItem.fromGameSystem(system: system),
            ),
          ],

          // Fertig inkludierte Systeme
          if (provider.readySystems.isNotEmpty) ...[
            _buildSectionHeader(
              context,
              icon: Icons.check_circle,
              title: 'Fertig inkludierte Regelwerke',
              subtitle: '${provider.readySystems.length} System(e)',
              trailing: IconButton(
                icon: const Icon(Icons.color_lens_outlined),
                tooltip: 'Farben anpassen',
                onPressed: () => _showColorPickerDialog(context, provider),
              ),
            ),
            ...provider.readySystems.map(
              (system) => SystemListItem.fromGameSystem(
                system: system,
                onTap: () => _onSystemTap(context, provider, system.id),
                onDelete: () => _confirmDelete(context, provider, system.id, system.name),
                showCheckbox: true,
              ),
            ),
          ],

          // Fehlerhafte Systeme
          if (provider.errorSystems.isNotEmpty) ...[
            _buildSectionHeader(
              context,
              icon: Icons.error,
              title: 'Fehlerhafte Systeme',
              subtitle: '${provider.errorSystems.length} System(e)',
            ),
            ...provider.errorSystems.map(
              (system) => SystemListItem.fromGameSystem(
                system: system,
                onDelete: () => _confirmDelete(context, provider, system.id, system.name),
              ),
            ),
          ],

          // Papierkorb-Indikator
          if (provider.trash.isNotEmpty) _buildTrashIndicator(context, provider),

          const SizedBox(height: 80),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Drop-Zone Section
  // ---------------------------------------------------------------------------

  Widget _buildDropZoneSection(BuildContext context, SystemProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Semantics(
            label: 'Bereich zum Hinzufügen von Regelwerken',
            child: Text(
              'Neue Regelwerke hinzufügen',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Text(
            'Ziehe Dateien hier hinein oder klicke auf die Fläche, um sie auszuwählen.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ),
        DropZone(
          onFilesPicked: (paths) => provider.addPendingFiles(paths),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Section Header
  // ---------------------------------------------------------------------------

  Widget _buildSectionHeader(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
  }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleSmall,
                ),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Trash Indicator
  // ---------------------------------------------------------------------------

  Widget _buildTrashIndicator(BuildContext context, SystemProvider provider) {
    final theme = Theme.of(context);
    return Semantics(
      label: 'Papierkorb mit ${provider.trash.length} gelöschten Systemen',
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: theme.colorScheme.errorContainer,
            child: Icon(
              Icons.delete_outline,
              color: theme.colorScheme.onErrorContainer,
            ),
          ),
          title: Text('Papierkorb (${provider.trash.length})'),
          subtitle: const Text('Gelöschte Systeme wiederherstellen oder endgültig löschen'),
          trailing: TextButton(
            onPressed: () => _showTrashDialog(context, provider),
            child: const Text('Verwalten'),
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Dialoge
  // ---------------------------------------------------------------------------

  void _addFiles(BuildContext context, SystemProvider provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Wähle Dateien über die Drop-Zone aus.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showNewSystemDialog(BuildContext context, SystemProvider provider) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Neues System anlegen'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Lege ein neues, leeres RPG-System an. Ein Unterordner wird erstellt.',
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Systemname',
                hintText: 'z.B. Dungeons & Dragons 5e',
                border: OutlineInputBorder(),
              ),
              autofocus: true,
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  provider.createEmptySystem(value.trim());
                  Navigator.of(ctx).pop();
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Abbrechen'),
          ),
          FilledButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                provider.createEmptySystem(controller.text.trim());
                Navigator.of(ctx).pop();
              }
            },
            child: const Text('Anlegen'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(
      BuildContext context, SystemProvider provider, String systemId, String name) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('System löschen'),
        content: Text(
          'Möchtest du "$name" wirklich löschen?\n\n'
          'Das System wird in den Papierkorb verschoben und kann später wiederhergestellt werden.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Abbrechen'),
          ),
          FilledButton.tonal(
            onPressed: () {
              provider.deleteSystem(systemId);
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('"$name" wurde in den Papierkorb verschoben.'),
                  action: SnackBarAction(
                    label: 'Rückgängig',
                    onPressed: () {
                      if (provider.trash.isNotEmpty) {
                        provider.restoreSystem(provider.trash.last.id);
                      }
                    },
                  ),
                ),
              );
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
              foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
            ),
            child: const Text('Löschen'),
          ),
        ],
      ),
    );
  }

  void _showColorPickerDialog(
      BuildContext context, SystemProvider provider) {
    final colors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.blue,
      Colors.lightBlue,
      Colors.cyan,
      Colors.teal,
      Colors.green,
      Colors.lightGreen,
      Colors.lime,
      Colors.yellow,
      Colors.amber,
      Colors.orange,
      Colors.deepOrange,
      Colors.brown,
      Colors.grey,
      Colors.blueGrey,
    ];

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Icon-Farbe anpassen'),
        content: SizedBox(
          width: 300,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: colors.map((color) {
              return Semantics(
                label: 'Farbe: ${color.toString().split('"')[1]}',
                button: true,
                child: GestureDetector(
                  onTap: () {
                    if (provider.readySystems.isNotEmpty) {
                      provider.updateSystemColor(
                          provider.readySystems.first.id, color);
                    }
                    Navigator.of(ctx).pop();
                  },
                  child: CircleAvatar(
                    backgroundColor: color,
                    child: provider.readySystems.isNotEmpty &&
                            provider.readySystems.first.iconColor == color
                        ? const Icon(Icons.check, color: Colors.white, size: 18)
                        : null,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Schließen'),
          ),
        ],
      ),
    );
  }

  void _showTrashDialog(BuildContext context, SystemProvider provider) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Papierkorb'),
        content: SizedBox(
          width: 400,
          child: provider.trash.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Der Papierkorb ist leer.'),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.trash.length,
                  itemBuilder: (_, index) {
                    final item = provider.trash[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: item.system.iconColor.withValues(alpha: 0.2),
                        child: Icon(
                          Icons.delete_outline,
                          color: item.system.iconColor,
                          size: 20,
                        ),
                      ),
                      title: Text(item.system.name),
                      subtitle: Text(
                        'Gelöscht: ${item.deletedAt.day}.${item.deletedAt.month}.${item.deletedAt.year}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.restore),
                            tooltip: 'Wiederherstellen',
                            onPressed: () {
                              provider.restoreSystem(item.id);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('"${item.system.name}" wurde wiederhergestellt.'),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_forever),
                            tooltip: 'Endgültig löschen',
                            onPressed: () {
                              provider.permanentlyDeleteTrashItem(item.id);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
        actions: [
          if (provider.trash.isNotEmpty)
            TextButton(
              onPressed: () {
                provider.clearTrash();
                Navigator.of(ctx).pop();
              },
              child: const Text('Papierkorb leeren'),
            ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Schließen'),
          ),
        ],
      ),
    );
  }

  void _onSystemTap(
      BuildContext context, SystemProvider provider, String systemId) {
    provider.markSystemUsed(systemId);
    final name = provider.systems.firstWhere((s) => s.id == systemId).name;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('"$name" geöffnet.'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}