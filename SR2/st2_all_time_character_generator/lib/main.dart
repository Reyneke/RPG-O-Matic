import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme/app_theme.dart';
import 'theme/theme_switcher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: SR2CharacterGeneratorApp(),
    ),
  );
}

/// Root application widget for the SR2 Character Generator.
/// Integrates Riverpod for state management and ThemeSwitcher for theming.
class SR2CharacterGeneratorApp extends ConsumerWidget {
  const SR2CharacterGeneratorApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSwitcher = ref.watch(themeSwitcherProvider.notifier);

    return MaterialApp(
      title: 'SR2 Character Generator',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeSwitcher.themeMode,
      home: const HomeScreen(),
    );
  }
}

/// Temporary home screen placeholder.
/// Will be replaced with the full Home Screen in Sprint 2.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SR2 Character Generator'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.casino,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Shadowrun 2. Edition',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Character Generator',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 32),
            Text(
              'Sprint 0 - Project Setup Complete',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Database: ✅ Drift (SQLite)',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'State: ✅ Riverpod',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Theme: ✅ Material 3 + Google Fonts',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}