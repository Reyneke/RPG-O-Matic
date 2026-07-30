import 'package:flutter/material.dart';

class CharacterGenerator extends StatelessWidget {
  const CharacterGenerator();

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
              Icons.person_add,
              size: 80,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Charakter Generator',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Wähle ein System aus und erstelle\nneue Charaktere.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.tonalIcon(
              onPressed: () {
                // TODO: Implement character creation
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text('Charakter erstellen'),
            ),
          ],
        ),
      ),
    );
  }
}
