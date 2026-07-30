Bezugnehmend auf "1-Anforderungsanalyse.md", "1-1-Regelinteraktionen.md" und "2-Architektur.md"

# Datenmodelle - Shadowrun 2. Edition Charaktergenerator

## 1. Überblick und Prinzipien

### 1.1 Architektur-Konformität
- **Clean Architecture**: Domain Models in `lib/domain/entities/`, Database Models in `lib/infrastructure/models/`
- **Immutability**: Alle Models sind immutable (freezed)
- **Type Safety**: Starke Typisierung mit Dart 3.x Features
- **Serialisierung**: JSON für Export/Import, Drift für Persistenz

### 1.2 Technologie-Entscheidungen
- **ORM**: Drift (generierte Datenbank-Klassen)
- **Model-Definition**: freezed + json_annotation
- **Validierung**: Built-in Validierung in Entity-Konstruktoren
- **Beziehungen**: Drift Foreign Keys + Dart Extension Methods

---

## 2. Core Domain Models (lib/domain/entities/)

### 2.1 Character Entity

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character {
  const Character({
    required this.id,
    required this.name,
    required this.concept,
    required this.metatype,
    required this.attributes,
    required this.skills,
    required this.qualities,
    required this.magicPath,
    required this.equipment,
    required this.finances,
    required this.background,
    required this.creationData,
    required this.metadata,
  });
  
  final int? id;
  final String name;
  final String? concept;
  final Metatype metatype;
  final Attributes attributes;
  final Skills skills;
  final Qualities qualities;
  final MagicPath? magicPath;
  final Equipment equipment;
  final Finances finances;
  final Background background;
  final CreationData creationData;
  final CharacterMetadata metadata;
  
  factory Character.fromJson(Map<String, dynamic> json) => 
      _$CharacterFromJson(json);
  
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@freezed
class Attributes with _$Attributes {
  const Attributes({
    required this.body,
    required this.quickness,
    required this.strength,
    required this.charisma,
    required this.intelligence,
    required this.willpower,
    required this.essence,
    required this.magicOrResonance,
    required this.edge,
    required this.initiative,
    required this.liftCapacity,
    required this.walkRate,
  });
  
  final int body;
  final int quickness;
  final int strength;
  final int charisma;
  final int intelligence;
  final int willpower;
  final double essence;  // Kann Dezimalwerte haben (z.B. 5.5)
  final int magicOrResonance;
  final int edge;
  final int initiative;
  final int liftCapacity;      // Berechnet: Strength * 15
  final int walkRate;          // Berechnet: Quickness * 2
  
  factory Attributes.fromJson(Map<String, dynamic> json) => 
      _$AttributesFromJson(json);
  
  Map<String, dynamic> toJson() => _$AttributesToJson(this);
  
  // Berechnete Properties
  int get totalPhysical => body + quickness + strength;
  int get totalMental => intelligence + willpower + charisma;
}

@freezed
class Skills with _$Skills {
  const Skills({
    required this.activeSkills,
    required this.passiveSkills,
    required this.skillGroups,
    required this.specializations,
  });
  
  final Map<String, int> activeSkills;      // 'firearms': 4
  final Map<String, int> passiveSkills;     // 'perception': 3
  final Map<String, int> skillGroups;       // 'firearms_group': 2
  final Map<String, List<String>> specializations; // 'firearms': ['pistols', 'rifles']
  
  factory Skills.fromJson(Map<String, dynamic> json) => 
      _$SkillsFromJson(json);
  
  Map<String, dynamic> toJson() => _$SkillsToJson(this);
  
  int getSkillLevel(String skillName) {
    return activeSkills[skillName] ?? 
           passiveSkills[skillName] ?? 
           0;
  }
}

@freezed
class Qualities with _$Qualities {
  const Qualities({
    required this.positive,
    required this.negative,
  });
  
  final Map<String, Quality> positive;  // 'quick_healing': Quality(...)
  final Map<String, Quality> negative;  // 'allergy': Quality(...)
  
  factory Qualities.fromJson(Map<String, dynamic> json) => 
      _$QualitiesFromJson(json);
  
  Map<String, dynamic> toJson() => _$QualitiesToJson(this);
  
  int getTotalKarmaCost() {
    return positive.values.fold(0, (sum, q) => sum + q.karmaCost) -
           negative.values.fold(0, (sum, q) => sum + q.karmaCost);
  }
}

@freezed
class Quality with _$Quality {
  const Quality({
    required this.id,
    required this.name,
    required this.description,
    required this.karmaCost,
    required this.prerequisites,
    required this.source,
  });
  
  final String id;
  final String name;
  final String description;
  final int karmaCost;
  final List<Prerequisite> prerequisites;
  final String source;  // 'core', 'chromebook', 'custom'
  
  factory Quality.fromJson(Map<String, dynamic> json) => 
      _$QualityFromJson(json);
  
  Map<String, dynamic> toJson() => _$QualityToJson(this);
}

@freezed
class MagicPath with _$MagicPath {
  const MagicPath({
    required this.type,
    required this.magicAttribute,
    required this.spells,
    required this.spirits,
    required this.foci,
    required this.initiationGrade,
    required this.adeptPowers,
  });
  
  final MagicType type;  // 'mage', 'adept', 'technomancer'
  final int magicAttribute;
  final List<Spell> spells;
  final List<Spirit> spirits;
  final List<Focus> foci;
  final int initiationGrade;
  final List<AdeptPower> adeptPowers;
  
  factory MagicPath.fromJson(Map<String, dynamic> json) => 
      _$MagicPathFromJson(json);
  
  Map<String, dynamic> toJson() => _$MagicPathToJson(this);
}

enum MagicType { mage, adept, technomancer, none }
```

### 2.2 Equipment Models

```dart
@freezed
class Equipment with _$Equipment {
  const Equipment({
    required this.weapons,
    required this.armor,
    this.cyberware,
    this.bioware,
    required this.gear,
    required this.vehicles,
  });
  
  final List<Weapon> weapons;
  final List<Armor> armor;
  final List<Cyberware>? cyberware;
  final List<Bioware>? bioware;
  final List<Gear> gear;
  final List<Vehicle> vehicles;
  
  factory Equipment.fromJson(Map<String, dynamic> json) => 
      _$EquipmentFromJson(json);
  
  Map<String, dynamic> toJson() => _$EquipmentToJson(this);
  
  int getTotalEssenceCost() {
    return (cyberware?.fold(0, (sum, c) => sum + c.essenceCost) ?? 0) +
           (bioware?.fold(0, (sum, b) => sum + b.essenceCost) ?? 0);
  }
  
  int getTotalAvailability() {
    // Höchste Availability aller Items
    final allItems = [...weapons, ...armor, ...?cyberware, ...?bioware, ...gear];
    if (allItems.isEmpty) return 0;
    return allItems.map((e) => e.availability).reduce(math.max);
  }
}

@freezed
class Weapon with _$Weapon {
  const Weapon({
    required this.id,
    required this.name,
    required this.weaponType,
    required this.damage,
    required this.ap,
    required this.mode,
    required this.ammo,
    required this.recoil,
    required this.cost,
    required this.availability,
    required this.legality,
    required this.special,
  });
  
  final String id;
  final String name;
  final WeaponType weaponType;
  final Damage damage;
  final int ap;  // Armor Piercing
  final List<FireMode> mode;
  final int ammo;
  final int recoil;
  final int cost;
  final int availability;
  final bool legality;
  final List<String> special;
  
  factory Weapon.fromJson(Map<String, dynamic> json) => 
      _$WeaponFromJson(json);
  
  Map<String, dynamic> toJson() => _$WeaponToJson(this);
}

@freezed
class Damage with _$Damage {
  const Damage({
    required this.base,
    required this.type,  // 'physical', 'stun', 'special'
  });
  
  final int base;
  final String type;
  
  factory Damage.fromJson(Map<String, dynamic> json) => 
      _$DamageFromJson(json);
  
  Map<String, dynamic> toJson() => _$DamageToJson(this);
}

enum WeaponType { holdout, lightPistol, heavyPistol, smg, rifle, shotgun, 
                  heavyWeapon, melee, thrown, bow, crossbow }
enum FireMode { single, semiAuto, burstFire, fullAuto }

@freezed
class Armor with _$Armor {
  const Armor({
    required this.id,
    required this.name,
    required this.armorRating,
    required this.cost,
    required this.availability,
    required this.modifications,
    required this.special,
  });
  
  final String id;
  final String name;
  final int armorRating;
  final int cost;
  final int availability;
  final List<ArmorModification> modifications;
  final List<String> special;
  
  factory Armor.fromJson(Map<String, dynamic> json) => 
      _$ArmorFromJson(json);
  
  Map<String, dynamic> toJson() => _$ArmorToJson(this);
  
  int getEffectiveArmor() {
    return armorRating + 
           modifications.fold(0, (sum, mod) => sum + mod.armorBonus);
  }
}

@freezed
class Cyberware with _$Cyberware {
  const Cyberware({
    required this.id,
    required this.name,
    required this.cyberwareType,
    required this.essenceCost,
    required this.cost,
    required this.availability,
    required this.stats,
    required this.special,
  });
  
  final String id;
  final String name;
  final CyberwareType cyberwareType;
  final double essenceCost;
  final int cost;
  final int availability;
  final Map<String, dynamic> stats;  // {'strength_bonus': 3}
  final List<String> special;
  
  factory Cyberware.fromJson(Map<String, dynamic> json) => 
      _$CyberwareFromJson(json);
  
  Map<String, dynamic> toJson() => _$CyberwareToJson(this);
}

enum CyberwareType { 
  headware, eyeware, earware, bodyware, cyberlimb, 
  dataprocessor, neural, bioware, other 
}

@freezed
class Vehicle with _$Vehicle {
  const Vehicle({
    required this.id,
    required this.name,
    required this.vehicleType,
    required this.handling,
    required this.acceleration,
    required this.speed,
    required this.body,
    required this.armor,
    required this.sensor,
    required this.cost,
    required this.availability,
    required this.modifications,
  });
  
  final String id;
  final String name;
  final VehicleType vehicleType;
  final int handling;
  final int acceleration;
  final int speed;
  final int body;
  final int armor;
  final int sensor;
  final int cost;
  final int availability;
  final List<VehicleModification> modifications;
  
  factory Vehicle.fromJson(Map<String, dynamic> json) => 
      _$VehicleFromJson(json);
  
  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}

enum VehicleType { car, bike, truck, boat, aircraft, drone, other }
```

### 2.3 Background & NPC Models

```dart
@freezed
class Background with _$Background {
  const Background({
    required this.contacts,
    required this.lifestyle,
    required this.history,
    required this.notes,
  });
  
  final List<Contact> contacts;
  final Lifestyle lifestyle;
  final List<HistoryEvent> history;
  final String notes;
  
  factory Background.fromJson(Map<String, dynamic> json) => 
      _$BackgroundFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackgroundToJson(this);
}

@freezed
class Contact with _$Contact {
  const Contact({
    required this.id,
    required this.name,
    required this.role,
    required this.connection,
    required this.loyalty,
    required this.notes,
    required this.metatype,
  });
  
  final String id;
  final String name;
  final String role;        // 'fixer', 'decker', 'street_samurai'
  final int connection;     // 1-6
  final int loyalty;        // 1-6
  final String notes;
  final String metatype;    // 'human', 'elf', 'dwarf', etc.
  
  factory Contact.fromJson(Map<String, dynamic> json) => 
      _$ContactFromJson(json);
  
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

@freezed
class Lifestyle with _$Lifestyle {
  const Lifestyle({
    required this.type,
    required this.cost,
    required this.month,
    required this.comforts,
    required this.security,
    required this.neighborhood,
  });
  
  final LifestyleType type;
  final int cost;
  final int month;
  final int comforts;        // 1-6
  final int security;        // 1-6
  final String neighborhood;
  
  factory Lifestyle.fromJson(Map<String, dynamic> json) => 
      _$LifestyleFromJson(json);
  
  Map<String, dynamic> toJson() => _$LifestyleToJson(this);
}

enum LifestyleType { 
  street, low, middle, high, luxury, custom 
}

@freezed
class Npc with _$Npc {
  const Npc({
    required this.id,
    required this.name,
    required this.metatype,
    required this.role,
    required this.attributes,
    required this.skills,
    required this.gear,
    required this.notes,
    required this.isHostile,
  });
  
  final String id;
  final String name;
  final String metatype;
  final String role;        // 'security', 'corporate', 'street', etc.
  final Attributes attributes;
  final Map<String, int> skills;
  final List<String> gear;
  final String notes;
  final bool isHostile;
  
  factory Npc.fromJson(Map<String, dynamic> json) => 
      _$NpcFromJson(json);
  
  Map<String, dynamic> toJson() => _$NpcToJson(this);
}
```

### 2.4 Matrix & Host Models

```dart
@freezed
class Host with _$Host {
  const Host({
    required this.id,
    required this.name,
    required this.hostType,
    required this.security,
    required this.systems,
    required this.ice,
    required this.access,
    required this.notes,
  });
  
  final String id;
  final String name;
  final HostType hostType;
  final int security;       // 1-6
  final List<MatrixSystem> systems;
  final List<ICE> ice;
  final List<AccessLevel> access;
  final String notes;
  
  factory Host.fromJson(Map<String, dynamic> json) => 
      _$HostFromJson(json);
  
  Map<String, dynamic> toJson() => _$HostToJson(this);
}

enum HostType { 
  public, corporate, government, military, black, unknown 
}

@freezed
class MatrixSystem with _$MatrixSystem {
  const MatrixSystem({
    required this.id,
    required this.name,
    required this.systemType,
    required this.rating,
    required this.data,
    required this.ice,
  });
  
  final String id;
  final String name;
  final SystemType systemType;
  final int rating;
  final List<DataFile> data;
  final List<String> ice;
  
  factory MatrixSystem.fromJson(Map<String, dynamic> json) => 
      _$MatrixSystemFromJson(json);
  
  Map<String, dynamic> toJson() => _$MatrixSystemToJson(this);
}

enum SystemType { 
  access, control, data, index, security, other 
}

@freezed
class ICE with _$ICE {
  const ICE({
    required this.id,
    required this.name,
    required this.iceType,
    required this.rating,
    required this.programs,
    required this.special,
  });
  
  final String id;
  final String name;
  final ICEType iceType;
  final int rating;
  final List<String> programs;
  final List<String> special;
  
  factory ICE.fromJson(Map<String, dynamic> json) => 
      _$ICEFromJson(json);
  
  Map<String, dynamic> toJson() => _$ICEToJson(this);
}

enum ICEType { 
  probe, blackIce, killer, guardian, alarm, other 
}

@freezed
class DataFile with _$DataFile {
  const DataFile({
    required this.id,
    required this.name,
    required this.fileType,
    required this.size,
    required this.encryption,
    required this.content,
  });
  
  final String id;
  final String name;
  final String fileType;
  final int size;
  final int encryption;  // Encryption rating
  final String content;
  
  factory DataFile.fromJson(Map<String, dynamic> json) => 
      _$DataFileFromJson(json);
  
  Map<String, dynamic> toJson() => _$DataFileToJson(this);
}
```

### 2.5 Supporting Models

```dart
@freezed
class Metatype with _$Metatype {
  const Metatype({
    required this.id,
    required this.name,
    required this.bonus,
    required this.limits,
    required this.specialAttributes,
  });
  
  final String id;
  final String name;
  final Map<String, int> bonus;        // {'strength': 1, 'quickness': 2}
  final Map<String, int> limits;        // {'physical': 9, 'mental': 8}
  final List<String> specialAttributes; // ['low-light_vision', 'hardened_skin']
  
  factory Metatype.fromJson(Map<String, dynamic> json) => 
      _$MetatypeFromJson(json);
  
  Map<String, dynamic> toJson() => _$MetatypeToJson(this);
}

@freezed
class CreationData with _$CreationData {
  const CreationData({
    required this.priority,
    required this.points,
    required this.karma,
    required this.totalKarmaSpent,
    required this.totalResourcesSpent,
  });
  
  final PrioritySelection priority;
  final CreationPoints points;
  final int karma;
  final int totalKarmaSpent;
  final int totalResourcesSpent;
  
  factory CreationData.fromJson(Map<String, dynamic> json) => 
      _$CreationDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$CreationDataToJson(this);
}

@freezed
class PrioritySelection with _$PrioritySelection {
  const PrioritySelection({
    required this.metatype,
    required this.attributes,
    required this.skills,
    required this.magic,
    required this.resources,
  });
  
  final PriorityLevel metatype;
  final PriorityLevel attributes;
  final PriorityLevel skills;
  final PriorityLevel magic;
  final PriorityLevel resources;
  
  factory PrioritySelection.fromJson(Map<String, dynamic> json) => 
      _$PrioritySelectionFromJson(json);
  
  Map<String, dynamic> toJson() => _$PrioritySelectionToJson(this);
}

enum PriorityLevel { A, B, C, D, E }

@freezed
class CreationPoints with _$CreationPoints {
  const CreationPoints({
    required this.attributePoints,
    required this.skillPoints,
    required this.magicPoints,
    required this.resourcePoints,
  });
  
  final int attributePoints;
  final int skillPoints;
  final int magicPoints;
  final int resourcePoints;
  
  factory CreationPoints.fromJson(Map<String, dynamic> json) => 
      _$CreationPointsFromJson(json);
  
  Map<String, dynamic> toJson() => _$CreationPointsToJson(this);
}

@freezed
class Finances with _$Finances {
  const Finances({
    required this.availableNuyen,
    required this.totalEarned,
    required this.totalSpent,
    required this.lifestyleCost,
  });
  
  final int availableNuyen;
  final int totalEarned;
  final int totalSpent;
  final int lifestyleCost;
  
  factory Finances.fromJson(Map<String, dynamic> json) => 
      _$FinancesFromJson(json);
  
  Map<String, dynamic> toJson() => _$FinancesToJson(this);
}

@freezed
class CharacterMetadata with _$CharacterMetadata {
  const CharacterMetadata({
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.rulebookVersion,
    required this.tags,
  });
  
  final DateTime createdAt;
  final DateTime updatedAt;
  final String version;           // App-Version
  final String rulebookVersion;   // Z.B. "SR2-CoreRules-DE-1.2.0"
  final List<String> tags;
  
  factory CharacterMetadata.fromJson(Map<String, dynamic> json) => 
      _$CharacterMetadataFromJson(json);
  
  Map<String, dynamic> toJson() => _$CharacterMetadataToJson(this);
}

// Supporting Types
@freezed
class Prerequisite with _$Prerequisite {
  const Prerequisite({
    required this.type,
    required this.condition,
    required this.value,
  });
  
  final String type;      // 'attribute', 'skill', 'quality', 'metatype'
  final String condition; // '>=', '<=', '==', 'exists'
  final dynamic value;
  
  factory Prerequisite.fromJson(Map<String, dynamic> json) => 
      _$PrerequisiteFromJson(json);
  
  Map<String, dynamic> toJson() => _$PrerequisiteToJson(this);
}

@freezed
class Spell with _$Spell {
  const Spell({
    required this.id,
    required this.name,
    required this.spellType,
    required this.range,
    required this.duration,
    required this.damage,
    required this.cost,
    required this.description,
  });
  
  final String id;
  final String name;
  final SpellType spellType;
  final String range;
  final String duration;
  final String damage;
  final int cost;
  final String description;
  
  factory Spell.fromJson(Map<String, dynamic> json) => 
      _$SpellFromJson(json);
  
  Map<String, dynamic> toJson() => _$SpellToJson(this);
}

enum SpellType { combat, detection, health, illusion, manipulation, other }

@freezed
class Spirit with _$Spirit {
  const Spirit({
    required this.id,
    required this.name,
    required this.spiritType,
    required this.force,
    required this.services,
  });
  
  final String id;
  final String name;
  final String spiritType;
  final int force;
  final int services;
  
  factory Spirit.fromJson(Map<String, dynamic> json) => 
      _$SpiritFromJson(json);
  
  Map<String, dynamic> toJson() => _$SpiritToJson(this);
}

@freezed
class Focus with _$Focus {
  const Focus({
    required this.id,
    required this.name,
    required this.focusType,
    required this.force,
    required this.bonded,
  });
  
  final String id;
  final String name;
  final String focusType;
  final int force;
  final bool bonded;
  
  factory Focus.fromJson(Map<String, dynamic> json) => 
      _$FocusFromJson(json);
  
  Map<String, dynamic> toJson() => _$FocusToJson(this);
}

@freezed
class AdeptPower with _$AdeptPower {
  const AdeptPower({
    required this.id,
    required this.name,
    required this.level,
    required this.cost,
    required this.description,
  });
  
  final String id;
  final String name;
  final int level;
  final int cost;
  final String description;
  
  factory AdeptPower.fromJson(Map<String, dynamic> json) => 
      _$AdeptPowerFromJson(json);
  
  Map<String, dynamic> toJson() => _$AdeptPowerToJson(this);
}

@freezed
class HistoryEvent with _$HistoryEvent {
  const HistoryEvent({
    required this.id,
    required this.age,
    required this.event,
    required this.type,
  });
  
  final String id;
  final int age;
  final String event;
  final String type;  // 'positive', 'negative', 'neutral'
  
  factory HistoryEvent.fromJson(Map<String, dynamic> json) => 
      _$HistoryEventFromJson(json);
  
  Map<String, dynamic> toJson() => _$HistoryEventToJson(this);
}

@freezed
class AccessLevel with _$AccessLevel {
  const AccessLevel({
    required this.level,
    required this.ic,
    required this.restrictions,
  });
  
  final int level;
  final List<String> ic;
  final List<String> restrictions;
  
  factory AccessLevel.fromJson(Map<String, dynamic> json) => 
      _$AccessLevelFromJson(json);
  
  Map<String, dynamic> toJson() => _$AccessLevelToJson(this);
}
```

---

## 3. Database Models (Drift)

### 3.1 Datenbank-Schema

```dart
// lib/infrastructure/database/app_database.dart
import 'package:drift/drift.dart';

// Tabellen-Definitionen
class Characters extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get concept => text().nullable()();
  TextColumn get metatype => text()();
  TextColumn get attributes => text()();  // JSON
  TextColumn get skills => text()();      // JSON
  TextColumn get qualities => text()();   // JSON
  TextColumn get magicPath => text().nullable()();  // JSON
  TextColumn get equipment => text()();   // JSON
  TextColumn get finances => text()();    // JSON
  TextColumn get background => text()();  // JSON
  TextColumn get creationData => text()(); // JSON
  TextColumn get metadata => text()();    // JSON
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
  TextColumn get rulebookId => integer().references(Rulebooks, #id)();
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
  TextColumn get systems => text()();  // JSON
  TextColumn get ice => text()();      // JSON
  TextColumn get access => text()();   // JSON
  TextColumn get notes => text()();
}

class Locations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get locationId => text()();
  TextColumn get name => text()();
  TextColumn get locationType => text()();
  TextColumn get description => text()();
  TextColumn get connections => text()();  // JSON
  TextColumn get npcs => text()();         // JSON
  TextColumn get security => text()();     // JSON
}
```

### 3.2 Drift Database Klasse

```dart
// lib/infrastructure/database/app_database.dart
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'app_database.g.dart';

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
  AppDatabase(QueryExecutor e) : super(e);
  
  @override
  int get schemaVersion => 1;
  
  // Migration-Strategie
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Migration-Logik hier
    },
  );
  
  // Character-Queries
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
  
  // Rule-Queries
  Future<List<Rule>> getRulesByType(String type) {
    return (select(rules)..where((r) => r.ruleType.equals(type))).get();
  }
  
  Future<List<Rule>> getRulesForCharacter(Character character) {
    // Komplexere Query mit JSON-Filterung
    return (select(rules)..where((r) => r.rulebookId.equals(1))).get();
  }
  
  // Equipment-Queries mit Suche
  Future<List<Equipment>> searchEquipment(String query) {
    return (select(equipment)..where((e) => e.name.like('%$query%'))).get();
  }
  
  // Batch-Operationen für Import
  Future<void> importRules(List<RulesCompanion> entities) {
    return batch((batch) {
      batch.insertAll(rules, entities);
    });
  }
}

