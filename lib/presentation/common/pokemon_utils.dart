import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/models/pokemon.dart';

class PokemonUtils {
  static Color mapTypeToColor(Pokemon pokemon) {
    Color _defaultColor = Colors.blueGrey.withOpacity(0.3);

    if (pokemon.types.length > 0) {
      switch (pokemon.types[0].type.name) {
        case "fire":
          return Color(0xfff7786b);
        case "water":
          return Color(0xff58aaf6);
        case "grass":
          return Color(0xff4fc1a6);
        case "electric":
          return Color(0xffffce4b);
        case "poison":
          return Color(0xff7c538c);
        case "ground":
          return Color(0xffb1736c);
        default:
          return _defaultColor;
      }
    }

    return _defaultColor;
  }
}
