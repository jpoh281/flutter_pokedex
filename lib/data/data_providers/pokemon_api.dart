import 'dart:convert';

import 'package:flutter_pokedex/data/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonApi {
  final http.Client _httpClient;

  PokemonApi(this._httpClient);

  Future<Pokemon?> getPokemonById(int id) async {
    http.Response response = await _httpClient
        .get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$id"));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    }

    return null;
  }
}
