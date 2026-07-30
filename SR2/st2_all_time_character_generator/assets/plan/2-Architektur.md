Bezugnehmend auf "1-Anforderungsanalyse.md" und "1-1-Regelinteraktionen.md"

# Architektur-Entwurf und Technologie-Stack

## 1. Übergeordnete Architekturprinzipien

### 1.1 Clean Architecture mit Feature-First-Ansatz
- **Separation of Concerns**: Klare Trennung zwischen UI, Business Logic und Data Layer
- **Dependency Rule**: Abhängigkeiten zeigen immer nach innen (Domain Layer ist unabhängig)
- **Feature-First**: Module organisieren sich nach Features (Character, Magic, Combat) statt nach Typen
- **Testbarkeit**: Jede Schicht ist unabhängig testbar

### 1.2 Schichten-Architektur
```
┌─────────────────────────────────────────┐
│   Presentation Layer (UI/Widgets)       │
│   - Flutter Widgets                     │
│   - State Management (Riverpod)         │
│   - Route Management                    │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│   Application Layer (Use Cases)         │
│   - Character Creation Orchestrator     │
│   - Rule Validation Service             │
│   - Dice Rolling Service                │
│   - PDF Import Service                  │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│   Domain Layer (Entities & Rules)       │
│   - Character, Attribute, Skill         │
│   - Rule Engine Core                    │
│   - Interfaces/Contracts                │
│   - Business Rules                      │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│   Infrastructure Layer (Implementations)│
│   - SQLite Database (drift)             │
│   - PDF Parser (pdfx)                   │
│   - JSON/XML Export                     │
│   - Repository Implementations          │
└─────────────────────────────────────────┘
```

---

## 2. Technologie-Stack (Konkret)

### 2.1 Framework & Sprache
- **Flutter 3.x+** (SDK >= 3.5.0)
  - Begründung: Cross-Platform (Web, Desktop, Mobile) aus 1-Anforderungsanalyse §6.4
  - Single Codebase für alle Zielplattformen
  - Native Performance für komplexe Berechnungen

- **Dart 3.x+**
  - Null-Safety für robustere Codebasis
  - Pattern Matching für Regel-Validierung
  - Records für komplexe Datenstrukturen

### 2.2 State Management: **Riverpod** ⭐
- **Empfehlung**: Riverpod 2.x (statt Provider/Bloc)
- **Begründung**:
  - ✅ Compile-time safety (keine Laufzeitfehler durch falsche Provider-Nutzung)
  - ✅ Bessere Testbarkeit als Bloc
  - ✅ Einfacherer Einstieg als Bloc für neue Entwickler
  - ✅ Leistungsstarkes Caching (wichtig für komplexe Regelberechnungen)
  - ✅ Async-Support für PDF-Import und Datenbank-Operationen
  - ✅ Riverpod Code Generation für weniger Boilerplate

**Verwendung**:
```dart
// Beispiel: Character State Management
final characterProvider = StateNotifierProvider<CharacterNotifier, Character?>((ref) {
  return CharacterNotifier(ref.read(ruleEngineProvider));
});

final calculatedAttributesProvider = Provider<CalculatedAttributes>((ref) {
  final character = ref.watch(characterProvider);
  final ruleEngine = ref.watch(ruleEngineProvider);
  return ruleEngine.calculateAttributes(character);
});
```

### 2.3 Datenbank: **Drift (SQLite)**
- **Paket**: `drift` (ehemals Moor)
- **Begründung**:
  - ✅ Type-safe SQL Queries (generierter Code)
  - ✅ Reactive Queries (automatisches UI-Update bei Datenänderung)
  - ✅ Migration-System (wichtig für Regelwerks-Updates)
  - ✅ Plattformübergreifend (Web, Desktop, Mobile)
  - ✅ Bessere Performance als sqflite