// Database-Factory
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'sr2_character_generator.db'));
    return NativeDatabase.createInBackground(file);
  });
}
```

---

## 4. Repository Models (Mapping Layer)

### 4.1 Character Repository

```dart
// lib/domain/repositories/character_repository.dart
abstract class CharacterRepository {
  Future<Character?> getCharacter(int id);
  Future<List<Character>> getAllCharacters();
  Future<Character> saveCharacter(Character character);
  Future<void> deleteCharacter(int id);
  Future<List<Character>> searchCharacters(String query);
}

// lib/infrastructure/repositories/drift_character_repository.dart
class DriftCharacterRepository implements CharacterRepository {
  final AppDatabase _database;
  
  DriftCharacterRepository(this._database);
  
  @override
  Future<Character?> getCharacter(int id) async {
    final entity = await _database.getCharacter(id);
    return entity?.toDomainModel();
  }
  
  @override
  Future<List<Character>> getAllCharacters() async {
    final entities = await _database.getAllCharacters();
    return entities.map((e) => e.toDomainModel()).toList();
  }
  
  @override
  Future<Character> saveCharacter(Character character) async {
    final entity = CharacterEntity.fromDomain(character);
    if (character.id == null) {
      final newId = await _database.insertCharacter(entity);
      return character.copyWith(id: newId);
    } else {
      await _database.updateCharacter(entity);
      return character;
    }
  }
  
