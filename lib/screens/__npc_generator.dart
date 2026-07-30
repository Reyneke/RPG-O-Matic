import 'package:flutter/material.dart';

class NpcGenerator extends StatelessWidget {
  const NpcGenerator();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.android,
              size: 80,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'NSC Generator',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Erstelle Nicht-Spieler-Charaktere\nfür deine Abenteuer.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.tonalIcon(
              onPressed: () {
                // TODO: Implement NPC generation
              },
              icon: const Icon(Icons.groups),
              label: const Text('NSC erstellen'),
            ),
          ],
        ),
      ),
    );
  }
}