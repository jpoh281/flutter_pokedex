import 'package:json_annotation/json_annotation.dart';

part 'pokemon_stat.g.dart';

@JsonSerializable()
class PokemonStat {
  final int baseStat;
  final int effort;
  final _PokemonStat stat;

  PokemonStat(
      {required this.baseStat, required this.effort, required this.stat});

  factory PokemonStat.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatToJson(this);
}

@JsonSerializable()
class _PokemonStat {
  final String name;
  final String url;

  _PokemonStat({required this.name, required this.url});

  factory _PokemonStat.fromJson(Map<String, dynamic> json) =>
      _$_PokemonStatFromJson(json);

  Map<String, dynamic> toJson() => _$_PokemonStatToJson(this);
}
