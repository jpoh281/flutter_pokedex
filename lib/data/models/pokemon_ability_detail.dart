import 'package:flutter_pokedex/data/models/flavor_text.dart';
import 'package:flutter_pokedex/data/models/name_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_ability_detail.g.dart';

@JsonSerializable()
class PokemonAbilityDetail {
  final List<_PokemonAbilityName> names;
  final List<FlavorText> flavorTextEntries;

  PokemonAbilityDetail({required this.names, required this.flavorTextEntries});

  factory PokemonAbilityDetail.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonAbilityDetailToJson(this);
}

@JsonSerializable()
class _PokemonAbilityName {
  final String name;
  final NameWrapper language;

  _PokemonAbilityName({required this.name, required this.language});

  factory _PokemonAbilityName.fromJson(Map<String, dynamic> json) =>
      _$_PokemonAbilityNameFromJson(json);

  Map<String, dynamic> toJson() => _$_PokemonAbilityNameToJson(this);
}