**Datenbank-Schema (Auszug)**:
```sql
-- Regelwerke mit Versionierung
CREATE TABLE rulebooks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    version TEXT NOT NULL,
    language TEXT NOT NULL, -- 'de' | 'en'
    file_path TEXT,
    imported_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    checksum TEXT -- Für Update-Erkennung
);

-- Regeln mit Abhängigkeiten
CREATE TABLE rules (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    rulebook_id INTEGER NOT NULL,
    rule_type TEXT NOT NULL, -- 'attribute', 'skill', 'magic', etc.
    rule_key TEXT NOT NULL,
    data_json TEXT NOT NULL, -- JSON mit Regel-Details
    dependencies_json TEXT, -- JSON-Array von Regel-IDs
    priority INTEGER DEFAULT 0,
    FOREIGN KEY (rulebook_id) REFERENCES rulebooks(id)
);

-- Charaktere
CREATE TABLE characters (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    concept TEXT,
    metatype TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

### 2.4 PDF-Verarbeitung

#### 2.4.1 Bibliotheks-Vergleich

| Feature | pdfx | pdf_text | pdfium |
|---------|------|----------|--------|
| **Plattform** | Flutter (Cross-Platform) | Flutter (Cross-Platform) | Flutter (via pdfium.dll) |
| **Text-Extraktion** | ✅ Gut | ✅ Sehr gut | ✅ Exzellent |
| **Tabellen-Erkennung** | ❌ Schwach | ⚠️ Mittel | ✅ Gut (via layout analysis) |
| **Performance** | Mittel | Hoch | Hoch |
| **PDF-Komplexität** | Einfache PDFs | Mittel bis komplex | Sehr komplex |
| **Aktive Entwicklung** | ✅ Ja (2024) | ✅ Ja (2024) | ⚠️ Weniger aktiv |
| **Community** | Klein | Mittel | Groß (Google-maintained) |
| **Dart-API** | Modern (async/await) | Modern (async/await) | Älter (callback-basiert) |
| **Dateigröße** | Klein | Mittel | Groß (pdfium.dll ~20MB) |
| **OCR Integration** | ❌ Nein | ❌ Nein | ✅ Möglich (via tesseract) |
| **Tabellen-Parsing** | ❌ Manuell nötig | ⚠️ Experimentell | ✅ Eingebaut |

**Empfehlung**: **pdf_text** für MVP, mit Option auf pdfium für Post-MVP

#### 2.4.2 Begründung: pdf_text für MVP

**Vorteile**:
- ✅ **Einfache API**: Modernes Dart API, leicht zu lernen
- ✅ **Gute Text-Extraktion**: Funktioniert zuverlässig für deutsche/englische PDFs
- ✅ **Aktiv entwickelt**: Regelmäßige Updates, gute Dokumentation
- ✅ **Leichtgewicht**: Keine riesigen Binaries
- ✅ **Multi-Plattform**: Web, Desktop, Mobile

**Nachteile**:
- ⚠️ **Tabellen-Erkennung**: Experimentell, braucht oft manuelle Nacharbeit
- ⚠️ **Komplexe PDFs**: Bei gescannten PDFs oder komplexen Layouts Probleme

**MVP-Strategie**:
```
1. pdf_text für Text-Extraktion nutzen
2. Tabellen manuell parsen (Regex + Heuristiken)
3. Fallback: Manueller Import für komplexe PDFs
4. Post-MVP: Auf pdfium wechseln für bessere Tabellen-Erkennung
```

#### 2.4.3 Implementierungsbeispiel

```dart
import 'package:pdf_text/pdf_text.dart';

class PDFRuleParser {
  Future<List<Rule>> parseRulebook(File pdfFile) async {
    // 1. PDF öffnen
    final doc = await PDFDoc.fromFile(pdfFile);
    
    // 2. Text extrahieren
    final text = await doc.text;
    
    // 3. Regeln parsen (Regex + Heuristiken)
    final rules = _extractRules(text);
    
    // 4. Tabellen parsen (wenn möglich)
    final tables = await _extractTables(doc);
    
    return rules;
  }
  
