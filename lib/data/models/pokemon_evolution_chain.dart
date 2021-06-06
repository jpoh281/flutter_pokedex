import 'package:flutter_pokedex/data/models/name_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_evolution_chain.g.dart';

@JsonSerializable()
class PokemonEvolutionChainWrapper {
  final PokemonEvolutionChain chain;

  PokemonEvolutionChainWrapper({required this.chain});

  factory PokemonEvolutionChainWrapper.fromJson(Map<String, dynamic> json) =>
      _$PokemonEvolutionChainWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonEvolutionChainWrapperToJson(this);
}

@JsonSerializable()
class PokemonEvolutionChain {
  final List<_EvolutionDetails> evolutionDetails;
  final List<PokemonEvolutionChain> evolvesTo;
  final NameWrapper species;

  PokemonEvolutionChain(
      {required this.evolutionDetails,
      required this.evolvesTo,
      required this.species});

  factory PokemonEvolutionChain.fromJson(Map<String, dynamic> json) =>
      _$PokemonEvolutionChainFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonEvolutionChainToJson(this);
}

@JsonSerializable()
class _EvolutionDetails {
  final int? minLevel;

  _EvolutionDetails({this.minLevel});

  factory _EvolutionDetails.fromJson(Map<String, dynamic> json) =>
      _$_EvolutionDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$_EvolutionDetailsToJson(this);
}
