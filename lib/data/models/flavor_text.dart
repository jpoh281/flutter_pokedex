import 'package:flutter_pokedex/data/models/name_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flavor_text.g.dart';

@JsonSerializable()
class FlavorText {
  final String flavorText;
  final NameWrapper language;

  FlavorText({required this.flavorText, required this.language});

  factory FlavorText.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorTextToJson(this);
}