  @override
  Future<void> deleteCharacter(int id) async {
    await _database.deleteCharacter(id);
  }
  
  @override
  Future<List<Character>> searchCharacters(String query) async {
    final entities = await _database.getAllCharacters();
    return entities
        .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
        .map((e) => e.toDomainModel())
        .toList();
  }
}

// Extension Methods für Mapping
extension CharacterEntityExtension on CharacterEntity {
  Character toDomainModel() {
    return Character(
      id: id,
      name: name,
      concept: concept,
      metatype: Metatype.fromJson(jsonDecode(metatype)),
      attributes: Attributes.fromJson(jsonDecode(attributes)),
      skills: Skills.fromJson(jsonDecode(skills)),
      qualities: Qualities.fromJson(jsonDecode(qualities)),
      magicPath: magicPath != null ? MagicPath.fromJson(jsonDecode(magicPath!)) : null,
      equipment: Equipment.fromJson(jsonDecode(equipment)),
      finances: Finances.fromJson(jsonDecode(finances)),
      background: Background.fromJson(jsonDecode(background)),
      creationData: CreationData.fromJson(jsonDecode(creationData)),
      metadata: CharacterMetadata.fromJson(jsonDecode(metadata)),
    );
  }
}

extension CharacterDomainExtension on Character {
  CharacterEntity toEntity() {
    return CharacterEntity(
      id: id,
      name: name,
      concept: concept,
      metatype: jsonEncode(metatype.toJson()),
      attributes: jsonEncode(attributes.toJson()),
      skills: jsonEncode(skills.toJson()),
      qualities: jsonEncode(qualities.toJson()),
      magicPath: magicPath?.toJson() != null ? jsonEncode(magicPath!.toJson()) : null,
      equipment: jsonEncode(equipment.toJson()),
      finances: jsonEncode(finances.toJson()),
      background: jsonEncode(background.toJson()),
      creationData: jsonEncode(creationData.toJson()),
      metadata: jsonEncode(metadata.toJson()),
      createdAt: metadata.createdAt,
      updatedAt: DateTime.now(),
    );
  }
}
```

### 4.2 Rule Repository

```dart
// lib/domain/repositories/rule_repository.dart
abstract class RuleRepository {
  Future<List<Rule>> getAllRules();
  Future<Rule?> getRuleById(int id);
  Future<List<Rule>> getRulesByType(RuleType type);
  Future<List<Rule>> getRulesForCharacter(Character character);
  Future<void> importRulebook(Rulebook rulebook);
  Future<List<Rulebook>> getAllRulebooks();
  Future<void> migrateRules(int fromVersion, int toVersion);
}

