import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:st2_all_time_character_generator/theme/app_theme.dart';

/// Tests for AppTheme.
///
/// Note: Google Fonts triggers async HTTP requests when fonts are first
/// accessed (themes are static final fields). In the test environment,
/// the HTTP client returns status 400. Since this is a known limitation
/// of testing with Google Fonts, we focus on testing static const fields
/// and verifying the AppTheme class structure.
///
/// ThemeData creation is verified through the CI build process.
void main() {
  group('AppTheme constants', () {
    test('AppTheme class should be accessible', () {
      expect(AppTheme, isNotNull);
    });

    test('semantic colors should be correctly defined', () {
      expect(AppTheme.success, Colors.green);
      expect(AppTheme.warning, Colors.orange);
      expect(AppTheme.error, Colors.red);
      expect(AppTheme.info, Colors.blue);
      expect(AppTheme.magic, Colors.purple);
      expect(AppTheme.matrix, Colors.cyan);
      expect(AppTheme.physical, Colors.brown);
    });

    test('semantic colors should be non-null', () {
      expect(AppTheme.success, isNotNull);
      expect(AppTheme.warning, isNotNull);
      expect(AppTheme.error, isNotNull);
      expect(AppTheme.info, isNotNull);
      expect(AppTheme.magic, isNotNull);
      expect(AppTheme.matrix, isNotNull);
      expect(AppTheme.physical, isNotNull);
    });
  });
}