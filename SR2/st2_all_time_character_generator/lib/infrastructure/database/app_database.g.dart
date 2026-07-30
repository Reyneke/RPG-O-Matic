// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CharactersTable extends Characters
    with TableInfo<$CharactersTable, Character> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conceptMeta = const VerificationMeta(
    'concept',
  );
  @override
  late final GeneratedColumn<String> concept = GeneratedColumn<String>(
    'concept',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _metatypeMeta = const VerificationMeta(
    'metatype',
  );
  @override
  late final GeneratedColumn<String> metatype = GeneratedColumn<String>(
    'metatype',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attributesMeta = const VerificationMeta(
    'attributes',
  );
  @override
  late final GeneratedColumn<String> attributes = GeneratedColumn<String>(
    'attributes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _skillsMeta = const VerificationMeta('skills');
  @override
  late final GeneratedColumn<String> skills = GeneratedColumn<String>(
    'skills',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qualitiesMeta = const VerificationMeta(
    'qualities',
  );
  @override
  late final GeneratedColumn<String> qualities = GeneratedColumn<String>(
    'qualities',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _magicPathMeta = const VerificationMeta(
    'magicPath',
  );
  @override
  late final GeneratedColumn<String> magicPath = GeneratedColumn<String>(
    'magic_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _equipmentMeta = const VerificationMeta(
    'equipment',
  );
  @override
  late final GeneratedColumn<String> equipment = GeneratedColumn<String>(
    'equipment',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _financesMeta = const VerificationMeta(
    'finances',
  );
  @override
  late final GeneratedColumn<String> finances = GeneratedColumn<String>(
    'finances',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _backgroundMeta = const VerificationMeta(
    'background',
  );
  @override
  late final GeneratedColumn<String> background = GeneratedColumn<String>(
    'background',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _creationDataMeta = const VerificationMeta(
    'creationData',
  );
  @override
  late final GeneratedColumn<String> creationData = GeneratedColumn<String>(
    'creation_data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _metadataMeta = const VerificationMeta(
    'metadata',
  );
  @override
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
    'metadata',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    concept,
    metatype,
    attributes,
    skills,
    qualities,
    magicPath,
    equipment,
    finances,
    background,
    creationData,
    metadata,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<Character> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('concept')) {
      context.handle(
        _conceptMeta,
        concept.isAcceptableOrUnknown(data['concept']!, _conceptMeta),
      );
    }
    if (data.containsKey('metatype')) {
      context.handle(
        _metatypeMeta,
        metatype.isAcceptableOrUnknown(data['metatype']!, _metatypeMeta),
      );
    } else if (isInserting) {
      context.missing(_metatypeMeta);
    }
    if (data.containsKey('attributes')) {
      context.handle(
        _attributesMeta,
        attributes.isAcceptableOrUnknown(data['attributes']!, _attributesMeta),
      );
    } else if (isInserting) {
      context.missing(_attributesMeta);
    }
    if (data.containsKey('skills')) {
      context.handle(
        _skillsMeta,
        skills.isAcceptableOrUnknown(data['skills']!, _skillsMeta),
      );
    } else if (isInserting) {
      context.missing(_skillsMeta);
    }
    if (data.containsKey('qualities')) {
      context.handle(
        _qualitiesMeta,
        qualities.isAcceptableOrUnknown(data['qualities']!, _qualitiesMeta),
      );
    } else if (isInserting) {
      context.missing(_qualitiesMeta);
    }
    if (data.containsKey('magic_path')) {
      context.handle(
        _magicPathMeta,
        magicPath.isAcceptableOrUnknown(data['magic_path']!, _magicPathMeta),
      );
    }
    if (data.containsKey('equipment')) {
      context.handle(
        _equipmentMeta,
        equipment.isAcceptableOrUnknown(data['equipment']!, _equipmentMeta),
      );
    } else if (isInserting) {
      context.missing(_equipmentMeta);
    }
    if (data.containsKey('finances')) {
      context.handle(
        _financesMeta,
        finances.isAcceptableOrUnknown(data['finances']!, _financesMeta),
      );
    } else if (isInserting) {
      context.missing(_financesMeta);
    }
    if (data.containsKey('background')) {
      context.handle(
        _backgroundMeta,
        background.isAcceptableOrUnknown(data['background']!, _backgroundMeta),
      );
    } else if (isInserting) {
      context.missing(_backgroundMeta);
    }
    if (data.containsKey('creation_data')) {
      context.handle(
        _creationDataMeta,
        creationData.isAcceptableOrUnknown(
          data['creation_data']!,
          _creationDataMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_creationDataMeta);
    }
    if (data.containsKey('metadata')) {
      context.handle(
        _metadataMeta,
        metadata.isAcceptableOrUnknown(data['metadata']!, _metadataMeta),
      );
    } else if (isInserting) {
      context.missing(_metadataMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Character map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Character(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      concept: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}concept'],
      ),
      metatype: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metatype'],
      )!,
      attributes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attributes'],
      )!,
      skills: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}skills'],
      )!,
      qualities: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}qualities'],
      )!,
      magicPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}magic_path'],
      ),
      equipment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}equipment'],
      )!,
      finances: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}finances'],
      )!,
      background: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}background'],
      )!,
      creationData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}creation_data'],
      )!,
      metadata: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CharactersTable createAlias(String alias) {
    return $CharactersTable(attachedDatabase, alias);
  }
}

