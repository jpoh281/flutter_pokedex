import 'package:flutter_pokedex/data/models/name_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginated_pokemon_list.g.dart';

@JsonSerializable()
class PaginatedPokemonList {
  final int count;
  final String? next;
  final String? previous;
  final List<NameWrapper> results;

  PaginatedPokemonList(
      {required this.count, this.next, this.previous, required this.results});

  factory PaginatedPokemonList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedPokemonListFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedPokemonListToJson(this);
}
