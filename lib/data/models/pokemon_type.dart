import 'package:json_annotation/json_annotation.dart';

part 'pokemon_type.g.dart';

@JsonSerializable()
class PokemonType {
  final int slot;
  final _PokemonType type;

  PokemonType({required this.slot, required this.type});

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}

@JsonSerializable()
class _PokemonType {
  final String name;
  final String url;

  _PokemonType({required this.name, required this.url});

  factory _PokemonType.fromJson(Map<String, dynamic> json) =>
      _$_PokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$_PokemonTypeToJson(this);
}
