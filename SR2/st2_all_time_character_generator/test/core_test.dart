import 'package:flutter_test/flutter_test.dart';
import 'package:st2_all_time_character_generator/core/dice_roller.dart';
import 'package:st2_all_time_character_generator/core/metatypes.dart';
import 'package:st2_all_time_character_generator/core/rule_engine.dart';
import 'package:st2_all_time_character_generator/core/validation_result.dart';

void main() {
  // ============================================================
  // DiceRoller Tests
  // ============================================================
  group('DiceRoller', () {
    test('roll should return valid result', () {
      final roller = DiceRoller();
      final result = roller.roll(dicePool: 6);

      expect(result, isNotNull);
      expect(result.diceResults.length, 6);
    });

    test('roll should have valid success count', () {
      final roller = DiceRoller();
      int totalSuccesses = 0;
      const int iterations = 100;

      for (int i = 0; i < iterations; i++) {
        final result = roller.roll(dicePool: 6);
        expect(result.successes, greaterThanOrEqualTo(0));
        expect(result.successes, lessThanOrEqualTo(18)); // Max with explosions
        totalSuccesses += result.successes;
      }

      // Average should be roughly 3 successes per 6 dice (TN 4)
      final average = totalSuccesses / iterations;
      expect(average, greaterThan(1.0));
      expect(average, lessThan(6.0));
    });

    test('calculateDicePool should sum attribute + skill + modifier', () {
      final roller = DiceRoller();
      final pool = roller.calculateDicePool(4, 5, -1);
      expect(pool, 8);
    });

    test('calculateEdgePool should average charisma and willpower', () {
      final roller = DiceRoller();
      final edge = roller.calculateEdgePool(4, 6);
      expect(edge, 5); // (4+6)/2 = 5
    });

    test('calculateEdgePool should round down', () {
      final roller = DiceRoller();
      final edge = roller.calculateEdgePool(3, 4);
      expect(edge, 3); // (3+4)/2 = 3.5 -> 3
    });

    test('roll with Edge addDice should increase pool', () {
      final roller = DiceRoller();
      final result = roller.roll(
        dicePool: 4,
        edgePoints: 2,
        edgeAction: EdgeAction.addDice,
      );
      expect(result.diceResults.length, greaterThanOrEqualTo(4));
    });
  });

  // ============================================================
  // Metatype Tests
  // ============================================================
  group('Metatypes', () {
    test('should include all 5 playable metatypes', () {
      expect(Metatypes.all.length, 5);
    });

    test('human should have no bonuses', () {
      expect(Metatypes.human.attributeBonuses, isEmpty);
    });

    test('elf should have quickness and charisma bonuses', () {
      expect(Metatypes.elf.attributeBonuses['quickness'], 2);
      expect(Metatypes.elf.attributeBonuses['charisma'], 2);
    });

    test('troll should have highest body and strength bonuses', () {
      expect(Metatypes.troll.attributeBonuses['body'], 4);
      expect(Metatypes.troll.attributeBonuses['strength'], 4);
    });

    test('getById should find metatype', () {
      final metatype = Metatypes.getById('elf');
      expect(metatype, isNotNull);
      expect(metatype!.name, 'Elf');
    });

    test('getById should return null for unknown', () {
      final metatype = Metatypes.getById('unknown');
      expect(metatype, isNull);
    });

    test('each metatype should have unique attribute limits', () {
      final allLimits = Metatypes.all.map((m) => m.attributeLimits).toList();
      for (int i = 0; i < allLimits.length; i++) {
        for (int j = i + 1; j < allLimits.length; j++) {
          expect(allLimits[i], isNot(allLimits[j]));
        }
      }
    });
  });

  // ============================================================
  // Priority System Tests
  // ============================================================
  group('PrioritySystem', () {
    test('should return correct attribute points for A', () {
      expect(PrioritySystem.getAttributePoints(PriorityLevel.a), 30);
    });

    test('should return correct attribute points for E', () {
      expect(PrioritySystem.getAttributePoints(PriorityLevel.e), 10);
    });

    test('should return correct resource nuyen for A', () {
      expect(PrioritySystem.getResourceNuyen(PriorityLevel.a), 1000);
    });

    test('should return correct resource nuyen for E', () {
      expect(PrioritySystem.getResourceNuyen(PriorityLevel.e), 5);
    });

    test('should return all metatypes for A priority', () {
      final options = PrioritySystem.getMetatypeOptions(PriorityLevel.a);
      expect(options.length, 5);
    });

    test('should return only human for E priority', () {
      final options = PrioritySystem.getMetatypeOptions(PriorityLevel.e);
      expect(options.length, 1);
      expect(options.first, 'human');
    });

    test('magic points should be 0 for E priority', () {
      expect(PrioritySystem.getMagicPoints(PriorityLevel.e), 0);
    });
  });

  // ============================================================
  // PrioritySelection Tests
  // ============================================================
  group('PrioritySelection', () {
    test('should be valid when all levels are unique', () {
      final selection = PrioritySelection(
        metatype: PriorityLevel.a,
        attributes: PriorityLevel.b,
        skills: PriorityLevel.c,
        magic: PriorityLevel.d,
        resources: PriorityLevel.e,
      );
      expect(selection.isValid, true);
    });

    test('should be invalid when levels are duplicated', () {
      final selection = PrioritySelection(
        metatype: PriorityLevel.a,
        attributes: PriorityLevel.a, // Duplicate!
        skills: PriorityLevel.c,
        magic: PriorityLevel.d,
        resources: PriorityLevel.e,
      );
      expect(selection.isValid, false);
    });
  });

  // ============================================================
  // AttributeAllocation Tests
  // ============================================================
  group('AttributeAllocation', () {
    test('should calculate total points correctly', () {
      final attributes = AttributeAllocation(
        body: 4,
        quickness: 4,
        strength: 3,
        charisma: 3,
        intelligence: 3,
        willpower: 3,
      );
      expect(attributes.totalPoints, 20);
    });

    test('should have default essence of 6.0', () {
      final attributes = AttributeAllocation(
        body: 3,
        quickness: 3,
        strength: 3,
        charisma: 3,
        intelligence: 3,
        willpower: 3,
      );
      expect(attributes.essence, 6.0);
    });
  });

  // ============================================================
  // RuleEngine Tests
  // ============================================================
  group('RuleEngine', () {
    late RuleEngine engine;

    setUp(() {
      engine = RuleEngine();
    });

    group('validateAttributes', () {
      test('should return no errors for valid attributes', () {
        final attributes = AttributeAllocation(
          body: 4,
          quickness: 4,
          strength: 3,
          charisma: 3,
          intelligence: 3,
          willpower: 3,
        );
        final errors = engine.validateAttributes(attributes, 'human');
        expect(errors, isEmpty);
      });

      test('should return error for unknown metatype', () {
        final attributes = AttributeAllocation(
          body: 3,
          quickness: 3,
          strength: 3,
          charisma: 3,
          intelligence: 3,
          willpower: 3,
        );
        final errors = engine.validateAttributes(attributes, 'unknown');
        expect(errors, isNotEmpty);
        expect(errors.first, contains('Unknown'));
      });

      test('should return error when attribute exceeds metatype maximum', () {
        final attributes = AttributeAllocation(
          body: 12, // Human max is 9
          quickness: 3,
          strength: 3,
          charisma: 3,
          intelligence: 3,
          willpower: 3,
        );
        final errors = engine.validateAttributes(attributes, 'human');
        expect(errors, isNotEmpty);
        expect(errors.first, contains('exceeds maximum'));
      });

      test('should accept troll with body 11', () {
        final attributes = AttributeAllocation(
          body: 11, // Troll max is 11
          quickness: 3,
          strength: 4,
          charisma: 2,
          intelligence: 2,
          willpower: 3,
        );
        final errors = engine.validateAttributes(attributes, 'troll');
        expect(errors, isEmpty);
      });
    });

    group('validatePrioritySelection', () {
      test('should return no errors for valid selection', () {
        final selection = PrioritySelection(
          metatype: PriorityLevel.a,
          attributes: PriorityLevel.b,
          skills: PriorityLevel.c,
          magic: PriorityLevel.d,
          resources: PriorityLevel.e,
        );
        final errors = engine.validatePrioritySelection(selection);
        expect(errors, isEmpty);
      });

      test('should return error for duplicate levels', () {
        final selection = PrioritySelection(
          metatype: PriorityLevel.a,
          attributes: PriorityLevel.a,
          skills: PriorityLevel.c,
          magic: PriorityLevel.d,
          resources: PriorityLevel.e,
        );
        final errors = engine.validatePrioritySelection(selection);
        expect(errors, isNotEmpty);
      });
    });

    group('validateAttributePoints', () {
      test('should not exceed max points for priority B', () {
        final attributes = AttributeAllocation(
          body: 5,
          quickness: 5,
          strength: 4,
          charisma: 4,
          intelligence: 4,
          willpower: 3,
        ); // total = 25
        final errors =
            engine.validateAttributePoints(attributes, PriorityLevel.b);
        expect(errors, isEmpty);
      });

      test('should return error when exceeding max points', () {
        final attributes = AttributeAllocation(
          body: 6,
          quickness: 6,
          strength: 6,
          charisma: 6,
          intelligence: 6,
          willpower: 6,
        ); // total = 36
        final errors =
            engine.validateAttributePoints(attributes, PriorityLevel.e);
        expect(errors, isNotEmpty);
      });
    });

    group('calculateDerivedValues', () {
      test('should calculate initiative correctly', () {
        final attributes = AttributeAllocation(
          body: 3,
          quickness: 4,
          strength: 3,
          charisma: 3,
          intelligence: 5,
          willpower: 3,
        );
        final derived = engine.calculateDerivedValues(attributes);
        expect(derived['initiative'], 9); // quickness + intelligence
        expect(derived['liftCapacity'], 45); // strength * 15
        expect(derived['walkRate'], 8); // quickness * 2
      });
    });

    group('calculateMagic', () {
      test('should return 0 for non-magical characters', () {
        final magic = engine.calculateMagic(0, 6.0, {});
        expect(magic, 0);
      });

      test('should reduce magic when essence is below 6', () {
        // Essence 4.5 means 6.0 - 4.5 = 1.5 -> floor = 1 point lost
        final magic = engine.calculateMagic(6, 4.5, {});
        expect(magic, 5); // 6 - floor(6.0 - 4.5) = 6 - 1 = 5
      });

      test('should add metatype bonuses', () {
        final magic = engine.calculateMagic(6, 6.0, {'magic': 2});
        expect(magic, 8); // 6 + 2 - 0 = 8
      });
    });
  });

  // ============================================================
  // Validation Framework Tests
  // ============================================================
  group('ValidationResult', () {
    test('success should be valid', () {
      final result = ValidationResult.success();
      expect(result.isValid, true);
      expect(result.messages, isEmpty);
    });

    test('failure should contain messages', () {
      final result = ValidationResult.failure([
        const ValidationMessage(field: 'name', message: 'Name is required'),
      ]);
      expect(result.isValid, false);
      expect(result.errors.length, 1);
    });
  });

  group('CharacterValidator', () {
    test('validateRange should return error when below min', () {
      final message = CharacterValidator.validateRange(
        field: 'Body',
        value: 0,
        min: 1,
        max: 9,
      );
      expect(message, isNotNull);
      expect(message!.severity, ValidationSeverity.error);
    });

    test('validateRange should return null when in range', () {
      final message = CharacterValidator.validateRange(
        field: 'Body',
        value: 5,
        min: 1,
        max: 9,
      );
      expect(message, isNull);
    });

    test('validateRequired should return error for null', () {
      final message = CharacterValidator.validateRequired(
        field: 'Name',
        value: null,
      );
      expect(message, isNotNull);
    });

    test('validatePoints should return error when exceeded', () {
      final message = CharacterValidator.validatePoints(
        field: 'Attributes',
        spent: 40,
        max: 30,
      );
      expect(message, isNotNull);
    });

    test('warning should return info severity', () {
      final message = CharacterValidator.warning(
        field: 'Essence',
        message: 'Essence below 6 affects magic',
      );
      expect(message, isNotNull);
      expect(message!.severity, ValidationSeverity.warning);
    });
  });
}