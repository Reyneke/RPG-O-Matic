import '../entities/character.dart';

/// Repository interface for character data access.
/// Follows the Repository Pattern as defined in 2-Architektur.md §4.
abstract class CharacterRepository {
  Future<Character?> getCharacter(int id);
  Future<List<Character>> getAllCharacters();
  Future<Character> saveCharacter(Character character);
  Future<void> deleteCharacter(int id);
  Future<List<Character>> searchCharacters(String query);
}