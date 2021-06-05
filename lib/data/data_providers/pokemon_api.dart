import 'dart:convert';

import 'package:flutter_pokedex/data/data_providers/api_error.dart';
import 'package:flutter_pokedex/data/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonApi {
  final String _baseUrl = "https://pokeapi.co/api/v2";
  final http.Client _httpClient;

  PokemonApi(this._httpClient);

  Future<Pokemon> getPokemonById(int id) async {
    http.Response response =
        await _httpClient.get(Uri.parse("$_baseUrl/pokemon/$id"));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw ApiError(code: response.statusCode, message: response.body);
    }
  }
}