// lib/infrastructure/repositories/drift_rule_repository.dart
class DriftRuleRepository implements RuleRepository {
  final AppDatabase _database;
  
  DriftRuleRepository(this._database);
  
  @override
  Future<List<Rule>> getAllRules() async {
    final entities = await _database.select(_database.rules).get();
    return entities.map((e) => e.toDomainModel()).toList();
  }
  
  @override
  Future<List<Rule>> getRulesByType(RuleType type) async {
    final entities = await _database.getRulesByType(type.name);
    return entities.map((e) => e.toDomainModel()).toList();
  }
  
  @override
  Future<void> importRulebook(Rulebook rulebook) async {
    await _database.transaction(() async {
      // 1. Rulebook speichern
      final rulebookId = await _database.into(_database.rulebooks).insert(
        RulebooksCompanion.insert(
          name: rulebook.name,
          version: rulebook.version,
          language: rulebook.language,
          filePath: rulebook.filePath,
          checksum: rulebook.checksum,
          schemaVersion: rulebook.schemaVersion,
        ),
      );
      
      // 2. Regeln importieren
      final ruleEntities = rulebook.rules.map((rule) {
        return RulesCompanion.insert(
          rulebookId: rulebookId,
          ruleType: rule.type.name,
          ruleKey: rule.key,
          dataJson: jsonEncode(rule.data.toJson()),
          dependenciesJson: rule.dependencies != null 
            ? jsonEncode(rule.dependencies!.map((d) => d.toJson()).toList())
            : null,
          priority: rule.priority,
        );
      }).toList();
      
      await _database.batch((batch) {
        batch.insertAll(_database.rules, ruleEntities);
      });
    });
  }
  