  List<Rule> _extractRules(String text) {
    // Beispiel: Regel-Patterns suchen
    final rulePattern = RegExp(
      r'^(Attribute|Skill|Magic):\s*(.+)$',
      multiLine: true,
    );
    
    return rulePattern.allMatches(text)
      .map((match) => Rule(
        type: match.group(1)!,
        content: match.group(2)!,
      ))
      .toList();
  }
  
  Future<List<Table>> _extractTables(PDFDoc doc) async {
    // pdf_text hat experimentelle Tabellen-Unterstützung
    // Für MVP: Einfache Tabellen mit Regex
    // Post-MVP: Auf pdfium wechseln für bessere Erkennung
    return [];
  }
}
```

#### 2.4.4 Post-MVP: Wechsel zu pdfium

Falls pdf_text nicht ausreicht, kann auf **pdfium** (Google's PDF library) gewechselt werden:

**Vorteile pdfium**:
- ✅ **Beste Tabellen-Erkennung**: Layout-Analyse, Spalten-Erkennung
- ✅ **OCR Integration**: Via Tesseract für gescannte PDFs
- ✅ **Sehr robust**: Wird von Google für Chrome maintained
- ✅ **Komplexe PDFs**: Handles auch schwierige Layouts

**Nachteile pdfium**:
- ❌ **Große Binaries**: pdfium.dll ~20MB (Desktop), ähnlich auf Mobile
- ❌ **Ältere API**: Callback-basiert, weniger Dart-idiomatisch
- ❌ **Längere Build-Zeiten**: Native Code muss kompiliert werden

**Migration-Pfad**:
```
MVP (Woche 11-12):
  - pdf_text für Text-Extraktion
  - Einfache Tabellen mit Regex
  - Manueller Import als Fallback

Post-MVP (v1.1+):
  - pdfium integrieren
  - Bessere Tabellen-Erkennung
  - OCR für gescannte PDFs
  - Automatische Regel-Extraktion verbessern
```

### 2.5 Validierung & Business Rules
- **Paket**: `freezed` + `json_annotation`
  - Immutable Data Classes
  - Automatische Equals/HashCode
  - JSON Serialisierung

- **Paket**: `fast_immutable_collections`
  - Performance-optimierte Collections für Regel-Daten

### 2.6 Export-Formate
- **PDF**: `pdf` Package (Flutter-PDF-Generierung)
- **JSON**: `dart:convert` (Standard)
- **XML**: `xml` Package
- **Foundry VTT**: Custom JSON-Serializer

### 2.7 Dependency Injection
- **Riverpod** (bereits in State Management enthalten)
- Kein zusätzliches DI-Framework nötig

### 2.8 Logging & Debugging
- **Paket**: `logger`
- Strukturiertes Logging für Regel-Engine
- Performance-Monitoring für komplexe Berechnungen

---

## 3. State Management Architektur

### 3.1 Riverpod Provider-Hierarchie

```
┌──────────────────────────────────────────┐
│  Root Provider (App-Start)               │
│  - DatabaseProvider                       │
│  - RuleEngineProvider                     │
│  - SettingsProvider                       │
└──────────────────────────────────────────┘
           ↓                    ↓
┌──────────────────┐   ┌──────────────────┐
│ RuleEngineProvider│   │ SettingsProvider │
│ - Lädt Regelwerke │   │ - UI-Einstellungen│
│ - Validierung     │   │ - Hausregeln     │
│ - Berechnungen    │   │ - Sprache        │
└──────────────────┘   └──────────────────┘
           ↓
┌──────────────────────────────────────────┐
│ CharacterProvider (StateNotifier)         │
│ - Aktueller Charakter                     │
│ - CRUD-Operationen                        │
└──────────────────────────────────────────┘
           ↓
