/// SR2 Metatype definition with attribute bonuses and limits.
///
/// Based on the Shadowrun 2. Edition core rules.
class Metatype {
  final String id;
  final String name;
  final Map<String, int> attributeBonuses;
  final Map<String, int> attributeLimits;
  final List<String> specialAttributes;

  const Metatype({
    required this.id,
    required this.name,
    required this.attributeBonuses,
    required this.attributeLimits,
    this.specialAttributes = const [],
  });
}

/// All playable metatypes for SR2.
class Metatypes {
  static const human = Metatype(
    id: 'human',
    name: 'Mensch',
    attributeBonuses: {},
    attributeLimits: {
      'body': 9,
      'quickness': 9,
      'strength': 9,
      'charisma': 9,
      'intelligence': 9,
      'willpower': 9,
    },
    specialAttributes: [],
  );

  static const elf = Metatype(
    id: 'elf',
    name: 'Elf',
    attributeBonuses: {
      'quickness': 2,
      'charisma': 2,
    },
    attributeLimits: {
      'body': 8,
      'quickness': 10,
      'strength': 8,
      'charisma': 10,
      'intelligence': 9,
      'willpower': 8,
    },
    specialAttributes: ['low_light_vision', 'thermal_resistance'],
  );

  static const dwarf = Metatype(
    id: 'dwarf',
    name: 'Zwerg',
    attributeBonuses: {
      'body': 1,
      'willpower': 2,
    },
    attributeLimits: {
      'body': 10,
      'quickness': 8,
      'strength': 9,
      'charisma': 8,
      'intelligence': 9,
      'willpower': 10,
    },
    specialAttributes: ['thermographic_vision', 'resistance_to_toxins'],
  );

  static const ork = Metatype(
    id: 'ork',
    name: 'Ork',
    attributeBonuses: {
      'body': 3,
      'strength': 2,
    },
    attributeLimits: {
      'body': 10,
      'quickness': 7,
      'strength': 10,
      'charisma': 6,
      'intelligence': 7,
      'willpower': 8,
    },
    specialAttributes: ['low_light_vision', 'dermal_armor_bonus'],
  );

  static const troll = Metatype(
    id: 'troll',
    name: 'Troll',
    attributeBonuses: {
      'body': 4,
      'strength': 4,
    },
    attributeLimits: {
      'body': 11,
      'quickness': 6,
      'strength': 11,
      'charisma': 5,
      'intelligence': 6,
      'willpower': 7,
    },
    specialAttributes: [
      'dermal_armor',
      'thermographic_vision',
      'reach_bonus',
    ],
  );

  static const List<Metatype> all = [
    human,
    elf,
    dwarf,
    ork,
    troll,
  ];

  /// Find metatype by ID.
  static Metatype? getById(String id) {
    try {
      return all.firstWhere((m) => m.id == id);
    } catch (_) {
      return null;
    }
  }
}