  @override
  Future<List<Rulebook>> getAllRulebooks() async {
    final entities = await _database.select(_database.rulebooks).get();
    return entities.map((e) => e.toDomainModel()).toList();
  }
}

// Rule Entity
@freezed
class Rule with _$Rule {
  const Rule({
    required this.id,
    required this.rulebookId,
    required this.type,
    required this.key,
    required this.data,
    this.dependencies,
    required this.priority,
  });
  
  final int id;
  final int rulebookId;
  final RuleType type;
  final String key;
  final RuleData data;
  final List<RuleDependency>? dependencies;
  final int priority;
  
  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);
  Map<String, dynamic> toJson() => _$RuleToJson(this);
}

enum RuleType {
  attribute, skill, magic, quality, combat, matrix, 
  vehicle, equipment, general, houseRule
}

@freezed
class RuleData with _$RuleData {
  const RuleData({
    required this.name,
    required this.description,
    required this.values,
    required this.formulas,
  });
  
  final String name;
  final String description;
  final Map<String, dynamic> values;
  final Map<String, String> formulas;  // 'dice_pool': 'attribute + skill + modifier'
  
  factory RuleData.fromJson(Map<String, dynamic> json) => 
      _$RuleDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$RuleDataToJson(this);
}

@freezed
class RuleDependency with _$RuleDependency {
  const RuleDependency({
    required this.ruleId,
    required this.dependencyType,
  });
  
