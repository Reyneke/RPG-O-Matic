import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    _SystemOverview(),
    _CharacterGenerator(),
    _CheatsheetsView(),
    _NpcGenerator(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RPG-O-Matic'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              context.watch<ThemeProvider>().themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            tooltip: 'Theme umschalten',
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.library_books),
            selectedIcon: Icon(Icons.library_books),
            label: 'Systeme',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_add),
            selectedIcon: Icon(Icons.person_add),
            label: 'Charakter',
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_stories),
            selectedIcon: Icon(Icons.auto_stories),
            label: 'Cheatsheets',
          ),
          NavigationDestination(
            icon: Icon(Icons.android),
            selectedIcon: Icon(Icons.android),
            label: 'NSCs',
          ),
        ],
      ),
    );
  }
}

class _SystemOverview extends StatelessWidget {
  const _SystemOverview();

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
              Icons.add_circle_outline,
              size: 80,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Systeme verwalten',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Ziehe RPG-System-Dateien (PDF etc.) per Drag & Drop\nin die App, um neue Systeme hinzuzufügen.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () {
                // TODO: Implement system import
              },
              icon: const Icon(Icons.file_upload),
              label: const Text('System importieren'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CharacterGenerator extends StatelessWidget {
  const _CharacterGenerator();

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

class _CheatsheetsView extends StatelessWidget {
  const _CheatsheetsView();

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

class _NpcGenerator extends StatelessWidget {
  const _NpcGenerator();

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