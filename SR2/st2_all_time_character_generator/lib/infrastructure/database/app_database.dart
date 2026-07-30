import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'app_database.g.dart';

// ============================================================
// Table Definitions
// ============================================================

class Characters extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get concept => text().nullable()();
  TextColumn get metatype => text()();
  TextColumn get attributes => text()(); // JSON
  TextColumn get skills => text()(); // JSON
  TextColumn get qualities => text()(); // JSON
  TextColumn get magicPath => text().nullable()(); // JSON
  TextColumn get equipment => text()(); // JSON
  TextColumn get finances => text()(); // JSON
  TextColumn get background => text()(); // JSON
  TextColumn get creationData => text()(); // JSON
  TextColumn get metadata => text()(); // JSON
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

class Rulebooks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get version => text()();
  TextColumn get language => text()();
  TextColumn get filePath => text().nullable()();
  DateTimeColumn get importedAt => dateTime()();
  TextColumn get checksum => text()();
  IntColumn get schemaVersion => integer()();
}

class Rules extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get rulebookId => integer().references(Rulebooks, #id)();
  TextColumn get ruleType => text()();
  TextColumn get ruleKey => text()();
  TextColumn get dataJson => text()();
  TextColumn get dependenciesJson => text().nullable()();
  IntColumn get priority => integer().withDefault(const Constant(0))();
}

class Equipment extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get rulebookId => integer().references(Rulebooks, #id)();
  TextColumn get equipmentId => text()();
  TextColumn get name => text()();
  TextColumn get equipmentType => text()();
  TextColumn get dataJson => text()();
  IntColumn get availability => integer()();
  TextColumn get legality => text()();
}

class Npcs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get npcId => text()();
  TextColumn get name => text()();
  TextColumn get metatype => text()();
  TextColumn get role => text()();
  TextColumn get attributes => text()();
  TextColumn get skills => text()();
  TextColumn get gear => text()();
  TextColumn get notes => text()();
  BoolColumn get isHostile => boolean().withDefault(const Constant(false))();
}

class Hosts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get hostId => text()();
  TextColumn get name => text()();
  TextColumn get hostType => text()();
  IntColumn get security => integer()();
  TextColumn get systems => text()(); // JSON
  TextColumn get ice => text()(); // JSON
  TextColumn get access => text()(); // JSON
  TextColumn get notes => text()();
}

class Locations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get locationId => text()();
  TextColumn get name => text()();
  TextColumn get locationType => text()();
  TextColumn get description => text()();
  TextColumn get connections => text()(); // JSON
  TextColumn get npcs => text()(); // JSON
  TextColumn get security => text()(); // JSON
}

// ============================================================
// Database Definition
// ============================================================

@DriftDatabase(tables: [
  Characters,
  Rulebooks,
  Rules,
  Equipment,
  Npcs,
  Hosts,
  Locations,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          // Migration logic will be added as needed
        },
      );

  // ============================================================
  // Character Queries
  // ============================================================

  Future<Character?> getCharacter(int id) {
    return (select(characters)..where((c) => c.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<Character>> getAllCharacters() {
    return select(characters).get();
  }

  Future<int> insertCharacter(CharactersCompanion entity) {
    return into(characters).insert(entity);
  }

  Future<bool> updateCharacter(CharactersCompanion entity) {
    return update(characters).replace(entity);
  }

  Future<int> deleteCharacter(int id) {
    return (delete(characters)..where((c) => c.id.equals(id))).go();
  }

  // ============================================================
  // Rule Queries
  // ============================================================

  Future<List<Rule>> getRulesByType(String type) {
    return (select(rules)..where((r) => r.ruleType.equals(type))).get();
  }

  Future<List<Rule>> getRulesForRulebook(int rulebookId) {
    return (select(rules)..where((r) => r.rulebookId.equals(rulebookId)))
        .get();
  }

  // ============================================================
  // Equipment Queries
  // ============================================================

  Future<List<EquipmentData>> searchEquipment(String query) {
    return (select(equipment)..where((e) => e.name.like('%$query%'))).get();
  }

  // ============================================================
  // Batch Operations
  // ============================================================

  Future<void> importRules(List<RulesCompanion> entities) {
    return batch((batch) {
      batch.insertAll(rules, entities);
    });
  }
}

// ============================================================
// Database Factory
// ============================================================

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'sr2_character_generator.db'));
    return NativeDatabase.createInBackground(file);
  });
}

// Singleton instance
AppDatabase? _instance;

AppDatabase getDatabase() {
  _instance ??= AppDatabase(_openConnection());
  return _instance!;
}