  final int ruleId;
  final String dependencyType;  // 'requires', 'modifies', 'conflicts'
  
  factory RuleDependency.fromJson(Map<String, dynamic> json) => 
      _$RuleDependencyFromJson(json);
  
  Map<String, dynamic> toJson() => _$RuleDependencyToJson(this);
}
```

---

## 5. Entity Relationship Diagram (Textuell)

```
┌─────────────────────────────────────────────────────────────┐
│                      CHARACTER                               │
│  - id, name, concept, metatype, metadata                    │
└─────────────────────────────────────────────────────────────┘
         │                    │                    │
         │ 1                  │ 1                  │ 1
         │                    │                    │
         ▼                    ▼                    ▼
┌─────────────────┐  ┌──────────────────┐  ┌──────────────────┐
│   ATTRIBUTES    │  │     SKILLS       │  │   QUALITIES      │
│  - body, magic  │  │  - active, passive│  │  - positive, neg │
│  - essence, edge│  │  - groups, specs │  │  - karma costs   │
└─────────────────┘  └──────────────────┘  └──────────────────┘
         │                    │                    │
         └────────────────────┼────────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │   MAGIC PATH     │
                    │  - mage/adept    │
                    │  - spells, foci  │
                    └──────────────────┘

┌─────────────────────────────────────────────────────────────┐
│                    EQUIPMENT                                │
│  - weapons, armor, cyberware, bioware, gear, vehicles       │
└─────────────────────────────────────────────────────────────┘
         │
         │ N
         │
         ▼
