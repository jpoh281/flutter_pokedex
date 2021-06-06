import 'package:json_annotation/json_annotation.dart';

part 'pokemon_specie.g.dart';

@JsonSerializable()
class PokemonSpecie {
  final _EvolutionChain evolutionChain;
  final List<_FlavorText> flavorTextEntries;
  final _Habitat habitat;

  PokemonSpecie(
      {required this.evolutionChain,
      required this.flavorTextEntries,
      required this.habitat});

  factory PokemonSpecie.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpecieFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpecieToJson(this);
}

@JsonSerializable()
class _EvolutionChain {
  final String url;

  _EvolutionChain({required this.url});

  factory _EvolutionChain.fromJson(Map<String, dynamic> json) =>
      _$_EvolutionChainFromJson(json);

  Map<String, dynamic> toJson() => _$_EvolutionChainToJson(this);
}

@JsonSerializable()
class _FlavorText {
  final String flavorText;
  final _Language language;

  _FlavorText({required this.flavorText, required this.language});

  factory _FlavorText.fromJson(Map<String, dynamic> json) =>
      _$_FlavorTextFromJson(json);

  Map<String, dynamic> toJson() => _$_FlavorTextToJson(this);
}

@JsonSerializable()
class _Language {
  final String name;

  _Language({required this.name});

  factory _Language.fromJson(Map<String, dynamic> json) =>
      _$_LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$_LanguageToJson(this);
}

@JsonSerializable()
class _Habitat {
  final String name;

  _Habitat({required this.name});

  factory _Habitat.fromJson(Map<String, dynamic> json) =>
      _$_HabitatFromJson(json);

  Map<String, dynamic> toJson() => _$_HabitatToJson(this);
}
