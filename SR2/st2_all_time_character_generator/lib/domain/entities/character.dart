/// Placeholder for Character entity.
/// Will be fully implemented with freezed in Sprint 1.
class Character {
  final int? id;
  final String name;
  final String? concept;
  final String metatype;

  const Character({
    this.id,
    required this.name,
    this.concept,
    required this.metatype,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'concept': concept,
        'metatype': metatype,
      };

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json['id'] as int?,
        name: json['name'] as String,
        concept: json['concept'] as String?,
        metatype: json['metatype'] as String,
      );
}