┌─────────────────────────────────────────────────────────────┐
│                   RULEBOOKS                                 │
│  - name, version, language, checksum                        │
└─────────────────────────────────────────────────────────────┘
         │
         │ 1
         │
         ▼
┌─────────────────────────────────────────────────────────────┐
│                     RULES                                   │
│  - type, key, data, dependencies, priority                  │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│              BACKGROUND                                     │
│  - contacts, lifestyle, history, notes                      │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  NPCs                    │  HOSTS                            │
│  - name, role, attrs     │  - name, security, systems       │
└──────────────────────────┼──────────────────────────────────┘
                           │
                           ▼
                  ┌──────────────────┐
                  │   LOCATIONS      │
                  │  - name, type    │
                  │  - connections   │
                  └──────────────────┘
```

---

## 6. Validierung und Business Logic

### 6.1 Entity Validierung

```dart
// Domain Models mit eingebauter Validierung
@freezed
class Character with _$Character {
  const Character({
    // ... Felder
  }) {
    // Validierung im Factory-Konstruktor
  }
  
  factory Character({
    required int? id,
    required String name,
    // ... andere Parameter
  }) {
    // Validierung
    final errors = <String>[];
    
    if (name.isEmpty) {
      errors.add('Name cannot be empty');
    }
    
    if (attributes.essence < 0 || attributes.essence > 6) {
      errors.add('Essence must be between 0 and 6');
    }
    
    if (errors.isNotEmpty) {
      throw ValidationException(errors);
    }
    
    return Character._(
      id: id,
      name: name,
      // ... andere Felder
    );
  }
}

class ValidationException implements Exception {
  final List<String> errors;
  ValidationException(this.errors);
  
  @override
  String toString() => 'Validation failed: ${errors.join(', ')}';
}
```

### 6.2 Rule-Based Validation

```dart
class CharacterValidator {
  final RuleEngine _ruleEngine;
  
  CharacterValidator(this._ruleEngine);
  
  ValidationResult validate(Character character) {
    final errors = <ValidationError>[];
    
    // 1. Grundlegende Validierung
    errors.addAll(_validateBasicRules(character));
    
    // 2. Attributs-Limits
    errors.addAll(_validateAttributeLimits(character));
    
    // 3. Essence-Magic Interaktion
    if (character.magicPath != null) {
      errors.addAll(_validateEssenceMagicInteraction(character));
    }
    
    // 4. Priority-System
    errors.addAll(_validatePrioritySystem(character));
    
    // 5. Vor- und Nachteile
    errors.addAll(_validateQualities(character));
    
    return ValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
    );
  }
  
  List<ValidationError> _validateEssenceMagicInteraction(Character character) {
    final errors = <ValidationError>[];
    final essence = character.attributes.essence;
    final magic = character.attributes.magicOrResonance;
    
    // SR2 Regel: Bei Essence < 6 geht Magic verloren
    if (essence < 6 && magic > 0) {
      final lostMagic = (6 - essence).floor();
      errors.add(ValidationError(
        field: 'magic',
        message: 'Essence $essence reduces Magic by $lostMagic points',
        severity: ValidationSeverity.warning,
      ));
    }
    
    // Cyberware-Essence-Kosten prüfen
    final totalEssenceCost = character.equipment.getTotalEssenceCost();
    final remainingEssence = 6.0 - totalEssenceCost;
    
    if (remainingEssence < 0) {
      errors.add(ValidationError(
        field: 'essence',
        message: 'Not enough essence for cyberware (need ${totalEssenceCost}, have 6.0)',
        severity: ValidationSeverity.error,
      ));
    }
    
    return errors;
  }
}

