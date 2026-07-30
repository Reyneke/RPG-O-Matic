import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_o_matic/screens/__character_generator.dart';
import 'package:rpg_o_matic/screens/__cheatsheets_view.dart';
import 'package:rpg_o_matic/screens/__npc_generator.dart';
import 'package:rpg_o_matic/screens/__system_overview.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    SystemOverview(),
    CharacterGenerator(),
    CheatsheetsView(),
    NpcGenerator(),
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
