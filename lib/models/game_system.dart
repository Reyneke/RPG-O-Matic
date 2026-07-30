import 'package:flutter/material.dart';
import 'system_status.dart';

/// Repräsentiert ein RPG-System (Regelwerk) in der App.
class GameSystem {
  final String id;
  final String name;
  final String filePath;
  final SystemStatus status;
  final DateTime createdAt;
  final DateTime? lastUsedAt;
  final Color iconColor;

  GameSystem({
    required this.id,
    required this.name,
    required this.filePath,
    this.status = SystemStatus.pending,
    DateTime? createdAt,
    this.lastUsedAt,
    this.iconColor = Colors.blueGrey,
  }) : createdAt = createdAt ?? DateTime.now();

  /// Kopie mit geänderten Feldern erstellen.
  GameSystem copyWith({
    String? id,
    String? name,
    String? filePath,
    SystemStatus? status,
    DateTime? createdAt,
    DateTime? lastUsedAt,
    Color? iconColor,
  }) {
    return GameSystem(
      id: id ?? this.id,
      name: name ?? this.name,
      filePath: filePath ?? this.filePath,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      lastUsedAt: lastUsedAt ?? this.lastUsedAt,
      iconColor: iconColor ?? this.iconColor,
    );
  }
}