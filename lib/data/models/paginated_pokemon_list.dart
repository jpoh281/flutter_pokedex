import 'package:json_annotation/json_annotation.dart';

part 'paginated_pokemon_list.g.dart';

@JsonSerializable()
class PaginatedPokemonList {
  final int count;
  final String? next;
  final String? previous;
  final List<_PokemonName> results;

  PaginatedPokemonList(
      {required this.count, this.next, this.previous, required this.results});

  factory PaginatedPokemonList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedPokemonListFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedPokemonListToJson(this);
}

@JsonSerializable()
class _PokemonName {
  final String name;

  _PokemonName({required this.name});

  factory _PokemonName.fromJson(Map<String, dynamic> json) =>
      _$_PokemonNameFromJson(json);

  Map<String, dynamic> toJson() => _$_PokemonNameToJson(this);
}
