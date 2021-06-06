import 'package:flutter_pokedex/data/models/flavor_text.dart';
import 'package:flutter_pokedex/data/models/name_wrapper.dart';
import 'package:flutter_pokedex/data/models/url_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_specie.g.dart';

@JsonSerializable()
class PokemonSpecie {
  final UrlWrapper evolutionChain;
  final List<FlavorText> flavorTextEntries;
  final NameWrapper habitat;

  PokemonSpecie(
      {required this.evolutionChain,
      required this.flavorTextEntries,
      required this.habitat});

  factory PokemonSpecie.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpecieFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpecieToJson(this);
}
