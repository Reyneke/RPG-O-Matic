import 'package:flutter/material.dart';

class CheatsheetsView extends StatelessWidget {
  const CheatsheetsView();

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
              Icons.auto_stories,
              size: 80,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Cheatsheets',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Cheatsheets und Regelkurzfassungen\nfür den schnellen Einstieg.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.tonalIcon(
              onPressed: () {
                // TODO: Implement cheatsheet generation
              },
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text('Cheatsheets generieren'),
            ),
          ],
        ),
      ),
    );
  }
}
