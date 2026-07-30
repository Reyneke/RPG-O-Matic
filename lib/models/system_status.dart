import 'package:flutter/material.dart';

/// Status eines RPG-Systems im Verarbeitungs-Workflow.
enum SystemStatus {
  /// Datei wurde hochgeladen, aber noch nicht verarbeitet
  pending('Ausstehend', Icons.hourglass_empty, Colors.orange),

  /// System wird aktuell importiert/verarbeitet
  importing('Wird importiert', Icons.downloading, Colors.blue),

  /// System ist fertig verarbeitet und einsatzbereit
  ready('Bereit', Icons.check_circle, Colors.green),

  /// Bei der Verarbeitung ist ein Fehler aufgetreten
  error('Fehlerhaft', Icons.error, Colors.red);

  final String label;
  final IconData icon;
  final Color color;

  const SystemStatus(this.label, this.icon, this.color);
}