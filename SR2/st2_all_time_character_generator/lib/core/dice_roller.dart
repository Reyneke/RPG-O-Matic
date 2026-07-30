import 'dart:math';

/// Results from a single dice roll in the SR2 test system.
class DiceRollResult {
  final int successes;
  final bool isCriticalSuccess;
  final bool isCriticalFailure;
  final List<int> diceResults;

  const DiceRollResult({
    required this.successes,
    required this.isCriticalSuccess,
    required this.isCriticalFailure,
    required this.diceResults,
  });
}

/// Intermediate roll data used internally.
class _RollData {
  final int successes;
  final int ones;
  final int sixes;
  final List<int> results;

  const _RollData({
    required this.successes,
    required this.ones,
    required this.sixes,
    required this.results,
  });
}

/// Mögliche Aktionen für das Edge-System.
enum EdgeAction {
  addDice,       // Edge-Punkte in zusätzliche Würfel
  rerollFailures, // Fehlschläge wiederholen
  forceExplosion, // 6er zählen als automatische Erfolge
  autoSuccess,    // Automatischer Erfolg ohne Wurf
}

/// SR2 Dice Roller with 6er-Explosionen and Edge integration.
///
/// Implementiert die Probenmechanik der Shadowrun 2. Edition:
/// - Würfelpool: Attribut + Fertigkeit + Modifikatoren
/// - Zielzahl (TN): Schwierigkeitsgrad der Aufgabe
/// - 6er-Explosionen: Jede 6 zählt als Erfolg und ermöglicht zusätzlichen Wurf
/// - Grenzfälle: 1er negieren Erfolge, kritische Fehlschläge
class DiceRoller {
  final Random _random;

  DiceRoller({Random? random}) : _random = random ?? Random();

  /// Führt eine einfache Probe durch.
  ///
  /// [dicePool] = Anzahl der Würfel (Attribut + Fertigkeit + Modifikatoren)
  /// [targetNumber] = Zielzahl (default 4 für einfache Proben)
  DiceRollResult roll({
    required int dicePool,
    int targetNumber = 4,
    bool isEdgeUsed = false,
    int edgePoints = 0,
    EdgeAction? edgeAction,
  }) {
    int effectivePool = dicePool;

    // Edge: Zusätzliche Würfel
    if (edgeAction == EdgeAction.addDice && edgePoints > 0) {
      effectivePool += edgePoints;
    }

    final List<int> allResults = [];
    int successes = 0;
    int ones = 0;
    int sixes = 0;

    // Erster Wurf
    final firstResults = _rollDice(effectivePool, targetNumber);
    allResults.addAll(firstResults.results);
    successes += firstResults.successes;
    ones += firstResults.ones;
    sixes += firstResults.sixes;

    // 6er-Explosionen: Solange weiterwürfeln, wie 6er fallen
    int explosionCount = sixes;
    while (explosionCount > 0) {
      final explosionResults = _rollDice(explosionCount, targetNumber);
      allResults.addAll(explosionResults.results);
      successes += explosionResults.successes;
      ones += explosionResults.ones;
      explosionCount = explosionResults.sixes;
    }

    // Edge: Fehlschläge wiederholen
    if (edgeAction == EdgeAction.rerollFailures && edgePoints > 0) {
      final failures = effectivePool - successes;
      if (failures > 0) {
        final rerollResults = _rollDice(failures, targetNumber);
        allResults.addAll(rerollResults.results);
        successes += rerollResults.successes;
      }
    }

    // Grenzfälle prüfen
    final isCriticalFailure = ones > effectivePool ~/ 2 && successes == 0;

    return DiceRollResult(
      successes: successes,
      isCriticalSuccess: false,
      isCriticalFailure: isCriticalFailure,
      diceResults: allResults,
    );
  }

  /// Würfelt [count] Würfel und zählt Erfolge gegen [targetNumber].
  _RollData _rollDice(int count, int targetNumber) {
    int successes = 0;
    int ones = 0;
    int sixes = 0;
    final List<int> results = [];

    for (int i = 0; i < count; i++) {
      final result = _random.nextInt(6) + 1;
      results.add(result);

      if (result >= targetNumber) {
        successes++;
      }
      if (result == 1) {
        ones++;
      }
      if (result == 6) {
        sixes++;
      }
    }

    return _RollData(
      successes: successes,
      ones: ones,
      sixes: sixes,
      results: results,
    );
  }

  /// Berechnet den Würfelpool: Attribut + Fertigkeit + Modifikatoren
  int calculateDicePool(int attribute, int skill, int modifier) {
    return attribute + skill + modifier;
  }

  /// Berechnet den Edge-Wert basierend auf Charisma und Willpower.
  int calculateEdgePool(int charisma, int willpower) {
    return (charisma + willpower) ~/ 2;
  }
}