@freezed
class ValidationResult with _$ValidationResult {
  const ValidationResult({
    required this.isValid,
    required this.errors,
  });
  
  final bool isValid;
  final List<ValidationError> errors;
}

@freezed
class ValidationError with _$ValidationError {
  const ValidationError({
    required this.field,
    required this.message,
    required this.severity,
  });
  
  final String field;
  final String message;
  final ValidationSeverity severity;
}

enum ValidationSeverity { info, warning, error }
```

---

## 7. Serialisierung und Export

### 7.1 JSON Export/Import

```dart
class CharacterSerializer {
  static String serializeToJson(Character character) {
    return jsonEncode(character.toJson());
  }
  
  static Character deserializeFromJson(String json) {
    return Character.fromJson(jsonDecode(json));
  }
  
  static String serializeToFoundryVTT(Character character) {
    // Foundry VTT spezifisches Format
    final foundryData = {
      'name': character.name,
      'type': 'character',
      'data': {
        'attributes': {
          'body': character.attributes.body,
          'quickness': character.attributes.quickness,
          // ... weitere Attribute
        },
        'skills': character.skills.activeSkills,
        'essence': character.attributes.essence,
      }
    };
    
    return jsonEncode(foundryData);
  }
  
  static String serializeToRoll20(Character character) {
    // Roll20 spezifisches Format
    // ...
  }
}
```

### 7.2 PDF Export

```dart
class CharacterPdfExporter {
  Future<Uint8List> exportToPdf(Character character) async {
    final pdf = Document();
    
    // Header
    pdf.addPage(
      Page(
        build: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(character.name, style: TextStyle(fontSize: 24)),
            Text('Concept: ${character.concept ?? "N/A"}'),
            Divider(),
            
            // Attribute
            Text('Attributes', style: TextStyle(fontSize: 18)),
            ...character.attributes.toJson().entries.map((e) => 
              Text('${e.key}: ${e.value}')
            ),
            
            // Skills
            Text('Skills', style: TextStyle(fontSize: 18)),
            ...character.skills.activeSkills.entries.map((e) =>
              Text('${e.key}: ${e.value}')
            ),
            
            // Equipment
            Text('Equipment', style: TextStyle(fontSize: 18)),
            ...character.equipment.weapons.map((w) => Text(w.name)),
          ],
        ),
      ),
    );
    
    return pdf.save();
  }
}
```

---

## 8. Datenbank-Indexierung und Performance

### 8.1 Indizes definieren

```dart
class Characters extends Table {
  // ... Spalten
  
  @override
  List<String> get customConstraints => [
    'CREATE INDEX idx_characters_name ON characters(name)',
    'CREATE INDEX idx_characters_metatype ON characters(metatype)',
    'CREATE INDEX idx_characters_created_at ON characters(created_at)',
  ];
}

class Rules extends Table {
  // ... Spalten
  
  @override
  List<String> get customConstraints => [
    'CREATE INDEX idx_rules_type ON rules(rule_type)',
    'CREATE INDEX idx_rules_rulebook ON rules(rulebook_id)',
    'CREATE INDEX idx_rules_key ON rules(rule_key)',
  ];
}
```

### 8.2 Query-Optimierung

```dart
// Effiziente Suche mit LIMIT und OFFSET
Future<PagedResult<Character>> getCharactersPage(int page, int pageSize) async {
  final offset = page * pageSize;
  final items = await (_database.select(_database.characters)
    ..orderBy([(_) => OrderingTerm.desc(_database.createdAt)])
    ..limit(pageSize, offset: offset))
    .get();
  
  final total = await _database.select(_database.characters).get();
  
  return PagedResult(
    items: items.map((e) => e.toDomainModel()).toList(),
    totalItems: total.length,
    hasMore: offset + items.length < total.length,
  );
}
```

---

## 9. Nächste Schritte

1. **Code-Generierung**: freezed Build Runner ausführen
   ```bash
   flutter pub run build_runner build
   ```

2. **Drift Code-Generierung**:
   ```bash
   flutter pub run drift_dev make-database lib/infrastructure/database/app_database.dart
   ```

3. **Unit-Tests**: Tests für alle Entity-Mappings schreiben

4. **Migration-Tests**: Datenbank-Migrationen testen

5. **Performance-Tests**: Query-Performance mit großen Datenmengen testen

---

## Referenzen

- Architektur: `2-Architektur.md` (Section 4: Repository Pattern, Section 2.3: Drift Database)
- Anforderungen: `1-Anforderungsanalyse.md` (§5 Ausrüstung, §5.4 Hintergrund)
- Regelinteraktionen: `1-1-Regelinteraktionen.md` (Teil 2: Aufbauregeln)