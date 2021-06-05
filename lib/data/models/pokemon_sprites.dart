import 'package:json_annotation/json_annotation.dart';

part 'pokemon_sprites.g.dart';

@JsonSerializable()
class PokemonSprites {
  final String frontDefault;
  final _PokemonOtherSprites other;

  PokemonSprites({required this.frontDefault, required this.other});

  factory PokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpritesToJson(this);
}

@JsonSerializable()
class _PokemonOtherSprites {
  final _PokemonDreamWorldSprite dreamWorld;

  _PokemonOtherSprites({required this.dreamWorld});

  factory _PokemonOtherSprites.fromJson(Map<String, dynamic> json) =>
      _$_PokemonOtherSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$_PokemonOtherSpritesToJson(this);
}

@JsonSerializable()
class _PokemonDreamWorldSprite {
  final String frontDefault;

  _PokemonDreamWorldSprite({required this.frontDefault});

  factory _PokemonDreamWorldSprite.fromJson(Map<String, dynamic> json) =>
      _$_PokemonDreamWorldSpriteFromJson(json);

  Map<String, dynamic> toJson() => _$_PokemonDreamWorldSpriteToJson(this);
}
