import 'dart:convert';
import 'package:flutter/foundation.dart';

class PokemonModel {
  final String name;
  final List<Abilities> abilities;
  final int height;
  final int id;
  final List<Stats> stats;
  final List<Types> types;
  final int weight;

  PokemonModel({
    required this.name,
    required this.abilities,
    required this.height,
    required this.id,
    required this.stats,
    required this.types,
    required this.weight,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      abilities: List<Abilities>.from(
          json['abilities']?.map((x) => Abilities.fromMap(x))),
      height: json['height'],
      id: json['id'],
      stats: List<Stats>.from(json['stats']?.map((x) => Stats.fromMap(x))),
      types: List<Types>.from(json['types']?.map((x) => Types.fromMap(x))),
      weight: json['weight'],
    );
  }

  @override
  String toString() {
    return 'PokemonModel(name: $name, abilities: $abilities, height: $height, id: $id, stats: $stats, types: $types, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonModel &&
        other.name == name &&
        listEquals(other.abilities, abilities) &&
        other.height == height &&
        other.id == id &&
        listEquals(other.stats, stats) &&
        listEquals(other.types, types) &&
        other.weight == weight;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        abilities.hashCode ^
        height.hashCode ^
        id.hashCode ^
        stats.hashCode ^
        types.hashCode ^
        weight.hashCode;
  }

  PokemonModel copyWith({
    String? name,
    List<Abilities>? abilities,
    int? height,
    int? id,
    List<Stats>? stats,
    List<Types>? types,
    int? weight,
  }) {
    return PokemonModel(
      name: name ?? this.name,
      abilities: abilities ?? this.abilities,
      height: height ?? this.height,
      id: id ?? this.id,
      stats: stats ?? this.stats,
      types: types ?? this.types,
      weight: weight ?? this.weight,
    );
  }
}

class Abilities {
  final Ability ability;
  final bool isHidden;
  final int slot;

  Abilities({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  Map<String, dynamic> toMap() {
    return {
      'ability': ability.toMap(),
      'isHidden': isHidden,
      'slot': slot,
    };
  }

  factory Abilities.fromMap(Map<String, dynamic> map) {
    return Abilities(
      ability: Ability.fromMap(map['ability']),
      isHidden: map['isHidden'] ?? false,
      slot: map['slot']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Abilities.fromJson(String source) =>
      Abilities.fromMap(json.decode(source));
}

class Ability {
  final String name;
  final String url;
  Ability({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Ability.fromMap(Map<String, dynamic> map) {
    return Ability(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Ability.fromJson(String source) =>
      Ability.fromMap(json.decode(source));
}

class Stats {
  final int baseStat;
  final int effort;
  final Ability stat;

  Stats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  Map<String, dynamic> toMap() {
    return {
      'baseStat': baseStat,
      'effort': effort,
      'stat': stat.toMap(),
    };
  }

  factory Stats.fromMap(Map<String, dynamic> map) {
    return Stats(
      baseStat: map['base_stat']?.toInt() ?? 0,
      effort: map['effort']?.toInt() ?? 0,
      stat: Ability.fromMap(map['stat']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Stats.fromJson(String source) => Stats.fromMap(json.decode(source));
}

class Types {
  final int slot;
  final Ability type;
  Types({
    required this.slot,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'slot': slot,
      'type': type.toMap(),
    };
  }

  factory Types.fromMap(Map<String, dynamic> map) {
    return Types(
      slot: map['slot']?.toInt() ?? 0,
      type: Ability.fromMap(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Types.fromJson(String source) => Types.fromMap(json.decode(source));
}