class Character extends DataClass implements Insertable<Character> {
  final int id;
  final String name;
  final String? concept;
  final String metatype;
  final String attributes;
  final String skills;
  final String qualities;
  final String? magicPath;
  final String equipment;
  final String finances;
  final String background;
  final String creationData;
  final String metadata;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Character({
    required this.id,
    required this.name,
    this.concept,
    required this.metatype,
    required this.attributes,
    required this.skills,
    required this.qualities,
    this.magicPath,
    required this.equipment,
    required this.finances,
    required this.background,
    required this.creationData,
    required this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || concept != null) {
      map['concept'] = Variable<String>(concept);
    }
    map['metatype'] = Variable<String>(metatype);
    map['attributes'] = Variable<String>(attributes);
    map['skills'] = Variable<String>(skills);
    map['qualities'] = Variable<String>(qualities);
    if (!nullToAbsent || magicPath != null) {
      map['magic_path'] = Variable<String>(magicPath);
    }
    map['equipment'] = Variable<String>(equipment);
    map['finances'] = Variable<String>(finances);
    map['background'] = Variable<String>(background);
    map['creation_data'] = Variable<String>(creationData);
    map['metadata'] = Variable<String>(metadata);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CharactersCompanion toCompanion(bool nullToAbsent) {
    return CharactersCompanion(
      id: Value(id),
      name: Value(name),
      concept: concept == null && nullToAbsent
          ? const Value.absent()
          : Value(concept),
      metatype: Value(metatype),
      attributes: Value(attributes),
      skills: Value(skills),
      qualities: Value(qualities),
      magicPath: magicPath == null && nullToAbsent
          ? const Value.absent()
          : Value(magicPath),
      equipment: Value(equipment),
      finances: Value(finances),
      background: Value(background),
      creationData: Value(creationData),
      metadata: Value(metadata),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Character.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Character(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      concept: serializer.fromJson<String?>(json['concept']),
      metatype: serializer.fromJson<String>(json['metatype']),
      attributes: serializer.fromJson<String>(json['attributes']),
      skills: serializer.fromJson<String>(json['skills']),
      qualities: serializer.fromJson<String>(json['qualities']),
      magicPath: serializer.fromJson<String?>(json['magicPath']),
      equipment: serializer.fromJson<String>(json['equipment']),
      finances: serializer.fromJson<String>(json['finances']),
      background: serializer.fromJson<String>(json['background']),
      creationData: serializer.fromJson<String>(json['creationData']),
      metadata: serializer.fromJson<String>(json['metadata']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'concept': serializer.toJson<String?>(concept),
      'metatype': serializer.toJson<String>(metatype),
      'attributes': serializer.toJson<String>(attributes),
      'skills': serializer.toJson<String>(skills),
      'qualities': serializer.toJson<String>(qualities),
      'magicPath': serializer.toJson<String?>(magicPath),
      'equipment': serializer.toJson<String>(equipment),
      'finances': serializer.toJson<String>(finances),
      'background': serializer.toJson<String>(background),
      'creationData': serializer.toJson<String>(creationData),
      'metadata': serializer.toJson<String>(metadata),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Character copyWith({
    int? id,
    String? name,
    Value<String?> concept = const Value.absent(),
    String? metatype,
    String? attributes,
    String? skills,
    String? qualities,
    Value<String?> magicPath = const Value.absent(),
    String? equipment,
    String? finances,
    String? background,
    String? creationData,
    String? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Character(
    id: id ?? this.id,
    name: name ?? this.name,
    concept: concept.present ? concept.value : this.concept,
    metatype: metatype ?? this.metatype,
    attributes: attributes ?? this.attributes,
    skills: skills ?? this.skills,
    qualities: qualities ?? this.qualities,
    magicPath: magicPath.present ? magicPath.value : this.magicPath,
    equipment: equipment ?? this.equipment,
    finances: finances ?? this.finances,
    background: background ?? this.background,
    creationData: creationData ?? this.creationData,
    metadata: metadata ?? this.metadata,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Character copyWithCompanion(CharactersCompanion data) {
    return Character(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      concept: data.concept.present ? data.concept.value : this.concept,
      metatype: data.metatype.present ? data.metatype.value : this.metatype,
      attributes: data.attributes.present
          ? data.attributes.value
          : this.attributes,
      skills: data.skills.present ? data.skills.value : this.skills,
      qualities: data.qualities.present ? data.qualities.value : this.qualities,
      magicPath: data.magicPath.present ? data.magicPath.value : this.magicPath,
      equipment: data.equipment.present ? data.equipment.value : this.equipment,
      finances: data.finances.present ? data.finances.value : this.finances,
      background: data.background.present
          ? data.background.value
          : this.background,
      creationData: data.creationData.present
          ? data.creationData.value
          : this.creationData,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Character(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('concept: $concept, ')
          ..write('metatype: $metatype, ')
          ..write('attributes: $attributes, ')
          ..write('skills: $skills, ')
          ..write('qualities: $qualities, ')
          ..write('magicPath: $magicPath, ')
          ..write('equipment: $equipment, ')
          ..write('finances: $finances, ')
          ..write('background: $background, ')
          ..write('creationData: $creationData, ')
          ..write('metadata: $metadata, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    concept,
    metatype,
    attributes,
    skills,
    qualities,
    magicPath,
    equipment,
    finances,
    background,
    creationData,
    metadata,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Character &&
          other.id == this.id &&
          other.name == this.name &&
          other.concept == this.concept &&
          other.metatype == this.metatype &&
          other.attributes == this.attributes &&
          other.skills == this.skills &&
          other.qualities == this.qualities &&
          other.magicPath == this.magicPath &&
          other.equipment == this.equipment &&
          other.finances == this.finances &&
          other.background == this.background &&
          other.creationData == this.creationData &&
          other.metadata == this.metadata &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CharactersCompanion extends UpdateCompanion<Character> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> concept;
  final Value<String> metatype;
  final Value<String> attributes;
  final Value<String> skills;
  final Value<String> qualities;
  final Value<String?> magicPath;
  final Value<String> equipment;
  final Value<String> finances;
  final Value<String> background;
  final Value<String> creationData;
  final Value<String> metadata;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CharactersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.concept = const Value.absent(),
    this.metatype = const Value.absent(),
    this.attributes = const Value.absent(),
    this.skills = const Value.absent(),
    this.qualities = const Value.absent(),
    this.magicPath = const Value.absent(),
    this.equipment = const Value.absent(),
    this.finances = const Value.absent(),
    this.background = const Value.absent(),
    this.creationData = const Value.absent(),
    this.metadata = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CharactersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.concept = const Value.absent(),
    required String metatype,
    required String attributes,
    required String skills,
    required String qualities,
    this.magicPath = const Value.absent(),
    required String equipment,
    required String finances,
    required String background,
    required String creationData,
    required String metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : name = Value(name),
       metatype = Value(metatype),
       attributes = Value(attributes),
       skills = Value(skills),
       qualities = Value(qualities),
       equipment = Value(equipment),
       finances = Value(finances),
       background = Value(background),
       creationData = Value(creationData),
       metadata = Value(metadata),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Character> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? concept,
    Expression<String>? metatype,
    Expression<String>? attributes,
    Expression<String>? skills,
    Expression<String>? qualities,
    Expression<String>? magicPath,
    Expression<String>? equipment,
    Expression<String>? finances,
    Expression<String>? background,
    Expression<String>? creationData,
    Expression<String>? metadata,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (concept != null) 'concept': concept,
      if (metatype != null) 'metatype': metatype,
      if (attributes != null) 'attributes': attributes,
      if (skills != null) 'skills': skills,
      if (qualities != null) 'qualities': qualities,
      if (magicPath != null) 'magic_path': magicPath,
      if (equipment != null) 'equipment': equipment,
      if (finances != null) 'finances': finances,
      if (background != null) 'background': background,
      if (creationData != null) 'creation_data': creationData,
      if (metadata != null) 'metadata': metadata,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CharactersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? concept,
    Value<String>? metatype,
    Value<String>? attributes,
    Value<String>? skills,
    Value<String>? qualities,
    Value<String?>? magicPath,
    Value<String>? equipment,
    Value<String>? finances,
    Value<String>? background,
    Value<String>? creationData,
    Value<String>? metadata,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return CharactersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      concept: concept ?? this.concept,
      metatype: metatype ?? this.metatype,
      attributes: attributes ?? this.attributes,
      skills: skills ?? this.skills,
      qualities: qualities ?? this.qualities,
      magicPath: magicPath ?? this.magicPath,
      equipment: equipment ?? this.equipment,
      finances: finances ?? this.finances,
      background: background ?? this.background,
      creationData: creationData ?? this.creationData,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (concept.present) {
      map['concept'] = Variable<String>(concept.value);
    }
    if (metatype.present) {
      map['metatype'] = Variable<String>(metatype.value);
    }
    if (attributes.present) {
      map['attributes'] = Variable<String>(attributes.value);
    }
    if (skills.present) {
      map['skills'] = Variable<String>(skills.value);
    }
    if (qualities.present) {
      map['qualities'] = Variable<String>(qualities.value);
    }
    if (magicPath.present) {
      map['magic_path'] = Variable<String>(magicPath.value);
    }
    if (equipment.present) {
      map['equipment'] = Variable<String>(equipment.value);
    }
    if (finances.present) {
      map['finances'] = Variable<String>(finances.value);
    }
    if (background.present) {
      map['background'] = Variable<String>(background.value);
    }
    if (creationData.present) {
      map['creation_data'] = Variable<String>(creationData.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(metadata.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharactersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('concept: $concept, ')
          ..write('metatype: $metatype, ')
          ..write('attributes: $attributes, ')
          ..write('skills: $skills, ')
          ..write('qualities: $qualities, ')
          ..write('magicPath: $magicPath, ')
          ..write('equipment: $equipment, ')
          ..write('finances: $finances, ')
          ..write('background: $background, ')
          ..write('creationData: $creationData, ')
          ..write('metadata: $metadata, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $RulebooksTable extends Rulebooks
    with TableInfo<$RulebooksTable, Rulebook> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RulebooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _importedAtMeta = const VerificationMeta(
    'importedAt',
  );
  @override
  late final GeneratedColumn<DateTime> importedAt = GeneratedColumn<DateTime>(
    'imported_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _checksumMeta = const VerificationMeta(
    'checksum',
  );
  @override
  late final GeneratedColumn<String> checksum = GeneratedColumn<String>(
    'checksum',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _schemaVersionMeta = const VerificationMeta(
    'schemaVersion',
  );
  @override
  late final GeneratedColumn<int> schemaVersion = GeneratedColumn<int>(
    'schema_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    version,
    language,
    filePath,
    importedAt,
    checksum,
    schemaVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rulebooks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Rulebook> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    }
    if (data.containsKey('imported_at')) {
      context.handle(
        _importedAtMeta,
        importedAt.isAcceptableOrUnknown(data['imported_at']!, _importedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_importedAtMeta);
    }
    if (data.containsKey('checksum')) {
      context.handle(
        _checksumMeta,
        checksum.isAcceptableOrUnknown(data['checksum']!, _checksumMeta),
      );
    } else if (isInserting) {
      context.missing(_checksumMeta);
    }
    if (data.containsKey('schema_version')) {
      context.handle(
        _schemaVersionMeta,
        schemaVersion.isAcceptableOrUnknown(
          data['schema_version']!,
          _schemaVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_schemaVersionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Rulebook map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Rulebook(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}version'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      ),
      importedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}imported_at'],
      )!,
      checksum: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}checksum'],
      )!,
      schemaVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schema_version'],
      )!,
    );
  }

  @override
  $RulebooksTable createAlias(String alias) {
    return $RulebooksTable(attachedDatabase, alias);
  }
}

class Rulebook extends DataClass implements Insertable<Rulebook> {
  final int id;
  final String name;
  final String version;
  final String language;
  final String? filePath;
  final DateTime importedAt;
  final String checksum;
  final int schemaVersion;
  const Rulebook({
    required this.id,
    required this.name,
    required this.version,
    required this.language,
    this.filePath,
    required this.importedAt,
    required this.checksum,
    required this.schemaVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['version'] = Variable<String>(version);
    map['language'] = Variable<String>(language);
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String>(filePath);
    }
    map['imported_at'] = Variable<DateTime>(importedAt);
    map['checksum'] = Variable<String>(checksum);
    map['schema_version'] = Variable<int>(schemaVersion);
    return map;
  }

  RulebooksCompanion toCompanion(bool nullToAbsent) {
    return RulebooksCompanion(
      id: Value(id),
      name: Value(name),
      version: Value(version),
      language: Value(language),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
      importedAt: Value(importedAt),
      checksum: Value(checksum),
      schemaVersion: Value(schemaVersion),
    );
  }

  factory Rulebook.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Rulebook(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      version: serializer.fromJson<String>(json['version']),
      language: serializer.fromJson<String>(json['language']),
      filePath: serializer.fromJson<String?>(json['filePath']),
      importedAt: serializer.fromJson<DateTime>(json['importedAt']),
      checksum: serializer.fromJson<String>(json['checksum']),
      schemaVersion: serializer.fromJson<int>(json['schemaVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'version': serializer.toJson<String>(version),
      'language': serializer.toJson<String>(language),
      'filePath': serializer.toJson<String?>(filePath),
      'importedAt': serializer.toJson<DateTime>(importedAt),
      'checksum': serializer.toJson<String>(checksum),
      'schemaVersion': serializer.toJson<int>(schemaVersion),
    };
  }

  Rulebook copyWith({
    int? id,
    String? name,
    String? version,
    String? language,
    Value<String?> filePath = const Value.absent(),
    DateTime? importedAt,
    String? checksum,
    int? schemaVersion,
  }) => Rulebook(
    id: id ?? this.id,
    name: name ?? this.name,
    version: version ?? this.version,
    language: language ?? this.language,
    filePath: filePath.present ? filePath.value : this.filePath,
    importedAt: importedAt ?? this.importedAt,
    checksum: checksum ?? this.checksum,
    schemaVersion: schemaVersion ?? this.schemaVersion,
  );
  Rulebook copyWithCompanion(RulebooksCompanion data) {
    return Rulebook(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      version: data.version.present ? data.version.value : this.version,
      language: data.language.present ? data.language.value : this.language,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      importedAt: data.importedAt.present
          ? data.importedAt.value
          : this.importedAt,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
      schemaVersion: data.schemaVersion.present
          ? data.schemaVersion.value
          : this.schemaVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Rulebook(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('version: $version, ')
          ..write('language: $language, ')
          ..write('filePath: $filePath, ')
          ..write('importedAt: $importedAt, ')
          ..write('checksum: $checksum, ')
          ..write('schemaVersion: $schemaVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    version,
    language,
    filePath,
    importedAt,
    checksum,
    schemaVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rulebook &&
          other.id == this.id &&
          other.name == this.name &&
          other.version == this.version &&
          other.language == this.language &&
          other.filePath == this.filePath &&
          other.importedAt == this.importedAt &&
          other.checksum == this.checksum &&
          other.schemaVersion == this.schemaVersion);
}

class RulebooksCompanion extends UpdateCompanion<Rulebook> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> version;
  final Value<String> language;
  final Value<String?> filePath;
  final Value<DateTime> importedAt;
  final Value<String> checksum;
  final Value<int> schemaVersion;
  const RulebooksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.version = const Value.absent(),
    this.language = const Value.absent(),
    this.filePath = const Value.absent(),
    this.importedAt = const Value.absent(),
    this.checksum = const Value.absent(),
    this.schemaVersion = const Value.absent(),
  });
  RulebooksCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String version,
    required String language,
    this.filePath = const Value.absent(),
    required DateTime importedAt,
    required String checksum,
    required int schemaVersion,
  }) : name = Value(name),
       version = Value(version),
       language = Value(language),
       importedAt = Value(importedAt),
       checksum = Value(checksum),
       schemaVersion = Value(schemaVersion);
  static Insertable<Rulebook> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? version,
    Expression<String>? language,
    Expression<String>? filePath,
    Expression<DateTime>? importedAt,
    Expression<String>? checksum,
    Expression<int>? schemaVersion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (version != null) 'version': version,
      if (language != null) 'language': language,
      if (filePath != null) 'file_path': filePath,
      if (importedAt != null) 'imported_at': importedAt,
      if (checksum != null) 'checksum': checksum,
      if (schemaVersion != null) 'schema_version': schemaVersion,
    });
  }

  RulebooksCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? version,
    Value<String>? language,
    Value<String?>? filePath,
    Value<DateTime>? importedAt,
    Value<String>? checksum,
    Value<int>? schemaVersion,
  }) {
    return RulebooksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      version: version ?? this.version,
      language: language ?? this.language,
      filePath: filePath ?? this.filePath,
      importedAt: importedAt ?? this.importedAt,
      checksum: checksum ?? this.checksum,
      schemaVersion: schemaVersion ?? this.schemaVersion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (importedAt.present) {
      map['imported_at'] = Variable<DateTime>(importedAt.value);
    }
    if (checksum.present) {
      map['checksum'] = Variable<String>(checksum.value);
    }
    if (schemaVersion.present) {
      map['schema_version'] = Variable<int>(schemaVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RulebooksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('version: $version, ')
          ..write('language: $language, ')
          ..write('filePath: $filePath, ')
          ..write('importedAt: $importedAt, ')
          ..write('checksum: $checksum, ')
          ..write('schemaVersion: $schemaVersion')
          ..write(')'))
        .toString();
  }
}

class $RulesTable extends Rules with TableInfo<$RulesTable, Rule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _rulebookIdMeta = const VerificationMeta(
    'rulebookId',
  );
  @override
  late final GeneratedColumn<int> rulebookId = GeneratedColumn<int>(
    'rulebook_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES rulebooks (id)',
    ),
  );
  static const VerificationMeta _ruleTypeMeta = const VerificationMeta(
    'ruleType',
  );
  @override
  late final GeneratedColumn<String> ruleType = GeneratedColumn<String>(
    'rule_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ruleKeyMeta = const VerificationMeta(
    'ruleKey',
  );
  @override
  late final GeneratedColumn<String> ruleKey = GeneratedColumn<String>(
    'rule_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataJsonMeta = const VerificationMeta(
    'dataJson',
  );
  @override
  late final GeneratedColumn<String> dataJson = GeneratedColumn<String>(
    'data_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dependenciesJsonMeta = const VerificationMeta(
    'dependenciesJson',
  );
  @override
  late final GeneratedColumn<String> dependenciesJson = GeneratedColumn<String>(
    'dependencies_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    rulebookId,
    ruleType,
    ruleKey,
    dataJson,
    dependenciesJson,
    priority,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rules';
  @override
  VerificationContext validateIntegrity(
    Insertable<Rule> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('rulebook_id')) {
      context.handle(
        _rulebookIdMeta,
        rulebookId.isAcceptableOrUnknown(data['rulebook_id']!, _rulebookIdMeta),
      );
    } else if (isInserting) {
      context.missing(_rulebookIdMeta);
    }
    if (data.containsKey('rule_type')) {
      context.handle(
        _ruleTypeMeta,
        ruleType.isAcceptableOrUnknown(data['rule_type']!, _ruleTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_ruleTypeMeta);
    }
    if (data.containsKey('rule_key')) {
      context.handle(
        _ruleKeyMeta,
        ruleKey.isAcceptableOrUnknown(data['rule_key']!, _ruleKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_ruleKeyMeta);
    }
    if (data.containsKey('data_json')) {
      context.handle(
        _dataJsonMeta,
        dataJson.isAcceptableOrUnknown(data['data_json']!, _dataJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_dataJsonMeta);
    }
    if (data.containsKey('dependencies_json')) {
      context.handle(
        _dependenciesJsonMeta,
        dependenciesJson.isAcceptableOrUnknown(
          data['dependencies_json']!,
          _dependenciesJsonMeta,
        ),
      );
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Rule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Rule(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      rulebookId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rulebook_id'],
      )!,
      ruleType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rule_type'],
      )!,
      ruleKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rule_key'],
      )!,
      dataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_json'],
      )!,
      dependenciesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dependencies_json'],
      ),
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}priority'],
      )!,
    );
  }

  @override
  $RulesTable createAlias(String alias) {
    return $RulesTable(attachedDatabase, alias);
  }
}

class Rule extends DataClass implements Insertable<Rule> {
  final int id;
  final int rulebookId;
  final String ruleType;
  final String ruleKey;
  final String dataJson;
  final String? dependenciesJson;
  final int priority;
  const Rule({
    required this.id,
    required this.rulebookId,
    required this.ruleType,
    required this.ruleKey,
    required this.dataJson,
    this.dependenciesJson,
    required this.priority,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['rulebook_id'] = Variable<int>(rulebookId);
    map['rule_type'] = Variable<String>(ruleType);
    map['rule_key'] = Variable<String>(ruleKey);
    map['data_json'] = Variable<String>(dataJson);
    if (!nullToAbsent || dependenciesJson != null) {
      map['dependencies_json'] = Variable<String>(dependenciesJson);
    }
    map['priority'] = Variable<int>(priority);
    return map;
  }

  RulesCompanion toCompanion(bool nullToAbsent) {
    return RulesCompanion(
      id: Value(id),
      rulebookId: Value(rulebookId),
      ruleType: Value(ruleType),
      ruleKey: Value(ruleKey),
      dataJson: Value(dataJson),
      dependenciesJson: dependenciesJson == null && nullToAbsent
          ? const Value.absent()
          : Value(dependenciesJson),
      priority: Value(priority),
    );
  }

  factory Rule.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Rule(
      id: serializer.fromJson<int>(json['id']),
      rulebookId: serializer.fromJson<int>(json['rulebookId']),
      ruleType: serializer.fromJson<String>(json['ruleType']),
      ruleKey: serializer.fromJson<String>(json['ruleKey']),
      dataJson: serializer.fromJson<String>(json['dataJson']),
      dependenciesJson: serializer.fromJson<String?>(json['dependenciesJson']),
      priority: serializer.fromJson<int>(json['priority']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'rulebookId': serializer.toJson<int>(rulebookId),
      'ruleType': serializer.toJson<String>(ruleType),
      'ruleKey': serializer.toJson<String>(ruleKey),
      'dataJson': serializer.toJson<String>(dataJson),
      'dependenciesJson': serializer.toJson<String?>(dependenciesJson),
      'priority': serializer.toJson<int>(priority),
    };
  }

  Rule copyWith({
    int? id,
    int? rulebookId,
    String? ruleType,
    String? ruleKey,
    String? dataJson,
    Value<String?> dependenciesJson = const Value.absent(),
    int? priority,
  }) => Rule(
    id: id ?? this.id,
    rulebookId: rulebookId ?? this.rulebookId,
    ruleType: ruleType ?? this.ruleType,
    ruleKey: ruleKey ?? this.ruleKey,
    dataJson: dataJson ?? this.dataJson,
    dependenciesJson: dependenciesJson.present
        ? dependenciesJson.value
        : this.dependenciesJson,
    priority: priority ?? this.priority,
  );
  Rule copyWithCompanion(RulesCompanion data) {
    return Rule(
      id: data.id.present ? data.id.value : this.id,
      rulebookId: data.rulebookId.present
          ? data.rulebookId.value
          : this.rulebookId,
      ruleType: data.ruleType.present ? data.ruleType.value : this.ruleType,
      ruleKey: data.ruleKey.present ? data.ruleKey.value : this.ruleKey,
      dataJson: data.dataJson.present ? data.dataJson.value : this.dataJson,
      dependenciesJson: data.dependenciesJson.present
          ? data.dependenciesJson.value
          : this.dependenciesJson,
      priority: data.priority.present ? data.priority.value : this.priority,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Rule(')
          ..write('id: $id, ')
          ..write('rulebookId: $rulebookId, ')
          ..write('ruleType: $ruleType, ')
          ..write('ruleKey: $ruleKey, ')
          ..write('dataJson: $dataJson, ')
          ..write('dependenciesJson: $dependenciesJson, ')
          ..write('priority: $priority')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    rulebookId,
    ruleType,
    ruleKey,
    dataJson,
    dependenciesJson,
    priority,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rule &&
          other.id == this.id &&
          other.rulebookId == this.rulebookId &&
          other.ruleType == this.ruleType &&
          other.ruleKey == this.ruleKey &&
          other.dataJson == this.dataJson &&
          other.dependenciesJson == this.dependenciesJson &&
          other.priority == this.priority);
}

class RulesCompanion extends UpdateCompanion<Rule> {
  final Value<int> id;
  final Value<int> rulebookId;
  final Value<String> ruleType;
  final Value<String> ruleKey;
  final Value<String> dataJson;
  final Value<String?> dependenciesJson;
  final Value<int> priority;
  const RulesCompanion({
    this.id = const Value.absent(),
    this.rulebookId = const Value.absent(),
    this.ruleType = const Value.absent(),
    this.ruleKey = const Value.absent(),
    this.dataJson = const Value.absent(),
    this.dependenciesJson = const Value.absent(),
    this.priority = const Value.absent(),
  });
  RulesCompanion.insert({
    this.id = const Value.absent(),
    required int rulebookId,
    required String ruleType,
    required String ruleKey,
    required String dataJson,
    this.dependenciesJson = const Value.absent(),
    this.priority = const Value.absent(),
  }) : rulebookId = Value(rulebookId),
       ruleType = Value(ruleType),
       ruleKey = Value(ruleKey),
       dataJson = Value(dataJson);
  static Insertable<Rule> custom({
    Expression<int>? id,
    Expression<int>? rulebookId,
    Expression<String>? ruleType,
    Expression<String>? ruleKey,
    Expression<String>? dataJson,
    Expression<String>? dependenciesJson,
    Expression<int>? priority,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rulebookId != null) 'rulebook_id': rulebookId,
      if (ruleType != null) 'rule_type': ruleType,
      if (ruleKey != null) 'rule_key': ruleKey,
      if (dataJson != null) 'data_json': dataJson,
      if (dependenciesJson != null) 'dependencies_json': dependenciesJson,
      if (priority != null) 'priority': priority,
    });
  }

  RulesCompanion copyWith({
    Value<int>? id,
    Value<int>? rulebookId,
    Value<String>? ruleType,
    Value<String>? ruleKey,
    Value<String>? dataJson,
    Value<String?>? dependenciesJson,
    Value<int>? priority,
  }) {
    return RulesCompanion(
      id: id ?? this.id,
      rulebookId: rulebookId ?? this.rulebookId,
      ruleType: ruleType ?? this.ruleType,
      ruleKey: ruleKey ?? this.ruleKey,
      dataJson: dataJson ?? this.dataJson,
      dependenciesJson: dependenciesJson ?? this.dependenciesJson,
      priority: priority ?? this.priority,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rulebookId.present) {
      map['rulebook_id'] = Variable<int>(rulebookId.value);
    }
    if (ruleType.present) {
      map['rule_type'] = Variable<String>(ruleType.value);
    }
    if (ruleKey.present) {
      map['rule_key'] = Variable<String>(ruleKey.value);
    }
    if (dataJson.present) {
      map['data_json'] = Variable<String>(dataJson.value);
    }
    if (dependenciesJson.present) {
      map['dependencies_json'] = Variable<String>(dependenciesJson.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RulesCompanion(')
          ..write('id: $id, ')
          ..write('rulebookId: $rulebookId, ')
          ..write('ruleType: $ruleType, ')
          ..write('ruleKey: $ruleKey, ')
          ..write('dataJson: $dataJson, ')
          ..write('dependenciesJson: $dependenciesJson, ')
          ..write('priority: $priority')
          ..write(')'))
        .toString();
  }
}

class $EquipmentTable extends Equipment
    with TableInfo<$EquipmentTable, EquipmentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _rulebookIdMeta = const VerificationMeta(
    'rulebookId',
  );
  @override
  late final GeneratedColumn<int> rulebookId = GeneratedColumn<int>(
    'rulebook_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES rulebooks (id)',
    ),
  );
  static const VerificationMeta _equipmentIdMeta = const VerificationMeta(
    'equipmentId',
  );
  @override
  late final GeneratedColumn<String> equipmentId = GeneratedColumn<String>(
    'equipment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _equipmentTypeMeta = const VerificationMeta(
    'equipmentType',
  );
  @override
  late final GeneratedColumn<String> equipmentType = GeneratedColumn<String>(
    'equipment_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataJsonMeta = const VerificationMeta(
    'dataJson',
  );
  @override
  late final GeneratedColumn<String> dataJson = GeneratedColumn<String>(
    'data_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _availabilityMeta = const VerificationMeta(
    'availability',
  );
  @override
  late final GeneratedColumn<int> availability = GeneratedColumn<int>(
    'availability',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _legalityMeta = const VerificationMeta(
    'legality',
  );
  @override
  late final GeneratedColumn<String> legality = GeneratedColumn<String>(
    'legality',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    rulebookId,
    equipmentId,
    name,
    equipmentType,
    dataJson,
    availability,
    legality,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipment';
  @override
  VerificationContext validateIntegrity(
    Insertable<EquipmentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('rulebook_id')) {
      context.handle(
        _rulebookIdMeta,
        rulebookId.isAcceptableOrUnknown(data['rulebook_id']!, _rulebookIdMeta),
      );
    } else if (isInserting) {
      context.missing(_rulebookIdMeta);
    }
    if (data.containsKey('equipment_id')) {
      context.handle(
        _equipmentIdMeta,
        equipmentId.isAcceptableOrUnknown(
          data['equipment_id']!,
          _equipmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_equipmentIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('equipment_type')) {
      context.handle(
        _equipmentTypeMeta,
        equipmentType.isAcceptableOrUnknown(
          data['equipment_type']!,
          _equipmentTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_equipmentTypeMeta);
    }
    if (data.containsKey('data_json')) {
      context.handle(
        _dataJsonMeta,
        dataJson.isAcceptableOrUnknown(data['data_json']!, _dataJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_dataJsonMeta);
    }
    if (data.containsKey('availability')) {
      context.handle(
        _availabilityMeta,
        availability.isAcceptableOrUnknown(
          data['availability']!,
          _availabilityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_availabilityMeta);
    }
    if (data.containsKey('legality')) {
      context.handle(
        _legalityMeta,
        legality.isAcceptableOrUnknown(data['legality']!, _legalityMeta),
      );
    } else if (isInserting) {
      context.missing(_legalityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EquipmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      rulebookId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rulebook_id'],
      )!,
      equipmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}equipment_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      equipmentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}equipment_type'],
      )!,
      dataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_json'],
      )!,
      availability: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}availability'],
      )!,
      legality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}legality'],
      )!,
    );
  }

  @override
  $EquipmentTable createAlias(String alias) {
    return $EquipmentTable(attachedDatabase, alias);
  }
}

class EquipmentData extends DataClass implements Insertable<EquipmentData> {
  final int id;
  final int rulebookId;
  final String equipmentId;
  final String name;
  final String equipmentType;
  final String dataJson;
  final int availability;
  final String legality;
  const EquipmentData({
    required this.id,
    required this.rulebookId,
    required this.equipmentId,
    required this.name,
    required this.equipmentType,
    required this.dataJson,
    required this.availability,
    required this.legality,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['rulebook_id'] = Variable<int>(rulebookId);
    map['equipment_id'] = Variable<String>(equipmentId);
    map['name'] = Variable<String>(name);
    map['equipment_type'] = Variable<String>(equipmentType);
    map['data_json'] = Variable<String>(dataJson);
    map['availability'] = Variable<int>(availability);
    map['legality'] = Variable<String>(legality);
    return map;
  }

  EquipmentCompanion toCompanion(bool nullToAbsent) {
    return EquipmentCompanion(
      id: Value(id),
      rulebookId: Value(rulebookId),
      equipmentId: Value(equipmentId),
      name: Value(name),
      equipmentType: Value(equipmentType),
      dataJson: Value(dataJson),
      availability: Value(availability),
      legality: Value(legality),
    );
  }

  factory EquipmentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentData(
      id: serializer.fromJson<int>(json['id']),
      rulebookId: serializer.fromJson<int>(json['rulebookId']),
      equipmentId: serializer.fromJson<String>(json['equipmentId']),
      name: serializer.fromJson<String>(json['name']),
      equipmentType: serializer.fromJson<String>(json['equipmentType']),
      dataJson: serializer.fromJson<String>(json['dataJson']),
      availability: serializer.fromJson<int>(json['availability']),
      legality: serializer.fromJson<String>(json['legality']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'rulebookId': serializer.toJson<int>(rulebookId),
      'equipmentId': serializer.toJson<String>(equipmentId),
      'name': serializer.toJson<String>(name),
      'equipmentType': serializer.toJson<String>(equipmentType),
      'dataJson': serializer.toJson<String>(dataJson),
      'availability': serializer.toJson<int>(availability),
      'legality': serializer.toJson<String>(legality),
    };
  }

  EquipmentData copyWith({
    int? id,
    int? rulebookId,
    String? equipmentId,
    String? name,
    String? equipmentType,
    String? dataJson,
    int? availability,
    String? legality,
  }) => EquipmentData(
    id: id ?? this.id,
    rulebookId: rulebookId ?? this.rulebookId,
    equipmentId: equipmentId ?? this.equipmentId,
    name: name ?? this.name,
    equipmentType: equipmentType ?? this.equipmentType,
    dataJson: dataJson ?? this.dataJson,
    availability: availability ?? this.availability,
    legality: legality ?? this.legality,
  );
  EquipmentData copyWithCompanion(EquipmentCompanion data) {
    return EquipmentData(
      id: data.id.present ? data.id.value : this.id,
      rulebookId: data.rulebookId.present
          ? data.rulebookId.value
          : this.rulebookId,
      equipmentId: data.equipmentId.present
          ? data.equipmentId.value
          : this.equipmentId,
      name: data.name.present ? data.name.value : this.name,
      equipmentType: data.equipmentType.present
          ? data.equipmentType.value
          : this.equipmentType,
      dataJson: data.dataJson.present ? data.dataJson.value : this.dataJson,
      availability: data.availability.present
          ? data.availability.value
          : this.availability,
      legality: data.legality.present ? data.legality.value : this.legality,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentData(')
          ..write('id: $id, ')
          ..write('rulebookId: $rulebookId, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('name: $name, ')
          ..write('equipmentType: $equipmentType, ')
          ..write('dataJson: $dataJson, ')
          ..write('availability: $availability, ')
          ..write('legality: $legality')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    rulebookId,
    equipmentId,
    name,
    equipmentType,
    dataJson,
    availability,
    legality,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentData &&
          other.id == this.id &&
          other.rulebookId == this.rulebookId &&
          other.equipmentId == this.equipmentId &&
          other.name == this.name &&
          other.equipmentType == this.equipmentType &&
          other.dataJson == this.dataJson &&
          other.availability == this.availability &&
          other.legality == this.legality);
}

class EquipmentCompanion extends UpdateCompanion<EquipmentData> {
  final Value<int> id;
  final Value<int> rulebookId;
  final Value<String> equipmentId;
  final Value<String> name;
  final Value<String> equipmentType;
  final Value<String> dataJson;
  final Value<int> availability;
  final Value<String> legality;
  const EquipmentCompanion({
    this.id = const Value.absent(),
    this.rulebookId = const Value.absent(),
    this.equipmentId = const Value.absent(),
    this.name = const Value.absent(),
    this.equipmentType = const Value.absent(),
    this.dataJson = const Value.absent(),
    this.availability = const Value.absent(),
    this.legality = const Value.absent(),
  });
  EquipmentCompanion.insert({
    this.id = const Value.absent(),
    required int rulebookId,
    required String equipmentId,
    required String name,
    required String equipmentType,
    required String dataJson,
    required int availability,
    required String legality,
  }) : rulebookId = Value(rulebookId),
       equipmentId = Value(equipmentId),
       name = Value(name),
       equipmentType = Value(equipmentType),
       dataJson = Value(dataJson),
       availability = Value(availability),
       legality = Value(legality);
  static Insertable<EquipmentData> custom({
    Expression<int>? id,
    Expression<int>? rulebookId,
    Expression<String>? equipmentId,
    Expression<String>? name,
    Expression<String>? equipmentType,
    Expression<String>? dataJson,
    Expression<int>? availability,
    Expression<String>? legality,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rulebookId != null) 'rulebook_id': rulebookId,
      if (equipmentId != null) 'equipment_id': equipmentId,
      if (name != null) 'name': name,
      if (equipmentType != null) 'equipment_type': equipmentType,
      if (dataJson != null) 'data_json': dataJson,
      if (availability != null) 'availability': availability,
      if (legality != null) 'legality': legality,
    });
  }

  EquipmentCompanion copyWith({
    Value<int>? id,
    Value<int>? rulebookId,
    Value<String>? equipmentId,
    Value<String>? name,
    Value<String>? equipmentType,
    Value<String>? dataJson,
    Value<int>? availability,
    Value<String>? legality,
  }) {
    return EquipmentCompanion(
      id: id ?? this.id,
      rulebookId: rulebookId ?? this.rulebookId,
      equipmentId: equipmentId ?? this.equipmentId,
      name: name ?? this.name,
      equipmentType: equipmentType ?? this.equipmentType,
      dataJson: dataJson ?? this.dataJson,
      availability: availability ?? this.availability,
      legality: legality ?? this.legality,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rulebookId.present) {
      map['rulebook_id'] = Variable<int>(rulebookId.value);
    }
    if (equipmentId.present) {
      map['equipment_id'] = Variable<String>(equipmentId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (equipmentType.present) {
      map['equipment_type'] = Variable<String>(equipmentType.value);
    }
    if (dataJson.present) {
      map['data_json'] = Variable<String>(dataJson.value);
    }
    if (availability.present) {
      map['availability'] = Variable<int>(availability.value);
    }
    if (legality.present) {
      map['legality'] = Variable<String>(legality.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentCompanion(')
          ..write('id: $id, ')
          ..write('rulebookId: $rulebookId, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('name: $name, ')
          ..write('equipmentType: $equipmentType, ')
          ..write('dataJson: $dataJson, ')
          ..write('availability: $availability, ')
          ..write('legality: $legality')
          ..write(')'))
        .toString();
  }
}

class $NpcsTable extends Npcs with TableInfo<$NpcsTable, Npc> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NpcsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _npcIdMeta = const VerificationMeta('npcId');
  @override
  late final GeneratedColumn<String> npcId = GeneratedColumn<String>(
    'npc_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _metatypeMeta = const VerificationMeta(
    'metatype',
  );
  @override
  late final GeneratedColumn<String> metatype = GeneratedColumn<String>(
    'metatype',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attributesMeta = const VerificationMeta(
    'attributes',
  );
  @override
  late final GeneratedColumn<String> attributes = GeneratedColumn<String>(
    'attributes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _skillsMeta = const VerificationMeta('skills');
  @override
  late final GeneratedColumn<String> skills = GeneratedColumn<String>(
    'skills',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gearMeta = const VerificationMeta('gear');
  @override
  late final GeneratedColumn<String> gear = GeneratedColumn<String>(
    'gear',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isHostileMeta = const VerificationMeta(
    'isHostile',
  );
  @override
  late final GeneratedColumn<bool> isHostile = GeneratedColumn<bool>(
    'is_hostile',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_hostile" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    npcId,
    name,
    metatype,
    role,
    attributes,
    skills,
    gear,
    notes,
    isHostile,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'npcs';
  @override
  VerificationContext validateIntegrity(
    Insertable<Npc> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('npc_id')) {
      context.handle(
        _npcIdMeta,
        npcId.isAcceptableOrUnknown(data['npc_id']!, _npcIdMeta),
      );
    } else if (isInserting) {
      context.missing(_npcIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('metatype')) {
      context.handle(
        _metatypeMeta,
        metatype.isAcceptableOrUnknown(data['metatype']!, _metatypeMeta),
      );
    } else if (isInserting) {
      context.missing(_metatypeMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('attributes')) {
      context.handle(
        _attributesMeta,
        attributes.isAcceptableOrUnknown(data['attributes']!, _attributesMeta),
      );
    } else if (isInserting) {
      context.missing(_attributesMeta);
    }
    if (data.containsKey('skills')) {
      context.handle(
        _skillsMeta,
        skills.isAcceptableOrUnknown(data['skills']!, _skillsMeta),
      );
    } else if (isInserting) {
      context.missing(_skillsMeta);
    }
    if (data.containsKey('gear')) {
      context.handle(
        _gearMeta,
        gear.isAcceptableOrUnknown(data['gear']!, _gearMeta),
      );
    } else if (isInserting) {
      context.missing(_gearMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    if (data.containsKey('is_hostile')) {
      context.handle(
        _isHostileMeta,
        isHostile.isAcceptableOrUnknown(data['is_hostile']!, _isHostileMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Npc map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Npc(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      npcId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}npc_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      metatype: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metatype'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      attributes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attributes'],
      )!,
      skills: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}skills'],
      )!,
      gear: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gear'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      isHostile: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_hostile'],
      )!,
    );
  }

  @override
  $NpcsTable createAlias(String alias) {
    return $NpcsTable(attachedDatabase, alias);
  }
}

class Npc extends DataClass implements Insertable<Npc> {
  final int id;
  final String npcId;
  final String name;
  final String metatype;
  final String role;
  final String attributes;
  final String skills;
  final String gear;
  final String notes;
  final bool isHostile;
  const Npc({
    required this.id,
    required this.npcId,
    required this.name,
    required this.metatype,
    required this.role,
    required this.attributes,
    required this.skills,
    required this.gear,
    required this.notes,
    required this.isHostile,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['npc_id'] = Variable<String>(npcId);
    map['name'] = Variable<String>(name);
    map['metatype'] = Variable<String>(metatype);
    map['role'] = Variable<String>(role);
    map['attributes'] = Variable<String>(attributes);
    map['skills'] = Variable<String>(skills);
    map['gear'] = Variable<String>(gear);
    map['notes'] = Variable<String>(notes);
    map['is_hostile'] = Variable<bool>(isHostile);
    return map;
  }

  NpcsCompanion toCompanion(bool nullToAbsent) {
    return NpcsCompanion(
      id: Value(id),
      npcId: Value(npcId),
      name: Value(name),
      metatype: Value(metatype),
      role: Value(role),
      attributes: Value(attributes),
      skills: Value(skills),
      gear: Value(gear),
      notes: Value(notes),
      isHostile: Value(isHostile),
    );
  }

  factory Npc.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Npc(
      id: serializer.fromJson<int>(json['id']),
      npcId: serializer.fromJson<String>(json['npcId']),
      name: serializer.fromJson<String>(json['name']),
      metatype: serializer.fromJson<String>(json['metatype']),
      role: serializer.fromJson<String>(json['role']),
      attributes: serializer.fromJson<String>(json['attributes']),
      skills: serializer.fromJson<String>(json['skills']),
      gear: serializer.fromJson<String>(json['gear']),
      notes: serializer.fromJson<String>(json['notes']),
      isHostile: serializer.fromJson<bool>(json['isHostile']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'npcId': serializer.toJson<String>(npcId),
      'name': serializer.toJson<String>(name),
      'metatype': serializer.toJson<String>(metatype),
      'role': serializer.toJson<String>(role),
      'attributes': serializer.toJson<String>(attributes),
      'skills': serializer.toJson<String>(skills),
      'gear': serializer.toJson<String>(gear),
      'notes': serializer.toJson<String>(notes),
      'isHostile': serializer.toJson<bool>(isHostile),
    };
  }

  Npc copyWith({
    int? id,
    String? npcId,
    String? name,
    String? metatype,
    String? role,
    String? attributes,
    String? skills,
    String? gear,
    String? notes,
    bool? isHostile,
  }) => Npc(
    id: id ?? this.id,
    npcId: npcId ?? this.npcId,
    name: name ?? this.name,
    metatype: metatype ?? this.metatype,
    role: role ?? this.role,
    attributes: attributes ?? this.attributes,
    skills: skills ?? this.skills,
    gear: gear ?? this.gear,
    notes: notes ?? this.notes,
    isHostile: isHostile ?? this.isHostile,
  );
  Npc copyWithCompanion(NpcsCompanion data) {
    return Npc(
      id: data.id.present ? data.id.value : this.id,
      npcId: data.npcId.present ? data.npcId.value : this.npcId,
      name: data.name.present ? data.name.value : this.name,
      metatype: data.metatype.present ? data.metatype.value : this.metatype,
      role: data.role.present ? data.role.value : this.role,
      attributes: data.attributes.present
          ? data.attributes.value
          : this.attributes,
      skills: data.skills.present ? data.skills.value : this.skills,
      gear: data.gear.present ? data.gear.value : this.gear,
      notes: data.notes.present ? data.notes.value : this.notes,
      isHostile: data.isHostile.present ? data.isHostile.value : this.isHostile,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Npc(')
          ..write('id: $id, ')
          ..write('npcId: $npcId, ')
          ..write('name: $name, ')
          ..write('metatype: $metatype, ')
          ..write('role: $role, ')
          ..write('attributes: $attributes, ')
          ..write('skills: $skills, ')
          ..write('gear: $gear, ')
          ..write('notes: $notes, ')
          ..write('isHostile: $isHostile')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    npcId,
    name,
    metatype,
    role,
    attributes,
    skills,
    gear,
    notes,
    isHostile,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Npc &&
          other.id == this.id &&
          other.npcId == this.npcId &&
          other.name == this.name &&
          other.metatype == this.metatype &&
          other.role == this.role &&
          other.attributes == this.attributes &&
          other.skills == this.skills &&
          other.gear == this.gear &&
          other.notes == this.notes &&
          other.isHostile == this.isHostile);
}

class NpcsCompanion extends UpdateCompanion<Npc> {
  final Value<int> id;
  final Value<String> npcId;
  final Value<String> name;
  final Value<String> metatype;
  final Value<String> role;
  final Value<String> attributes;
  final Value<String> skills;
  final Value<String> gear;
  final Value<String> notes;
  final Value<bool> isHostile;
  const NpcsCompanion({
    this.id = const Value.absent(),
    this.npcId = const Value.absent(),
    this.name = const Value.absent(),
    this.metatype = const Value.absent(),
    this.role = const Value.absent(),
    this.attributes = const Value.absent(),
    this.skills = const Value.absent(),
    this.gear = const Value.absent(),
    this.notes = const Value.absent(),
    this.isHostile = const Value.absent(),
  });
  NpcsCompanion.insert({
    this.id = const Value.absent(),
    required String npcId,
    required String name,
    required String metatype,
    required String role,
    required String attributes,
    required String skills,
    required String gear,
    required String notes,
    this.isHostile = const Value.absent(),
  }) : npcId = Value(npcId),
       name = Value(name),
       metatype = Value(metatype),
       role = Value(role),
       attributes = Value(attributes),
       skills = Value(skills),
       gear = Value(gear),
       notes = Value(notes);
  static Insertable<Npc> custom({
    Expression<int>? id,
    Expression<String>? npcId,
    Expression<String>? name,
    Expression<String>? metatype,
    Expression<String>? role,
    Expression<String>? attributes,
    Expression<String>? skills,
    Expression<String>? gear,
    Expression<String>? notes,
    Expression<bool>? isHostile,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (npcId != null) 'npc_id': npcId,
      if (name != null) 'name': name,
      if (metatype != null) 'metatype': metatype,
      if (role != null) 'role': role,
      if (attributes != null) 'attributes': attributes,
      if (skills != null) 'skills': skills,
      if (gear != null) 'gear': gear,
      if (notes != null) 'notes': notes,
      if (isHostile != null) 'is_hostile': isHostile,
    });
  }

  NpcsCompanion copyWith({
    Value<int>? id,
    Value<String>? npcId,
    Value<String>? name,
    Value<String>? metatype,
    Value<String>? role,
    Value<String>? attributes,
    Value<String>? skills,
    Value<String>? gear,
    Value<String>? notes,
    Value<bool>? isHostile,
  }) {
    return NpcsCompanion(
      id: id ?? this.id,
      npcId: npcId ?? this.npcId,
      name: name ?? this.name,
      metatype: metatype ?? this.metatype,
      role: role ?? this.role,
      attributes: attributes ?? this.attributes,
      skills: skills ?? this.skills,
      gear: gear ?? this.gear,
      notes: notes ?? this.notes,
      isHostile: isHostile ?? this.isHostile,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (npcId.present) {
      map['npc_id'] = Variable<String>(npcId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (metatype.present) {
      map['metatype'] = Variable<String>(metatype.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (attributes.present) {
      map['attributes'] = Variable<String>(attributes.value);
    }
    if (skills.present) {
      map['skills'] = Variable<String>(skills.value);
    }
    if (gear.present) {
      map['gear'] = Variable<String>(gear.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isHostile.present) {
      map['is_hostile'] = Variable<bool>(isHostile.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NpcsCompanion(')
          ..write('id: $id, ')
          ..write('npcId: $npcId, ')
          ..write('name: $name, ')
          ..write('metatype: $metatype, ')
          ..write('role: $role, ')
          ..write('attributes: $attributes, ')
          ..write('skills: $skills, ')
          ..write('gear: $gear, ')
          ..write('notes: $notes, ')
          ..write('isHostile: $isHostile')
          ..write(')'))
        .toString();
  }
}

class $HostsTable extends Hosts with TableInfo<$HostsTable, Host> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HostsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _hostIdMeta = const VerificationMeta('hostId');
  @override
  late final GeneratedColumn<String> hostId = GeneratedColumn<String>(
    'host_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hostTypeMeta = const VerificationMeta(
    'hostType',
  );
  @override
  late final GeneratedColumn<String> hostType = GeneratedColumn<String>(
    'host_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _securityMeta = const VerificationMeta(
    'security',
  );
  @override
  late final GeneratedColumn<int> security = GeneratedColumn<int>(
    'security',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _systemsMeta = const VerificationMeta(
    'systems',
  );
  @override
  late final GeneratedColumn<String> systems = GeneratedColumn<String>(
    'systems',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iceMeta = const VerificationMeta('ice');
  @override
  late final GeneratedColumn<String> ice = GeneratedColumn<String>(
    'ice',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accessMeta = const VerificationMeta('access');
  @override
  late final GeneratedColumn<String> access = GeneratedColumn<String>(
    'access',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    hostId,
    name,
    hostType,
    security,
    systems,
    ice,
    access,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hosts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Host> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('host_id')) {
      context.handle(
        _hostIdMeta,
        hostId.isAcceptableOrUnknown(data['host_id']!, _hostIdMeta),
      );
    } else if (isInserting) {
      context.missing(_hostIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('host_type')) {
      context.handle(
        _hostTypeMeta,
        hostType.isAcceptableOrUnknown(data['host_type']!, _hostTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_hostTypeMeta);
    }
    if (data.containsKey('security')) {
      context.handle(
        _securityMeta,
        security.isAcceptableOrUnknown(data['security']!, _securityMeta),
      );
    } else if (isInserting) {
      context.missing(_securityMeta);
    }
    if (data.containsKey('systems')) {
      context.handle(
        _systemsMeta,
        systems.isAcceptableOrUnknown(data['systems']!, _systemsMeta),
      );
    } else if (isInserting) {
      context.missing(_systemsMeta);
    }
    if (data.containsKey('ice')) {
      context.handle(
        _iceMeta,
        ice.isAcceptableOrUnknown(data['ice']!, _iceMeta),
      );
    } else if (isInserting) {
      context.missing(_iceMeta);
    }
    if (data.containsKey('access')) {
      context.handle(
        _accessMeta,
        access.isAcceptableOrUnknown(data['access']!, _accessMeta),
      );
    } else if (isInserting) {
      context.missing(_accessMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Host map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Host(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      hostId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}host_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      hostType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}host_type'],
      )!,
      security: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}security'],
      )!,
      systems: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}systems'],
      )!,
      ice: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ice'],
      )!,
      access: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}access'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
    );
  }

  @override
  $HostsTable createAlias(String alias) {
    return $HostsTable(attachedDatabase, alias);
  }
}

class Host extends DataClass implements Insertable<Host> {
  final int id;
  final String hostId;
  final String name;
  final String hostType;
  final int security;
  final String systems;
  final String ice;
  final String access;
  final String notes;
  const Host({
    required this.id,
    required this.hostId,
    required this.name,
    required this.hostType,
    required this.security,
    required this.systems,
    required this.ice,
    required this.access,
    required this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['host_id'] = Variable<String>(hostId);
    map['name'] = Variable<String>(name);
    map['host_type'] = Variable<String>(hostType);
    map['security'] = Variable<int>(security);
    map['systems'] = Variable<String>(systems);
    map['ice'] = Variable<String>(ice);
    map['access'] = Variable<String>(access);
    map['notes'] = Variable<String>(notes);
    return map;
  }

  HostsCompanion toCompanion(bool nullToAbsent) {
    return HostsCompanion(
      id: Value(id),
      hostId: Value(hostId),
      name: Value(name),
      hostType: Value(hostType),
      security: Value(security),
      systems: Value(systems),
      ice: Value(ice),
      access: Value(access),
      notes: Value(notes),
    );
  }

  factory Host.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Host(
      id: serializer.fromJson<int>(json['id']),
      hostId: serializer.fromJson<String>(json['hostId']),
      name: serializer.fromJson<String>(json['name']),
      hostType: serializer.fromJson<String>(json['hostType']),
      security: serializer.fromJson<int>(json['security']),
      systems: serializer.fromJson<String>(json['systems']),
      ice: serializer.fromJson<String>(json['ice']),
      access: serializer.fromJson<String>(json['access']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hostId': serializer.toJson<String>(hostId),
      'name': serializer.toJson<String>(name),
      'hostType': serializer.toJson<String>(hostType),
      'security': serializer.toJson<int>(security),
      'systems': serializer.toJson<String>(systems),
      'ice': serializer.toJson<String>(ice),
      'access': serializer.toJson<String>(access),
      'notes': serializer.toJson<String>(notes),
    };
  }

  Host copyWith({
    int? id,
    String? hostId,
    String? name,
    String? hostType,
    int? security,
    String? systems,
    String? ice,
    String? access,
    String? notes,
  }) => Host(
    id: id ?? this.id,
    hostId: hostId ?? this.hostId,
    name: name ?? this.name,
    hostType: hostType ?? this.hostType,
    security: security ?? this.security,
    systems: systems ?? this.systems,
    ice: ice ?? this.ice,
    access: access ?? this.access,
    notes: notes ?? this.notes,
  );
  Host copyWithCompanion(HostsCompanion data) {
    return Host(
      id: data.id.present ? data.id.value : this.id,
      hostId: data.hostId.present ? data.hostId.value : this.hostId,
      name: data.name.present ? data.name.value : this.name,
      hostType: data.hostType.present ? data.hostType.value : this.hostType,
      security: data.security.present ? data.security.value : this.security,
      systems: data.systems.present ? data.systems.value : this.systems,
      ice: data.ice.present ? data.ice.value : this.ice,
      access: data.access.present ? data.access.value : this.access,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Host(')
          ..write('id: $id, ')
          ..write('hostId: $hostId, ')
          ..write('name: $name, ')
          ..write('hostType: $hostType, ')
          ..write('security: $security, ')
          ..write('systems: $systems, ')
          ..write('ice: $ice, ')
          ..write('access: $access, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    hostId,
    name,
    hostType,
    security,
    systems,
    ice,
    access,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Host &&
          other.id == this.id &&
          other.hostId == this.hostId &&
          other.name == this.name &&
          other.hostType == this.hostType &&
          other.security == this.security &&
          other.systems == this.systems &&
          other.ice == this.ice &&
          other.access == this.access &&
          other.notes == this.notes);
}

class HostsCompanion extends UpdateCompanion<Host> {
  final Value<int> id;
  final Value<String> hostId;
  final Value<String> name;
  final Value<String> hostType;
  final Value<int> security;
  final Value<String> systems;
  final Value<String> ice;
  final Value<String> access;
  final Value<String> notes;
  const HostsCompanion({
    this.id = const Value.absent(),
    this.hostId = const Value.absent(),
    this.name = const Value.absent(),
    this.hostType = const Value.absent(),
    this.security = const Value.absent(),
    this.systems = const Value.absent(),
    this.ice = const Value.absent(),
    this.access = const Value.absent(),
    this.notes = const Value.absent(),
  });
  HostsCompanion.insert({
    this.id = const Value.absent(),
    required String hostId,
    required String name,
    required String hostType,
    required int security,
    required String systems,
    required String ice,
    required String access,
    required String notes,
  }) : hostId = Value(hostId),
       name = Value(name),
       hostType = Value(hostType),
       security = Value(security),
       systems = Value(systems),
       ice = Value(ice),
       access = Value(access),
       notes = Value(notes);
  static Insertable<Host> custom({
    Expression<int>? id,
    Expression<String>? hostId,
    Expression<String>? name,
    Expression<String>? hostType,
    Expression<int>? security,
    Expression<String>? systems,
    Expression<String>? ice,
    Expression<String>? access,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hostId != null) 'host_id': hostId,
      if (name != null) 'name': name,
      if (hostType != null) 'host_type': hostType,
      if (security != null) 'security': security,
      if (systems != null) 'systems': systems,
      if (ice != null) 'ice': ice,
      if (access != null) 'access': access,
      if (notes != null) 'notes': notes,
    });
  }

  HostsCompanion copyWith({
    Value<int>? id,
    Value<String>? hostId,
    Value<String>? name,
    Value<String>? hostType,
    Value<int>? security,
    Value<String>? systems,
    Value<String>? ice,
    Value<String>? access,
    Value<String>? notes,
  }) {
    return HostsCompanion(
      id: id ?? this.id,
      hostId: hostId ?? this.hostId,
      name: name ?? this.name,
      hostType: hostType ?? this.hostType,
      security: security ?? this.security,
      systems: systems ?? this.systems,
      ice: ice ?? this.ice,
      access: access ?? this.access,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hostId.present) {
      map['host_id'] = Variable<String>(hostId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (hostType.present) {
      map['host_type'] = Variable<String>(hostType.value);
    }
    if (security.present) {
      map['security'] = Variable<int>(security.value);
    }
    if (systems.present) {
      map['systems'] = Variable<String>(systems.value);
    }
    if (ice.present) {
      map['ice'] = Variable<String>(ice.value);
    }
    if (access.present) {
      map['access'] = Variable<String>(access.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HostsCompanion(')
          ..write('id: $id, ')
          ..write('hostId: $hostId, ')
          ..write('name: $name, ')
          ..write('hostType: $hostType, ')
          ..write('security: $security, ')
          ..write('systems: $systems, ')
          ..write('ice: $ice, ')
          ..write('access: $access, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $LocationsTable extends Locations
    with TableInfo<$LocationsTable, Location> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _locationIdMeta = const VerificationMeta(
    'locationId',
  );
  @override
  late final GeneratedColumn<String> locationId = GeneratedColumn<String>(
    'location_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationTypeMeta = const VerificationMeta(
    'locationType',
  );
  @override
  late final GeneratedColumn<String> locationType = GeneratedColumn<String>(
    'location_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _connectionsMeta = const VerificationMeta(
    'connections',
  );
  @override
  late final GeneratedColumn<String> connections = GeneratedColumn<String>(
    'connections',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _npcsMeta = const VerificationMeta('npcs');
  @override
  late final GeneratedColumn<String> npcs = GeneratedColumn<String>(
    'npcs',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _securityMeta = const VerificationMeta(
    'security',
  );
  @override
  late final GeneratedColumn<String> security = GeneratedColumn<String>(
    'security',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    locationId,
    name,
    locationType,
    description,
    connections,
    npcs,
    security,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'locations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Location> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('location_id')) {
      context.handle(
        _locationIdMeta,
        locationId.isAcceptableOrUnknown(data['location_id']!, _locationIdMeta),
      );
    } else if (isInserting) {
      context.missing(_locationIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('location_type')) {
      context.handle(
        _locationTypeMeta,
        locationType.isAcceptableOrUnknown(
          data['location_type']!,
          _locationTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_locationTypeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('connections')) {
      context.handle(
        _connectionsMeta,
        connections.isAcceptableOrUnknown(
          data['connections']!,
          _connectionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_connectionsMeta);
    }
    if (data.containsKey('npcs')) {
      context.handle(
        _npcsMeta,
        npcs.isAcceptableOrUnknown(data['npcs']!, _npcsMeta),
      );
    } else if (isInserting) {
      context.missing(_npcsMeta);
    }
    if (data.containsKey('security')) {
      context.handle(
        _securityMeta,
        security.isAcceptableOrUnknown(data['security']!, _securityMeta),
      );
    } else if (isInserting) {
      context.missing(_securityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Location map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Location(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      locationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      locationType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      connections: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}connections'],
      )!,
      npcs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}npcs'],
      )!,
      security: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}security'],
      )!,
    );
  }

  @override
  $LocationsTable createAlias(String alias) {
    return $LocationsTable(attachedDatabase, alias);
  }
}

class Location extends DataClass implements Insertable<Location> {
  final int id;
  final String locationId;
  final String name;
  final String locationType;
  final String description;
  final String connections;
  final String npcs;
  final String security;
  const Location({
    required this.id,
    required this.locationId,
    required this.name,
    required this.locationType,
    required this.description,
    required this.connections,
    required this.npcs,
    required this.security,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['location_id'] = Variable<String>(locationId);
    map['name'] = Variable<String>(name);
    map['location_type'] = Variable<String>(locationType);
    map['description'] = Variable<String>(description);
    map['connections'] = Variable<String>(connections);
    map['npcs'] = Variable<String>(npcs);
    map['security'] = Variable<String>(security);
    return map;
  }

  LocationsCompanion toCompanion(bool nullToAbsent) {
    return LocationsCompanion(
      id: Value(id),
      locationId: Value(locationId),
      name: Value(name),
      locationType: Value(locationType),
      description: Value(description),
      connections: Value(connections),
      npcs: Value(npcs),
      security: Value(security),
    );
  }

  factory Location.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Location(
      id: serializer.fromJson<int>(json['id']),
      locationId: serializer.fromJson<String>(json['locationId']),
      name: serializer.fromJson<String>(json['name']),
      locationType: serializer.fromJson<String>(json['locationType']),
      description: serializer.fromJson<String>(json['description']),
      connections: serializer.fromJson<String>(json['connections']),
      npcs: serializer.fromJson<String>(json['npcs']),
      security: serializer.fromJson<String>(json['security']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'locationId': serializer.toJson<String>(locationId),
      'name': serializer.toJson<String>(name),
      'locationType': serializer.toJson<String>(locationType),
      'description': serializer.toJson<String>(description),
      'connections': serializer.toJson<String>(connections),
      'npcs': serializer.toJson<String>(npcs),
      'security': serializer.toJson<String>(security),
    };
  }

  Location copyWith({
    int? id,
    String? locationId,
    String? name,
    String? locationType,
    String? description,
    String? connections,
    String? npcs,
    String? security,
  }) => Location(
    id: id ?? this.id,
    locationId: locationId ?? this.locationId,
    name: name ?? this.name,
    locationType: locationType ?? this.locationType,
    description: description ?? this.description,
    connections: connections ?? this.connections,
    npcs: npcs ?? this.npcs,
    security: security ?? this.security,
  );
  Location copyWithCompanion(LocationsCompanion data) {
    return Location(
      id: data.id.present ? data.id.value : this.id,
      locationId: data.locationId.present
          ? data.locationId.value
          : this.locationId,
      name: data.name.present ? data.name.value : this.name,
      locationType: data.locationType.present
          ? data.locationType.value
          : this.locationType,
      description: data.description.present
          ? data.description.value
          : this.description,
      connections: data.connections.present
          ? data.connections.value
          : this.connections,
      npcs: data.npcs.present ? data.npcs.value : this.npcs,
      security: data.security.present ? data.security.value : this.security,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Location(')
          ..write('id: $id, ')
          ..write('locationId: $locationId, ')
          ..write('name: $name, ')
          ..write('locationType: $locationType, ')
          ..write('description: $description, ')
          ..write('connections: $connections, ')
          ..write('npcs: $npcs, ')
          ..write('security: $security')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    locationId,
    name,
    locationType,
    description,
    connections,
    npcs,
    security,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Location &&
          other.id == this.id &&
          other.locationId == this.locationId &&
          other.name == this.name &&
          other.locationType == this.locationType &&
          other.description == this.description &&
          other.connections == this.connections &&
          other.npcs == this.npcs &&
          other.security == this.security);
}

class LocationsCompanion extends UpdateCompanion<Location> {
  final Value<int> id;
  final Value<String> locationId;
  final Value<String> name;
  final Value<String> locationType;
  final Value<String> description;
  final Value<String> connections;
  final Value<String> npcs;
  final Value<String> security;
  const LocationsCompanion({
    this.id = const Value.absent(),
    this.locationId = const Value.absent(),
    this.name = const Value.absent(),
    this.locationType = const Value.absent(),
    this.description = const Value.absent(),
    this.connections = const Value.absent(),
    this.npcs = const Value.absent(),
    this.security = const Value.absent(),
  });
  LocationsCompanion.insert({
    this.id = const Value.absent(),
    required String locationId,
    required String name,
    required String locationType,
    required String description,
    required String connections,
    required String npcs,
    required String security,
  }) : locationId = Value(locationId),
       name = Value(name),
       locationType = Value(locationType),
       description = Value(description),
       connections = Value(connections),
       npcs = Value(npcs),
       security = Value(security);
  static Insertable<Location> custom({
    Expression<int>? id,
    Expression<String>? locationId,
    Expression<String>? name,
    Expression<String>? locationType,
    Expression<String>? description,
    Expression<String>? connections,
    Expression<String>? npcs,
    Expression<String>? security,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (locationId != null) 'location_id': locationId,
      if (name != null) 'name': name,
      if (locationType != null) 'location_type': locationType,
      if (description != null) 'description': description,
      if (connections != null) 'connections': connections,
      if (npcs != null) 'npcs': npcs,
      if (security != null) 'security': security,
    });
  }

  LocationsCompanion copyWith({
    Value<int>? id,
    Value<String>? locationId,
    Value<String>? name,
    Value<String>? locationType,
    Value<String>? description,
    Value<String>? connections,
    Value<String>? npcs,
    Value<String>? security,
  }) {
    return LocationsCompanion(
      id: id ?? this.id,
      locationId: locationId ?? this.locationId,
      name: name ?? this.name,
      locationType: locationType ?? this.locationType,
      description: description ?? this.description,
      connections: connections ?? this.connections,
      npcs: npcs ?? this.npcs,
      security: security ?? this.security,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<String>(locationId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (locationType.present) {
      map['location_type'] = Variable<String>(locationType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (connections.present) {
      map['connections'] = Variable<String>(connections.value);
    }
    if (npcs.present) {
      map['npcs'] = Variable<String>(npcs.value);
    }
    if (security.present) {
      map['security'] = Variable<String>(security.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationsCompanion(')
          ..write('id: $id, ')
          ..write('locationId: $locationId, ')
          ..write('name: $name, ')
          ..write('locationType: $locationType, ')
          ..write('description: $description, ')
          ..write('connections: $connections, ')
          ..write('npcs: $npcs, ')
          ..write('security: $security')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CharactersTable characters = $CharactersTable(this);
  late final $RulebooksTable rulebooks = $RulebooksTable(this);
  late final $RulesTable rules = $RulesTable(this);
  late final $EquipmentTable equipment = $EquipmentTable(this);
  late final $NpcsTable npcs = $NpcsTable(this);
  late final $HostsTable hosts = $HostsTable(this);
  late final $LocationsTable locations = $LocationsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    characters,
    rulebooks,
    rules,
    equipment,
    npcs,
    hosts,
    locations,
  ];
}

typedef $$CharactersTableCreateCompanionBuilder =
    CharactersCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> concept,
      required String metatype,
      required String attributes,
      required String skills,
      required String qualities,
      Value<String?> magicPath,
      required String equipment,
      required String finances,
      required String background,
      required String creationData,
      required String metadata,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$CharactersTableUpdateCompanionBuilder =
    CharactersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> concept,
      Value<String> metatype,
      Value<String> attributes,
      Value<String> skills,
      Value<String> qualities,
      Value<String?> magicPath,
      Value<String> equipment,
      Value<String> finances,
      Value<String> background,
      Value<String> creationData,
      Value<String> metadata,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$CharactersTableFilterComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get concept => $composableBuilder(
    column: $table.concept,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metatype => $composableBuilder(
    column: $table.metatype,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attributes => $composableBuilder(
    column: $table.attributes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get skills => $composableBuilder(
    column: $table.skills,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get qualities => $composableBuilder(
    column: $table.qualities,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get magicPath => $composableBuilder(
    column: $table.magicPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get equipment => $composableBuilder(
    column: $table.equipment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get finances => $composableBuilder(
    column: $table.finances,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get background => $composableBuilder(
    column: $table.background,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get creationData => $composableBuilder(
    column: $table.creationData,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CharactersTableOrderingComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get concept => $composableBuilder(
    column: $table.concept,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metatype => $composableBuilder(
    column: $table.metatype,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attributes => $composableBuilder(
    column: $table.attributes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get skills => $composableBuilder(
    column: $table.skills,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get qualities => $composableBuilder(
    column: $table.qualities,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get magicPath => $composableBuilder(
    column: $table.magicPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get equipment => $composableBuilder(
    column: $table.equipment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get finances => $composableBuilder(
    column: $table.finances,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get background => $composableBuilder(
    column: $table.background,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get creationData => $composableBuilder(
    column: $table.creationData,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CharactersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get concept =>
      $composableBuilder(column: $table.concept, builder: (column) => column);

  GeneratedColumn<String> get metatype =>
      $composableBuilder(column: $table.metatype, builder: (column) => column);

  GeneratedColumn<String> get attributes => $composableBuilder(
    column: $table.attributes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get skills =>
      $composableBuilder(column: $table.skills, builder: (column) => column);

  GeneratedColumn<String> get qualities =>
      $composableBuilder(column: $table.qualities, builder: (column) => column);

  GeneratedColumn<String> get magicPath =>
      $composableBuilder(column: $table.magicPath, builder: (column) => column);

  GeneratedColumn<String> get equipment =>
      $composableBuilder(column: $table.equipment, builder: (column) => column);

  GeneratedColumn<String> get finances =>
      $composableBuilder(column: $table.finances, builder: (column) => column);

  GeneratedColumn<String> get background => $composableBuilder(
    column: $table.background,
    builder: (column) => column,
  );

  GeneratedColumn<String> get creationData => $composableBuilder(
    column: $table.creationData,
    builder: (column) => column,
  );

  GeneratedColumn<String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CharactersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharactersTable,
          Character,
          $$CharactersTableFilterComposer,
          $$CharactersTableOrderingComposer,
          $$CharactersTableAnnotationComposer,
          $$CharactersTableCreateCompanionBuilder,
          $$CharactersTableUpdateCompanionBuilder,
          (
            Character,
            BaseReferences<_$AppDatabase, $CharactersTable, Character>,
          ),
          Character,
          PrefetchHooks Function()
        > {
  $$CharactersTableTableManager(_$AppDatabase db, $CharactersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharactersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharactersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> concept = const Value.absent(),
                Value<String> metatype = const Value.absent(),
                Value<String> attributes = const Value.absent(),
                Value<String> skills = const Value.absent(),
                Value<String> qualities = const Value.absent(),
                Value<String?> magicPath = const Value.absent(),
                Value<String> equipment = const Value.absent(),
                Value<String> finances = const Value.absent(),
                Value<String> background = const Value.absent(),
                Value<String> creationData = const Value.absent(),
                Value<String> metadata = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CharactersCompanion(
                id: id,
                name: name,
                concept: concept,
                metatype: metatype,
                attributes: attributes,
                skills: skills,
                qualities: qualities,
                magicPath: magicPath,
                equipment: equipment,
                finances: finances,
                background: background,
                creationData: creationData,
                metadata: metadata,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> concept = const Value.absent(),
                required String metatype,
                required String attributes,
                required String skills,
                required String qualities,
                Value<String?> magicPath = const Value.absent(),
                required String equipment,
                required String finances,
                required String background,
                required String creationData,
                required String metadata,
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => CharactersCompanion.insert(
                id: id,
                name: name,
                concept: concept,
                metatype: metatype,
                attributes: attributes,
                skills: skills,
                qualities: qualities,
                magicPath: magicPath,
                equipment: equipment,
                finances: finances,
                background: background,
                creationData: creationData,
                metadata: metadata,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharactersTable,
      Character,
      $$CharactersTableFilterComposer,
      $$CharactersTableOrderingComposer,
      $$CharactersTableAnnotationComposer,
      $$CharactersTableCreateCompanionBuilder,
      $$CharactersTableUpdateCompanionBuilder,
      (Character, BaseReferences<_$AppDatabase, $CharactersTable, Character>),
      Character,
      PrefetchHooks Function()
    >;
typedef $$RulebooksTableCreateCompanionBuilder =
    RulebooksCompanion Function({
      Value<int> id,
      required String name,
      required String version,
      required String language,
      Value<String?> filePath,
      required DateTime importedAt,
      required String checksum,
      required int schemaVersion,
    });
typedef $$RulebooksTableUpdateCompanionBuilder =
    RulebooksCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> version,
      Value<String> language,
      Value<String?> filePath,
      Value<DateTime> importedAt,
      Value<String> checksum,
      Value<int> schemaVersion,
    });

final class $$RulebooksTableReferences
    extends BaseReferences<_$AppDatabase, $RulebooksTable, Rulebook> {
  $$RulebooksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RulesTable, List<Rule>> _rulesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.rules,
    aliasName: 'rulebooks__id__rules__rulebook_id',
  );

  $$RulesTableProcessedTableManager get rulesRefs {
    final manager = $$RulesTableTableManager(
      $_db,
      $_db.rules,
    ).filter((f) => f.rulebookId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_rulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EquipmentTable, List<EquipmentData>>
  _equipmentRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.equipment,
    aliasName: 'rulebooks__id__equipment__rulebook_id',
  );

  $$EquipmentTableProcessedTableManager get equipmentRefs {
    final manager = $$EquipmentTableTableManager(
      $_db,
      $_db.equipment,
    ).filter((f) => f.rulebookId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_equipmentRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RulebooksTableFilterComposer
    extends Composer<_$AppDatabase, $RulebooksTable> {
  $$RulebooksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get importedAt => $composableBuilder(
    column: $table.importedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checksum => $composableBuilder(
    column: $table.checksum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> rulesRefs(
    Expression<bool> Function($$RulesTableFilterComposer f) f,
  ) {
    final $$RulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rules,
      getReferencedColumn: (t) => t.rulebookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RulesTableFilterComposer(
            $db: $db,
            $table: $db.rules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> equipmentRefs(
    Expression<bool> Function($$EquipmentTableFilterComposer f) f,
  ) {
    final $$EquipmentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.equipment,
      getReferencedColumn: (t) => t.rulebookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EquipmentTableFilterComposer(
            $db: $db,
            $table: $db.equipment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RulebooksTableOrderingComposer
    extends Composer<_$AppDatabase, $RulebooksTable> {
  $$RulebooksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get importedAt => $composableBuilder(
    column: $table.importedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checksum => $composableBuilder(
    column: $table.checksum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RulebooksTableAnnotationComposer
    extends Composer<_$AppDatabase, $RulebooksTable> {
  $$RulebooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<DateTime> get importedAt => $composableBuilder(
    column: $table.importedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get checksum =>
      $composableBuilder(column: $table.checksum, builder: (column) => column);

  GeneratedColumn<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => column,
  );

  Expression<T> rulesRefs<T extends Object>(
    Expression<T> Function($$RulesTableAnnotationComposer a) f,
  ) {
    final $$RulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rules,
      getReferencedColumn: (t) => t.rulebookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RulesTableAnnotationComposer(
            $db: $db,
            $table: $db.rules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> equipmentRefs<T extends Object>(
    Expression<T> Function($$EquipmentTableAnnotationComposer a) f,
  ) {
    final $$EquipmentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.equipment,
      getReferencedColumn: (t) => t.rulebookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EquipmentTableAnnotationComposer(
            $db: $db,
            $table: $db.equipment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RulebooksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RulebooksTable,
          Rulebook,
          $$RulebooksTableFilterComposer,
          $$RulebooksTableOrderingComposer,
          $$RulebooksTableAnnotationComposer,
          $$RulebooksTableCreateCompanionBuilder,
          $$RulebooksTableUpdateCompanionBuilder,
          (Rulebook, $$RulebooksTableReferences),
          Rulebook,
          PrefetchHooks Function({bool rulesRefs, bool equipmentRefs})
        > {
  $$RulebooksTableTableManager(_$AppDatabase db, $RulebooksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RulebooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RulebooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RulebooksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> version = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String?> filePath = const Value.absent(),
                Value<DateTime> importedAt = const Value.absent(),
                Value<String> checksum = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
              }) => RulebooksCompanion(
                id: id,
                name: name,
                version: version,
                language: language,
                filePath: filePath,
                importedAt: importedAt,
                checksum: checksum,
                schemaVersion: schemaVersion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String version,
                required String language,
                Value<String?> filePath = const Value.absent(),
                required DateTime importedAt,
                required String checksum,
                required int schemaVersion,
              }) => RulebooksCompanion.insert(
                id: id,
                name: name,
                version: version,
                language: language,
                filePath: filePath,
                importedAt: importedAt,
                checksum: checksum,
                schemaVersion: schemaVersion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RulebooksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({rulesRefs = false, equipmentRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (rulesRefs) db.rules,
                if (equipmentRefs) db.equipment,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (rulesRefs)
                    await $_getPrefetchedData<Rulebook, $RulebooksTable, Rule>(
                      currentTable: table,
                      referencedTable: $$RulebooksTableReferences
                          ._rulesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$RulebooksTableReferences(db, table, p0).rulesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.rulebookId == item.id),
                      typedResults: items,
                    ),
                  if (equipmentRefs)
                    await $_getPrefetchedData<
                      Rulebook,
                      $RulebooksTable,
                      EquipmentData
                    >(
                      currentTable: table,
                      referencedTable: $$RulebooksTableReferences
                          ._equipmentRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$RulebooksTableReferences(
                            db,
                            table,
                            p0,
                          ).equipmentRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.rulebookId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RulebooksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RulebooksTable,
      Rulebook,
      $$RulebooksTableFilterComposer,
      $$RulebooksTableOrderingComposer,
      $$RulebooksTableAnnotationComposer,
      $$RulebooksTableCreateCompanionBuilder,
      $$RulebooksTableUpdateCompanionBuilder,
      (Rulebook, $$RulebooksTableReferences),
      Rulebook,
      PrefetchHooks Function({bool rulesRefs, bool equipmentRefs})
    >;
typedef $$RulesTableCreateCompanionBuilder =
    RulesCompanion Function({
      Value<int> id,
      required int rulebookId,
      required String ruleType,
      required String ruleKey,
      required String dataJson,
      Value<String?> dependenciesJson,
      Value<int> priority,
    });
typedef $$RulesTableUpdateCompanionBuilder =
    RulesCompanion Function({
      Value<int> id,
      Value<int> rulebookId,
      Value<String> ruleType,
      Value<String> ruleKey,
      Value<String> dataJson,
      Value<String?> dependenciesJson,
      Value<int> priority,
    });

final class $$RulesTableReferences
    extends BaseReferences<_$AppDatabase, $RulesTable, Rule> {
  $$RulesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RulebooksTable _rulebookIdTable(_$AppDatabase db) =>
      db.rulebooks.createAlias('rules__rulebook_id__rulebooks__id');

  $$RulebooksTableProcessedTableManager get rulebookId {
    final $_column = $_itemColumn<int>('rulebook_id')!;

    final manager = $$RulebooksTableTableManager(
      $_db,
      $_db.rulebooks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_rulebookIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RulesTableFilterComposer extends Composer<_$AppDatabase, $RulesTable> {
  $$RulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ruleType => $composableBuilder(
    column: $table.ruleType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ruleKey => $composableBuilder(
    column: $table.ruleKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dataJson => $composableBuilder(
    column: $table.dataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dependenciesJson => $composableBuilder(
    column: $table.dependenciesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  $$RulebooksTableFilterComposer get rulebookId {
    final $$RulebooksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rulebookId,
      referencedTable: $db.rulebooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RulebooksTableFilterComposer(
            $db: $db,
            $table: $db.rulebooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RulesTableOrderingComposer
    extends Composer<_$AppDatabase, $RulesTable> {
  $$RulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ruleType => $composableBuilder(
    column: $table.ruleType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ruleKey => $composableBuilder(
    column: $table.ruleKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataJson => $composableBuilder(
    column: $table.dataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dependenciesJson => $composableBuilder(
    column: $table.dependenciesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  $$RulebooksTableOrderingComposer get rulebookId {
    final $$RulebooksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rulebookId,
      referencedTable: $db.rulebooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RulebooksTableOrderingComposer(
            $db: $db,
            $table: $db.rulebooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RulesTable> {
  $$RulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ruleType =>
      $composableBuilder(column: $table.ruleType, builder: (column) => column);

  GeneratedColumn<String> get ruleKey =>
      $composableBuilder(column: $table.ruleKey, builder: (column) => column);

  GeneratedColumn<String> get dataJson =>
      $composableBuilder(column: $table.dataJson, builder: (column) => column);

  GeneratedColumn<String> get dependenciesJson => $composableBuilder(
    column: $table.dependenciesJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  $$RulebooksTableAnnotationComposer get rulebookId {
    final $$RulebooksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rulebookId,
      referencedTable: $db.rulebooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RulebooksTableAnnotationComposer(
            $db: $db,
            $table: $db.rulebooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RulesTable,
          Rule,
          $$RulesTableFilterComposer,
          $$RulesTableOrderingComposer,
          $$RulesTableAnnotationComposer,
          $$RulesTableCreateCompanionBuilder,
          $$RulesTableUpdateCompanionBuilder,
          (Rule, $$RulesTableReferences),
          Rule,
          PrefetchHooks Function({bool rulebookId})
        > {
  $$RulesTableTableManager(_$AppDatabase db, $RulesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> rulebookId = const Value.absent(),
                Value<String> ruleType = const Value.absent(),
                Value<String> ruleKey = const Value.absent(),
                Value<String> dataJson = const Value.absent(),
                Value<String?> dependenciesJson = const Value.absent(),
                Value<int> priority = const Value.absent(),
              }) => RulesCompanion(
                id: id,
                rulebookId: rulebookId,
                ruleType: ruleType,
                ruleKey: ruleKey,
                dataJson: dataJson,
                dependenciesJson: dependenciesJson,
                priority: priority,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int rulebookId,
                required String ruleType,
                required String ruleKey,
                required String dataJson,
                Value<String?> dependenciesJson = const Value.absent(),
                Value<int> priority = const Value.absent(),
              }) => RulesCompanion.insert(
                id: id,
                rulebookId: rulebookId,
                ruleType: ruleType,
                ruleKey: ruleKey,
                dataJson: dataJson,
                dependenciesJson: dependenciesJson,
                priority: priority,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$RulesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({rulebookId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (rulebookId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.rulebookId,
                                referencedTable: $$RulesTableReferences
                                    ._rulebookIdTable(db),
                                referencedColumn: $$RulesTableReferences
                                    ._rulebookIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RulesTable,
      Rule,
      $$RulesTableFilterComposer,
      $$RulesTableOrderingComposer,
      $$RulesTableAnnotationComposer,
      $$RulesTableCreateCompanionBuilder,
      $$RulesTableUpdateCompanionBuilder,
      (Rule, $$RulesTableReferences),
      Rule,
      PrefetchHooks Function({bool rulebookId})
    >;
typedef $$EquipmentTableCreateCompanionBuilder =
    EquipmentCompanion Function({
      Value<int> id,
      required int rulebookId,
      required String equipmentId,
      required String name,
      required String equipmentType,
      required String dataJson,
      required int availability,
      required String legality,
    });
typedef $$EquipmentTableUpdateCompanionBuilder =
    EquipmentCompanion Function({
      Value<int> id,
      Value<int> rulebookId,
      Value<String> equipmentId,
      Value<String> name,
      Value<String> equipmentType,
      Value<String> dataJson,
      Value<int> availability,
      Value<String> legality,
    });

final class $$EquipmentTableReferences
    extends BaseReferences<_$AppDatabase, $EquipmentTable, EquipmentData> {
  $$EquipmentTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RulebooksTable _rulebookIdTable(_$AppDatabase db) =>
      db.rulebooks.createAlias('equipment__rulebook_id__rulebooks__id');

  $$RulebooksTableProcessedTableManager get rulebookId {
    final $_column = $_itemColumn<int>('rulebook_id')!;

    final manager = $$RulebooksTableTableManager(
      $_db,
      $_db.rulebooks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_rulebookIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EquipmentTableFilterComposer
    extends Composer<_$AppDatabase, $EquipmentTable> {
  $$EquipmentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get equipmentId => $composableBuilder(
    column: $table.equipmentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get equipmentType => $composableBuilder(
    column: $table.equipmentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dataJson => $composableBuilder(
    column: $table.dataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get availability => $composableBuilder(
    column: $table.availability,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get legality => $composableBuilder(
    column: $table.legality,
    builder: (column) => ColumnFilters(column),
  );

  $$RulebooksTableFilterComposer get rulebookId {
    final $$RulebooksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rulebookId,
      referencedTable: $db.rulebooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RulebooksTableFilterComposer(
            $db: $db,
            $table: $db.rulebooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EquipmentTableOrderingComposer
    extends Composer<_$AppDatabase, $EquipmentTable> {
  $$EquipmentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get equipmentId => $composableBuilder(
    column: $table.equipmentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get equipmentType => $composableBuilder(
    column: $table.equipmentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataJson => $composableBuilder(
    column: $table.dataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get availability => $composableBuilder(
    column: $table.availability,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get legality => $composableBuilder(
    column: $table.legality,
    builder: (column) => ColumnOrderings(column),
  );

  $$RulebooksTableOrderingComposer get rulebookId {
    final $$RulebooksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rulebookId,
      referencedTable: $db.rulebooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RulebooksTableOrderingComposer(
            $db: $db,
            $table: $db.rulebooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EquipmentTableAnnotationComposer
    extends Composer<_$AppDatabase, $EquipmentTable> {
  $$EquipmentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get equipmentId => $composableBuilder(
    column: $table.equipmentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get equipmentType => $composableBuilder(
    column: $table.equipmentType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dataJson =>
      $composableBuilder(column: $table.dataJson, builder: (column) => column);

  GeneratedColumn<int> get availability => $composableBuilder(
    column: $table.availability,
    builder: (column) => column,
  );

  GeneratedColumn<String> get legality =>
      $composableBuilder(column: $table.legality, builder: (column) => column);

  $$RulebooksTableAnnotationComposer get rulebookId {
    final $$RulebooksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rulebookId,
      referencedTable: $db.rulebooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RulebooksTableAnnotationComposer(
            $db: $db,
            $table: $db.rulebooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EquipmentTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EquipmentTable,
          EquipmentData,
          $$EquipmentTableFilterComposer,
          $$EquipmentTableOrderingComposer,
          $$EquipmentTableAnnotationComposer,
          $$EquipmentTableCreateCompanionBuilder,
          $$EquipmentTableUpdateCompanionBuilder,
          (EquipmentData, $$EquipmentTableReferences),
          EquipmentData,
          PrefetchHooks Function({bool rulebookId})
        > {
  $$EquipmentTableTableManager(_$AppDatabase db, $EquipmentTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EquipmentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EquipmentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EquipmentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> rulebookId = const Value.absent(),
                Value<String> equipmentId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> equipmentType = const Value.absent(),
                Value<String> dataJson = const Value.absent(),
                Value<int> availability = const Value.absent(),
                Value<String> legality = const Value.absent(),
              }) => EquipmentCompanion(
                id: id,
                rulebookId: rulebookId,
                equipmentId: equipmentId,
                name: name,
                equipmentType: equipmentType,
                dataJson: dataJson,
                availability: availability,
                legality: legality,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int rulebookId,
                required String equipmentId,
                required String name,
                required String equipmentType,
                required String dataJson,
                required int availability,
                required String legality,
              }) => EquipmentCompanion.insert(
                id: id,
                rulebookId: rulebookId,
                equipmentId: equipmentId,
                name: name,
                equipmentType: equipmentType,
                dataJson: dataJson,
                availability: availability,
                legality: legality,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EquipmentTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({rulebookId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (rulebookId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.rulebookId,
                                referencedTable: $$EquipmentTableReferences
                                    ._rulebookIdTable(db),
                                referencedColumn: $$EquipmentTableReferences
                                    ._rulebookIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EquipmentTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EquipmentTable,
      EquipmentData,
      $$EquipmentTableFilterComposer,
      $$EquipmentTableOrderingComposer,
      $$EquipmentTableAnnotationComposer,
      $$EquipmentTableCreateCompanionBuilder,
      $$EquipmentTableUpdateCompanionBuilder,
      (EquipmentData, $$EquipmentTableReferences),
      EquipmentData,
      PrefetchHooks Function({bool rulebookId})
    >;
typedef $$NpcsTableCreateCompanionBuilder =
    NpcsCompanion Function({
      Value<int> id,
      required String npcId,
      required String name,
      required String metatype,
      required String role,
      required String attributes,
      required String skills,
      required String gear,
      required String notes,
      Value<bool> isHostile,
    });
typedef $$NpcsTableUpdateCompanionBuilder =
    NpcsCompanion Function({
      Value<int> id,
      Value<String> npcId,
      Value<String> name,
      Value<String> metatype,
      Value<String> role,
      Value<String> attributes,
      Value<String> skills,
      Value<String> gear,
      Value<String> notes,
      Value<bool> isHostile,
    });

class $$NpcsTableFilterComposer extends Composer<_$AppDatabase, $NpcsTable> {
  $$NpcsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get npcId => $composableBuilder(
    column: $table.npcId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metatype => $composableBuilder(
    column: $table.metatype,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attributes => $composableBuilder(
    column: $table.attributes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get skills => $composableBuilder(
    column: $table.skills,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gear => $composableBuilder(
    column: $table.gear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isHostile => $composableBuilder(
    column: $table.isHostile,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NpcsTableOrderingComposer extends Composer<_$AppDatabase, $NpcsTable> {
  $$NpcsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get npcId => $composableBuilder(
    column: $table.npcId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metatype => $composableBuilder(
    column: $table.metatype,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attributes => $composableBuilder(
    column: $table.attributes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get skills => $composableBuilder(
    column: $table.skills,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gear => $composableBuilder(
    column: $table.gear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isHostile => $composableBuilder(
    column: $table.isHostile,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NpcsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NpcsTable> {
  $$NpcsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get npcId =>
      $composableBuilder(column: $table.npcId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get metatype =>
      $composableBuilder(column: $table.metatype, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get attributes => $composableBuilder(
    column: $table.attributes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get skills =>
      $composableBuilder(column: $table.skills, builder: (column) => column);

  GeneratedColumn<String> get gear =>
      $composableBuilder(column: $table.gear, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isHostile =>
      $composableBuilder(column: $table.isHostile, builder: (column) => column);
}

class $$NpcsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NpcsTable,
          Npc,
          $$NpcsTableFilterComposer,
          $$NpcsTableOrderingComposer,
          $$NpcsTableAnnotationComposer,
          $$NpcsTableCreateCompanionBuilder,
          $$NpcsTableUpdateCompanionBuilder,
          (Npc, BaseReferences<_$AppDatabase, $NpcsTable, Npc>),
          Npc,
          PrefetchHooks Function()
        > {
  $$NpcsTableTableManager(_$AppDatabase db, $NpcsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NpcsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NpcsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NpcsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> npcId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> metatype = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> attributes = const Value.absent(),
                Value<String> skills = const Value.absent(),
                Value<String> gear = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<bool> isHostile = const Value.absent(),
              }) => NpcsCompanion(
                id: id,
                npcId: npcId,
                name: name,
                metatype: metatype,
                role: role,
                attributes: attributes,
                skills: skills,
                gear: gear,
                notes: notes,
                isHostile: isHostile,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String npcId,
                required String name,
                required String metatype,
                required String role,
                required String attributes,
                required String skills,
                required String gear,
                required String notes,
                Value<bool> isHostile = const Value.absent(),
              }) => NpcsCompanion.insert(
                id: id,
                npcId: npcId,
                name: name,
                metatype: metatype,
                role: role,
                attributes: attributes,
                skills: skills,
                gear: gear,
                notes: notes,
                isHostile: isHostile,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NpcsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NpcsTable,
      Npc,
      $$NpcsTableFilterComposer,
      $$NpcsTableOrderingComposer,
      $$NpcsTableAnnotationComposer,
      $$NpcsTableCreateCompanionBuilder,
      $$NpcsTableUpdateCompanionBuilder,
      (Npc, BaseReferences<_$AppDatabase, $NpcsTable, Npc>),
      Npc,
      PrefetchHooks Function()
    >;
typedef $$HostsTableCreateCompanionBuilder =
    HostsCompanion Function({
      Value<int> id,
      required String hostId,
      required String name,
      required String hostType,
      required int security,
      required String systems,
      required String ice,
      required String access,
      required String notes,
    });
typedef $$HostsTableUpdateCompanionBuilder =
    HostsCompanion Function({
      Value<int> id,
      Value<String> hostId,
      Value<String> name,
      Value<String> hostType,
      Value<int> security,
      Value<String> systems,
      Value<String> ice,
      Value<String> access,
      Value<String> notes,
    });

class $$HostsTableFilterComposer extends Composer<_$AppDatabase, $HostsTable> {
  $$HostsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hostId => $composableBuilder(
    column: $table.hostId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hostType => $composableBuilder(
    column: $table.hostType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get security => $composableBuilder(
    column: $table.security,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get systems => $composableBuilder(
    column: $table.systems,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ice => $composableBuilder(
    column: $table.ice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get access => $composableBuilder(
    column: $table.access,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HostsTableOrderingComposer
    extends Composer<_$AppDatabase, $HostsTable> {
  $$HostsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hostId => $composableBuilder(
    column: $table.hostId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hostType => $composableBuilder(
    column: $table.hostType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get security => $composableBuilder(
    column: $table.security,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get systems => $composableBuilder(
    column: $table.systems,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ice => $composableBuilder(
    column: $table.ice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get access => $composableBuilder(
    column: $table.access,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HostsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HostsTable> {
  $$HostsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get hostId =>
      $composableBuilder(column: $table.hostId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get hostType =>
      $composableBuilder(column: $table.hostType, builder: (column) => column);

  GeneratedColumn<int> get security =>
      $composableBuilder(column: $table.security, builder: (column) => column);

  GeneratedColumn<String> get systems =>
      $composableBuilder(column: $table.systems, builder: (column) => column);

  GeneratedColumn<String> get ice =>
      $composableBuilder(column: $table.ice, builder: (column) => column);

  GeneratedColumn<String> get access =>
      $composableBuilder(column: $table.access, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$HostsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HostsTable,
          Host,
          $$HostsTableFilterComposer,
          $$HostsTableOrderingComposer,
          $$HostsTableAnnotationComposer,
          $$HostsTableCreateCompanionBuilder,
          $$HostsTableUpdateCompanionBuilder,
          (Host, BaseReferences<_$AppDatabase, $HostsTable, Host>),
          Host,
          PrefetchHooks Function()
        > {
  $$HostsTableTableManager(_$AppDatabase db, $HostsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HostsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HostsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HostsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> hostId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> hostType = const Value.absent(),
                Value<int> security = const Value.absent(),
                Value<String> systems = const Value.absent(),
                Value<String> ice = const Value.absent(),
                Value<String> access = const Value.absent(),
                Value<String> notes = const Value.absent(),
              }) => HostsCompanion(
                id: id,
                hostId: hostId,
                name: name,
                hostType: hostType,
                security: security,
                systems: systems,
                ice: ice,
                access: access,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String hostId,
                required String name,
                required String hostType,
                required int security,
                required String systems,
                required String ice,
                required String access,
                required String notes,
              }) => HostsCompanion.insert(
                id: id,
                hostId: hostId,
                name: name,
                hostType: hostType,
                security: security,
                systems: systems,
                ice: ice,
                access: access,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HostsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HostsTable,
      Host,
      $$HostsTableFilterComposer,
      $$HostsTableOrderingComposer,
      $$HostsTableAnnotationComposer,
      $$HostsTableCreateCompanionBuilder,
      $$HostsTableUpdateCompanionBuilder,
      (Host, BaseReferences<_$AppDatabase, $HostsTable, Host>),
      Host,
      PrefetchHooks Function()
    >;
typedef $$LocationsTableCreateCompanionBuilder =
    LocationsCompanion Function({
      Value<int> id,
      required String locationId,
      required String name,
      required String locationType,
      required String description,
      required String connections,
      required String npcs,
      required String security,
    });
typedef $$LocationsTableUpdateCompanionBuilder =
    LocationsCompanion Function({
      Value<int> id,
      Value<String> locationId,
      Value<String> name,
      Value<String> locationType,
      Value<String> description,
      Value<String> connections,
      Value<String> npcs,
      Value<String> security,
    });

class $$LocationsTableFilterComposer
    extends Composer<_$AppDatabase, $LocationsTable> {
  $$LocationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationId => $composableBuilder(
    column: $table.locationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationType => $composableBuilder(
    column: $table.locationType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get connections => $composableBuilder(
    column: $table.connections,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get npcs => $composableBuilder(
    column: $table.npcs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get security => $composableBuilder(
    column: $table.security,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocationsTable> {
  $$LocationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationId => $composableBuilder(
    column: $table.locationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationType => $composableBuilder(
    column: $table.locationType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get connections => $composableBuilder(
    column: $table.connections,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get npcs => $composableBuilder(
    column: $table.npcs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get security => $composableBuilder(
    column: $table.security,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocationsTable> {
  $$LocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get locationId => $composableBuilder(
    column: $table.locationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get locationType => $composableBuilder(
    column: $table.locationType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get connections => $composableBuilder(
    column: $table.connections,
    builder: (column) => column,
  );

  GeneratedColumn<String> get npcs =>
      $composableBuilder(column: $table.npcs, builder: (column) => column);

  GeneratedColumn<String> get security =>
      $composableBuilder(column: $table.security, builder: (column) => column);
}

class $$LocationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocationsTable,
          Location,
          $$LocationsTableFilterComposer,
          $$LocationsTableOrderingComposer,
          $$LocationsTableAnnotationComposer,
          $$LocationsTableCreateCompanionBuilder,
          $$LocationsTableUpdateCompanionBuilder,
          (Location, BaseReferences<_$AppDatabase, $LocationsTable, Location>),
          Location,
          PrefetchHooks Function()
        > {
  $$LocationsTableTableManager(_$AppDatabase db, $LocationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> locationId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> locationType = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> connections = const Value.absent(),
                Value<String> npcs = const Value.absent(),
                Value<String> security = const Value.absent(),
              }) => LocationsCompanion(
                id: id,
                locationId: locationId,
                name: name,
                locationType: locationType,
                description: description,
                connections: connections,
                npcs: npcs,
                security: security,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String locationId,
                required String name,
                required String locationType,
                required String description,
                required String connections,
                required String npcs,
                required String security,
              }) => LocationsCompanion.insert(
                id: id,
                locationId: locationId,
                name: name,
                locationType: locationType,
                description: description,
                connections: connections,
                npcs: npcs,
                security: security,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocationsTable,
      Location,
      $$LocationsTableFilterComposer,
      $$LocationsTableOrderingComposer,
      $$LocationsTableAnnotationComposer,
      $$LocationsTableCreateCompanionBuilder,
      $$LocationsTableUpdateCompanionBuilder,
      (Location, BaseReferences<_$AppDatabase, $LocationsTable, Location>),
      Location,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db, _db.characters);
  $$RulebooksTableTableManager get rulebooks =>
      $$RulebooksTableTableManager(_db, _db.rulebooks);
  $$RulesTableTableManager get rules =>
      $$RulesTableTableManager(_db, _db.rules);
  $$EquipmentTableTableManager get equipment =>
      $$EquipmentTableTableManager(_db, _db.equipment);
  $$NpcsTableTableManager get npcs => $$NpcsTableTableManager(_db, _db.npcs);
  $$HostsTableTableManager get hosts =>
      $$HostsTableTableManager(_db, _db.hosts);
  $$LocationsTableTableManager get locations =>
      $$LocationsTableTableManager(_db, _db.locations);
}
