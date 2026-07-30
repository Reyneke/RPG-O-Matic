import 'dart:math';
import 'metatypes.dart';

/// Priority levels for character creation (A=highest, E=lowest).
enum PriorityLevel { a, b, c, d, e }

/// Priority selection for all five character creation categories.
class PrioritySelection {
  final PriorityLevel metatype;
  final PriorityLevel attributes;
  final PriorityLevel skills;
  final PriorityLevel magic;
  final PriorityLevel resources;

  const PrioritySelection({
    required this.metatype,
    required this.attributes,
    required this.skills,
    required this.magic,
    required this.resources,
  });

  /// Validates that no priority level is used twice.
  bool get isValid {
    final levels = [metatype, attributes, skills, magic, resources];
    return levels.toSet().length == 5;
  }
}

/// Attribute points allocated during character creation.
class AttributeAllocation {
  final int body;
  final int quickness;
  final int strength;
  final int charisma;
  final int intelligence;
  final int willpower;
  final double essence;
  final int edge;

  const AttributeAllocation({
    required this.body,
    required this.quickness,
    required this.strength,
    required this.charisma,
    required this.intelligence,
    required this.willpower,
    this.essence = 6.0,
    this.edge = 1,
  });

  int get totalPoints =>
      body + quickness + strength + charisma + intelligence + willpower;
}

/// SR2 Priority System for character creation.
///
/// Maps priority levels to resource points for each category.
class PrioritySystem {
  /// Attribute points by priority level.
  static const Map<PriorityLevel, int> attributePoints = {
    PriorityLevel.a: 30,
    PriorityLevel.b: 25,
    PriorityLevel.c: 20,
    PriorityLevel.d: 15,
    PriorityLevel.e: 10,
  };

  /// Skill points by priority level.
  static const Map<PriorityLevel, int> skillPoints = {
    PriorityLevel.a: 40,
    PriorityLevel.b: 30,
    PriorityLevel.c: 25,
    PriorityLevel.d: 20,
    PriorityLevel.e: 15,
  };

  /// Resource nuyen (in 1000s) by priority level.
  static const Map<PriorityLevel, int> resourceNuyen = {
    PriorityLevel.a: 1000,
    PriorityLevel.b: 400,
    PriorityLevel.c: 90,
    PriorityLevel.d: 40,
    PriorityLevel.e: 5,
  };

  /// Magic/resonance points by priority level.
  static const Map<PriorityLevel, int> magicPoints = {
    PriorityLevel.a: 40,
    PriorityLevel.b: 30,
    PriorityLevel.c: 20,
    PriorityLevel.d: 10,
    PriorityLevel.e: 0,
  };

  /// Metatype options by priority level.
  static const Map<PriorityLevel, List<String>> metatypeOptions = {
    PriorityLevel.a: ['human', 'elf', 'dwarf', 'ork', 'troll'],
    PriorityLevel.b: ['human', 'elf', 'dwarf', 'ork'],
    PriorityLevel.c: ['human', 'elf', 'dwarf'],
    PriorityLevel.d: ['human', 'elf'],
    PriorityLevel.e: ['human'],
  };

  /// Get attribute points for the given priority level.
  static int getAttributePoints(PriorityLevel level) =>
      attributePoints[level] ?? 20;

  /// Get skill points for the given priority level.
  static int getSkillPoints(PriorityLevel level) =>
      skillPoints[level] ?? 25;

  /// Get resource nuyen for the given priority level.
  static int getResourceNuyen(PriorityLevel level) =>
      resourceNuyen[level] ?? 90;

  /// Get magic points for the given priority level.
  static int getMagicPoints(PriorityLevel level) =>
      magicPoints[level] ?? 0;

  /// Get available metatypes for the given priority level.
  static List<String> getMetatypeOptions(PriorityLevel level) =>
      metatypeOptions[level] ?? ['human'];
}

/// Core rule engine for SR2 character creation and validation.
class RuleEngine {
  /// Validates an attribute allocation against metatype limits.
  ///
  /// Returns a list of validation error messages.
  List<String> validateAttributes(
    AttributeAllocation attributes,
    String metatypeId,
  ) {
    final errors = <String>[];
    final metatype = Metatypes.getById(metatypeId);
    if (metatype == null) {
      errors.add('Unknown metatype: $metatypeId');
      return errors;
    }

    // Check minimum values (default min is 1)
    final minValue = 1;

    // Check maximum values from metatype limits
    final maxBody = metatype.attributeLimits['body'] ?? 9;
    final maxQuickness = metatype.attributeLimits['quickness'] ?? 9;
    final maxStrength = metatype.attributeLimits['strength'] ?? 9;
    final maxCharisma = metatype.attributeLimits['charisma'] ?? 9;
    final maxIntelligence = metatype.attributeLimits['intelligence'] ?? 9;
    final maxWillpower = metatype.attributeLimits['willpower'] ?? 9;

    _checkAttribute(errors, 'Body', attributes.body, minValue, maxBody);
    _checkAttribute(
        errors, 'Quickness', attributes.quickness, minValue, maxQuickness);
    _checkAttribute(
        errors, 'Strength', attributes.strength, minValue, maxStrength);
    _checkAttribute(
        errors, 'Charisma', attributes.charisma, minValue, maxCharisma);
    _checkAttribute(
        errors, 'Intelligence', attributes.intelligence, minValue, maxIntelligence);
    _checkAttribute(
        errors, 'Willpower', attributes.willpower, minValue, maxWillpower);

    return errors;
  }

  void _checkAttribute(
    List<String> errors,
    String name,
    int value,
    int min,
    int max,
  ) {
    if (value < min) {
      errors.add('$name ($value) is below minimum ($min)');
    }
    if (value > max) {
      errors.add('$name ($value) exceeds maximum ($max)');
    }
  }

  /// Validates a priority selection.
  List<String> validatePrioritySelection(PrioritySelection selection) {
    final errors = <String>[];
    if (!selection.isValid) {
      errors.add('Each priority level can only be used once');
    }
    return errors;
  }

  /// Validates that total attribute points don't exceed the allowed amount.
  List<String> validateAttributePoints(
    AttributeAllocation attributes,
    PriorityLevel priority,
  ) {
    final errors = <String>[];
    final maxPoints = PrioritySystem.getAttributePoints(priority);
    final spent = attributes.totalPoints;
    if (spent > maxPoints) {
      errors.add(
        'Attribute points ($spent) exceed maximum ($maxPoints)',
      );
    }
    return errors;
  }

  /// Calculates derived values from base attributes.
  Map<String, int> calculateDerivedValues(AttributeAllocation attributes) {
    return {
      'initiative': attributes.quickness + attributes.intelligence,
      'liftCapacity': attributes.strength * 15,
      'walkRate': attributes.quickness * 2,
    };
  }

  /// Calculate magic attribute based on essence and metatype bonuses.
  int calculateMagic(int baseMagic, double essence, Map<String, int> bonuses) {
    if (baseMagic <= 0) return 0;
    // SR2: Magic is reduced when essence drops below 6
    final essenceLoss = (6.0 - essence).floor();
    return max(0, baseMagic + (bonuses['magic'] ?? 0) - essenceLoss);
  }
}