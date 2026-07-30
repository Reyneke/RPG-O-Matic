import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:rpg_o_matic/providers/system_provider.dart';
import 'package:rpg_o_matic/providers/theme_provider.dart';
import 'package:rpg_o_matic/screens/home_screen.dart';

void main() {
  testWidgets('App should render home screen with providers',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => SystemProvider()),
        ],
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );

    // Verify that the bottom navigation bar is present
    expect(find.byType(NavigationBar), findsOneWidget);

    // Verify navigation destinations are present
    expect(find.text('Systeme'), findsOneWidget);
    expect(find.text('Charakter'), findsOneWidget);
    expect(find.text('Cheatsheets'), findsOneWidget);
    expect(find.text('NSCs'), findsOneWidget);
  });

  testWidgets('System overview should show empty state', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => SystemProvider()),
        ],
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );

    // System tab is selected by default (index 0)
    expect(find.text('Noch keine Systeme'), findsOneWidget);
  });
}