┌──────────────────────────────────────────┐
│ Feature Providers (Ableitungen)           │
│ - attributesProvider                      │
│ - skillsProvider                          │
│ - magicProvider                           │
│ - equipmentProvider                       │
│ - validationErrorsProvider                │
└──────────────────────────────────────────┘
```

### 3.2 State Flow Beispiel: Charakter-Erstellung

```
User Input (Slider für Strength)
    ↓
CharacterNotifier.updateAttribute('strength', value)
    ↓
RuleEngine.validate(character) → Prüft Limits, Voraussetzungen
    ↓
State Update: characterProvider.state = updatedCharacter
    ↓
UI Rebuild: Alle abhängigen Widgets aktualisieren
    ↓
- Attribute-Widget zeigt neuen Wert
- Kosten-Berechnung aktualisiert sich
- Validation-Errors aktualisieren sich
```

---

## 4. Repository Pattern Implementierung

### 4.1 Repository-Interfaces (Domain Layer)

```dart
// Abstrakte Interfaces
abstract class RuleRepository {
  Future<List<Rule>> getAllRules();
  Future<Rule?> getRuleById(int id);
  Future<List<Rule>> getRulesByType(RuleType type);
  Future<void> importRulebook(File file);
  Future<List<Rulebook>> getAllRulebooks();
  Future<void> migrateRules(int fromVersion, int toVersion);
}

abstract class CharacterRepository {
  Future<Character?> getCharacter(int id);
  Future<List<Character>> getAllCharacters();
  Future<void> saveCharacter(Character character);
  Future<void> deleteCharacter(int id);
}

abstract class EquipmentRepository {
  Future<List<Equipment>> searchEquipment(String query);
  Future<List<Equipment>> getEquipmentByType(EquipmentType type);
}
```

### 4.2 Repository-Implementierungen (Infrastructure Layer)

```dart
class DriftRuleRepository implements RuleRepository {
  final AppDatabase _database;
  
  DriftRuleRepository(this._database);
  
  @override
  Future<List<Rule>> getAllRules() async {
    return await _database.select(_database.rules).get();
  }
  
  @override
  Future<void> importRulebook(File file) async {
    // PDF-Parsing + Datenbank-Insert
    final parser = PdfRuleParser();
    final rules = await parser.parse(file);
    await _database.batch((batch) {
      batch.insertAll(_database.rules, rules);
    });
  }
}
```

---

## 5. Regel-Engine Architektur

### 5.1 Zentralisierte Regel-Engine (Entscheidung aus 1-1-Regelinteraktionen.md §5.3)

```dart
class RuleEngine {
  final RuleRepository _ruleRepository;
  final CalculationContext _context;
  
  RuleEngine(this._ruleRepository) : _context = CalculationContext();
  
  // Haupt-Validierungsmethode
  ValidationResult validate(Character character) {
    final errors = <ValidationError>[];
    
    // 1. Grundregeln prüfen (Probenmechanik, etc.)
    errors.addAll(_validateCoreRules(character));
    
    // 2. Attributs-Limits prüfen
    errors.addAll(_validateAttributes(character));
    
    // 3. Prioritäts-Regeln prüfen
    errors.addAll(_validatePrioritySystem(character));
    
    // 4. Magie/Ressonanz-Interaktionen prüfen
    if (character.hasMagic) {
      errors.addAll(_validateMagicRules(character));
    }
    
    // 5. Vor- und Nachteile-Voraussetzungen prüfen
    errors.addAll(_validateQualities(character));
    
    return ValidationResult(errors);
  }
  
  // Berechnungen
  int calculateDicePool(Character character, String skill, int modifier) {
    final attribute = character.getAttributeForSkill(skill);
    final skillValue = character.getSkillValue(skill);
    final edgeBonus = _context.edgeUsed ? 2 : 0;
    
    return attribute + skillValue + modifier + edgeBonus;
  }
  
