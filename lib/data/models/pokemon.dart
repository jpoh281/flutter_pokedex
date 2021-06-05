import 'package:flutter_pokedex/data/models/pokemon_ability.dart';
import 'package:flutter_pokedex/data/models/pokemon_sprites.dart';
import 'package:flutter_pokedex/data/models/pokemon_stat.dart';
import 'package:flutter_pokedex/data/models/pokemon_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  final List<PokemonAbility> abilities;
  final int baseExperience;
  final int height;
  final int id;
  final String locationAreaEncounters;
  final String name;
  final PokemonSprites sprites;
  final List<PokemonStat> stats;
  final List<PokemonType> types;
  final int weight;

  Pokemon(
      {required this.abilities,
      required this.baseExperience,
      required this.height,
      required this.id,
      required this.locationAreaEncounters,
      required this.name,
      required this.sprites,
      required this.stats,
      required this.types,
      required this.weight});

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
