import 'dart:convert';

import 'package:flutter_pokedex/data/data_providers/api/api_error.dart';
import 'package:flutter_pokedex/data/models/pokemon_specie.dart';
import 'package:http/http.dart' as http;

class PokemonSpeciesApi {
  final http.Client _httpClient;

  PokemonSpeciesApi(this._httpClient);

  Future<PokemonSpecie> getPokemonSpeciePage(String url) async {
    http.Response response = await _httpClient.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return PokemonSpecie.fromJson(jsonDecode(response.body));
    } else {
      throw ApiError(code: response.statusCode, message: response.body);
    }
  }
}