  // Regel-Abfragen
  List<Rule> getRulesForCharacter(Character character) {
    return _ruleRepository.getAllRules()
      .where((rule) => rule.appliesTo(character))
      .toList();
  }
}
```

### 5.2 Regel-Abhängigkeits-Auflösung

```dart
class RuleDependencyResolver {
  // Topologische Sortierung der Regeln basierend auf Abhängigkeiten
  List<Rule> resolveExecutionOrder(List<Rule> rules) {
    final graph = DependencyGraph<Rule>();
    
    for (final rule in rules) {
      graph.add(rule);
      for (final depId in rule.dependencies) {
        graph.addDependency(rule, depId);
      }
    }
    
    return graph.topologicalSort();
  }
  
  // Zyklus-Erkennung
  bool hasCircularDependency(List<Rule> rules) {
    // Implementierung mit Depth-First Search
  }
}
```

---

## 6. Plugin-System für Hausregeln

### 6.1 Architektur-Entscheidung (aus 1-1-Regelinteraktionen.md §5.3)

```dart
// Basis-Interface für Regel-Erweiterungen
abstract class RulePlugin {
  String get name;
  String get version;
  bool isEnabled;
  
  void registerRules(RuleRegistry registry);
  void registerValidators(ValidationRegistry registry);
  void registerCalculators(CalculationRegistry registry);
}

// Beispiel: Hausregel-Plugin
class CustomKarmaPlugin implements RulePlugin {
  @override
  String get name => 'Custom Karma Rules';
  
  @override
  void registerCalculators(CalculationRegistry registry) {
    registry.registerCalculator('karma_cost', CustomKarmaCalculator());
  }
}

// Plugin-Loader
class PluginManager {
  final List<RulePlugin> _plugins = [];
  
  void loadPlugin(RulePlugin plugin) {
    if (plugin.isEnabled) {
      plugin.registerRules(_ruleRegistry);
      plugin.registerValidators(_validationRegistry);
      plugin.registerCalculators(_calculationRegistry);
      _plugins.add(plugin);
    }
  }
}
```

---

## 7. Update-Mechanismus für Regelwerke

### 7.1 Versionsverwaltung

```dart
class RulebookVersion {
  final String rulebookId;    // Z.B. "SR2-CoreRules-DE"
  final String version;       // Semantische Version: "1.2.0"
  final DateTime releaseDate;
  final String changelog;
  final int schemaVersion;    // Datenbank-Schema-Version
  
  bool isUpdateAvailable(RulebookVersion current) {
    return version != current.version;
  }
}
```

### 7.2 Update-Strategie

**Option A: Automatische Updates (Online-Modus)**
```
1. App-Start: Prüfe auf Updates (wenn Online)
2. Vergleiche lokale Version mit Remote-Version
3. Download neues Regelwerk (Delta-Update wenn möglich)
4. Parse PDF → Extrahiere Regeln
5. Migration: Alte Regeln → Neue Regeln (via Migrations-Skript)
6. Validierung: Prüfe Charakter-Kompatibilität
7. Benachrichtige User über verfügbares Update
```

**Option B: Manuelle Updates (Offline-Modus)**
```
1. User importiert PDF manuell
2. App erkennt Regelwerk-Version
3. Zeige Changelog und Migrations-Hinweise
4. Parse + Migrate + Validierung
```

### 7.3 Migrationsmechanismen

```dart
abstract class RuleMigration {
  int fromVersion;
  int toVersion;
  
  Future<void> migrate(Database db);
}

class AttributeLimitMigration implements RuleMigration {
  @override
  int fromVersion = 1;
  @override
  int toVersion = 2;
  
  @override
  Future<void> migrate(Database db) async {
    // Beispiel: Max-Attribut-Limit von 10 auf 12 erhöht
    await db.update(db.rules).write(
      RuleCompanion.insert(
        ruleKey: 'max_attribute_limit',
        dataJson: jsonEncode({'max': 12}),
      ),
    );
  }
}

