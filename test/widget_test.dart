import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rpg_o_matic/main.dart';

void main() {
  testWidgets('App should render home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const RPGOmaticApp());

    // Verify that the title is displayed
    expect(find.text('RPG-O-Matic'), findsOneWidget);

    // Verify that the bottom navigation bar is present
    expect(find.byType(NavigationBar), findsOneWidget);
  });
}
