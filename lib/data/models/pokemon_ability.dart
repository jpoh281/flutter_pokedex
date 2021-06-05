import 'package:json_annotation/json_annotation.dart';

part 'pokemon_ability.g.dart';

@JsonSerializable()
class PokemonAbility {
  final _PokemonAbility ability;
  final bool isHidden;
  final int slot;

  PokemonAbility(
      {required this.ability, required this.isHidden, required this.slot});

  factory PokemonAbility.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonAbilityToJson(this);
}

@JsonSerializable()
class _PokemonAbility {
  final String name;
  final String url;

  _PokemonAbility({required this.name, required this.url});

  factory _PokemonAbility.fromJson(Map<String, dynamic> json) =>
      _$_PokemonAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$_PokemonAbilityToJson(this);
}