class MigrationRunner {
  Future<void> runMigrations(Database db, int currentVersion) async {
    final migrations = <RuleMigration>[
      AttributeLimitMigration(),
      MagicCostMigration(),
      // ... weitere Migrationen
    ];
    
    for (final migration in migrations) {
      if (migration.fromVersion >= currentVersion) {
        await migration.migrate(db);
      }
    }
  }
}
```

### 7.4 Update-Erkennung (Checksum-basiert)

```dart
class RulebookUpdateChecker {
  Future<bool> hasUpdate(String rulebookId, String localChecksum) async {
    // Option 1: Online-Check (wenn Backend verfügbar)
    final remoteChecksum = await _api.getLatestChecksum(rulebookId);
    return localChecksum != remoteChecksum;
    
    // Option 2: Lokal (User importiert PDF)
    // Prüfe ob PDF bereits importiert (anhand von Dateinamen + Größe)
  }
  
  Future<String> calculateChecksum(File pdfFile) async {
    final bytes = await pdfFile.readAsBytes();
    return md5.convert(bytes).toString();
  }
}
```

---

## 8. Performance-Optimierungen

### 8.1 Caching-Strategien

```dart
// Riverpod-Cache für häufige Berechnungen
final dicePoolCacheProvider = Provider<DicePoolCache>((ref) {
  return DicePoolCache();
});

class DicePoolCache {
  final Map<String, int> _cache = {};
  
  int getDicePool(Character character, String skill, int modifier) {
    final key = '${character.id}_$skill_$modifier';
    return _cache[key] ??= _calculate(character, skill, modifier);
  }
  
  void invalidate(String characterId) {
    _cache.removeWhere((key, _) => key.startsWith(characterId));
  }
}
```

### 8.2 Lazy Loading für große Datenmengen

```dart
class LazyEquipmentRepository implements EquipmentRepository {
  final int pageSize = 50;
  
  @override
  Future<PagedResult<Equipment>> searchEquipment(String query, int page) async {
    final offset = page * pageSize;
    final items = await _database.select(_database.equipment)
      .where((e) => e.name.like('%$query%'))
      .limit(pageSize, offset: offset)
      .get();
    
    return PagedResult(
      items: items,
      hasMore: items.length == pageSize,
    );
  }
}
```

### 8.3 Isolates für rechenintensive Operationen

```dart
Future<ValidationResult> validateInIsolate(Character character) async {
  return await compute(_validateCharacterIsolate, character);
}

ValidationResult _validateCharacterIsolate(Character character) {
  // Läuft in separatem Isolate, blockiert UI nicht
  final engine = RuleEngine();
  return engine.validate(character);
}
```

---

## 9. Architektur-Entscheidungen (Zusammenfassung)

### 9.1 Getroffene Entscheidungen

| Bereich | Entscheidung | Begründung |
|---------|-------------|------------|
| **State Management** | Riverpod 2.x | Compile-time safety, Testbarkeit, Caching |
| **Datenbank** | Drift (SQLite) | Type-safe, Migrations, Reactive Queries |
| **Architektur-Muster** | Clean Architecture + Feature-First | Separation of Concerns, Testbarkeit |
| **Regel-Engine** | Zentralisierte Engine | Konsistente Regelverarbeitung (siehe 1-1 §5.3) |
| **Hausregeln** | Plugin-System | Flexible Erweiterbarkeit (siehe 1-1 §5.3) |
| **PDF-Import** | pdfx/pdf_text | Multi-Plattform, Tabellen-Erkennung |
| **Dependency Injection** | Riverpod (integriert) | Kein zusätzliches Framework nötig |
| **Validierung** | Zentralisiert | Konsistente Prüfung (siehe 1-1 §5.2) |

### 9.2 Begründete Abgrenzungen

**Nicht verwendet**:
- ❌ **Bloc**: Zu viel Boilerplate, steilere Lernkurve
- ❌ **GetX**: Weniger type-safe, "Magic"-Methoden
- ❌ **Provider (alt)**: Riverpod ist Nachfolger mit besserer API
- ❌ **Hive**: Kein SQL-Support, schlechter für komplexe Queries
- ❌ **Firebase**: Offline-First erforderlich, keine Online-Zwänge (siehe 1-Anforderungsanalyse §6.4)

---

## 10. Implementierungsreihenfolge (Detailliert)

### Phase 1: Grundgerüst (Woche 1-2)
- [ ] Projekt-Setup mit Drift + Riverpod
- [ ] Datenbank-Schema implementieren
- [ ] Basis-Repository-Interfaces definieren
- [ ] RuleEngine-Grundgerüst erstellen
- [ ] Erste Unit-Tests für Regel-Engine

### Phase 2: Core Rules (Woche 3-4)
- [ ] Probenmechanik implementieren (Würfelsystem)
- [ ] Attributsystem mit Limits
- [ ] Priority-System Grundgerüst
- [ ] Fertigkeitssystem Basis
- [ ] Erste Validierungstests

### Phase 3: Character Creation (Woche 5-6)
- [ ] Character-Repository implementieren
- [ ] UI für Charakter-Erstellung (Riverpod-Integration)
- [ ] Regel-Validierung in Echtzeit
- [ ] Kostenberechnung (Karma, Ressourcen)

### Phase 4: Erweiterte Systeme (Woche 7-8)
- [ ] Edge-System
- [ ] Initiative-System
- [ ] Schadenssystem
- [ ] Vor- und Nachteile mit Voraussetzungsprüfung

### Phase 5: Magie & Spezial (Woche 9-10)
- [ ] Magie-System (Magier, Adept)
- [ ] Essence-Berechnung
- [ ] Fokus-System
- [ ] Initiation-Regeln

### Phase 6: Erweiterte Features (Woche 11-12)
- [ ] PDF-Import-Service
- [ ] Regelwerks-Update-Mechanismus
- [ ] Export-Funktionen (PDF, JSON, XML)
- [ ] Plugin-System für Hausregeln

### Phase 7: Polish & Testing (Woche 13-14)
- [ ] Umfassende Integrationstests
- [ ] Performance-Optimierungen
- [ ] UI/UX-Verbesserungen
- [ ] Dokumentation

---

## 11. Risiken und Mitigation

### 11.1 Technische Risiken

| Risiko | Wahrscheinlichkeit | Impact | Mitigation |
|--------|-------------------|--------|------------|
| **PDF-Parsing ungenau** | Hoch | Hoch | Fallback zu manuellem Import, OCR für gescannte PDFs |
| **Performance bei komplexen Regeln** | Mittel | Mittel | Caching, Isolates, Lazy Loading |
| **Datenbank-Migrationen fehlerhaft** | Mittel | Hoch | Umfassende Migrationstests, Rollback-Strategie |
| **Regel-Interpretationsfehler** | Hoch | Hoch | Experten-Review, Vergleich mit Chummer5E |

### 11.2 Architektur-Risiken

| Risiko | Mitigation |
|--------|------------|
| **Zu komplexe Regel-Engine** | MVP-Ansatz: Nur Core Rules zuerst, iterativ erweitern |
| **Riverpod-Learning-Curve** | Dokumentation, Code-Beispiele, Pair Programming |
| **Cross-Platform-Kompatibilität** | Frühzeitiges Testing auf allen Plattformen |

---

## 12. Nächste Schritte

1. **Projekt-Setup**: Flutter-Projekt mit Drift + Riverpod initialisieren
2. **Proof-of-Concept**: Probenmechanik + Priority-System als erstes Feature
3. **Datenbank-Design**: Finales Schema in Drift definieren
4. **Regel-Extraktion**: Erste PDFs parsen und Regeln extrahieren
5. **Experten-Review**: Shadowrun-Experten für Regelkorrektheit konsultieren

---

## Referenzen

- Hauptdokument: `1-Anforderungsanalyse.md`
- Regelinteraktionen: `1-1-Regelinteraktionen.md`
- Besonders: §6.1.1 (Architektur-Entscheidungen), §5.3 (Architektur-Entscheidungen)