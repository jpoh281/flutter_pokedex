import 'dart:convert';

import 'package:flutter_pokedex/data/data_providers/api/api_error.dart';
import 'package:flutter_pokedex/data/models/pokemon_evolution_chain.dart';
import 'package:http/http.dart' as http;

class PokemonEvolutionChainApi {
  final http.Client _httpClient;

  PokemonEvolutionChainApi(this._httpClient);

  Future<PokemonEvolutionChainWrapper> getPokemonEvolutionChainPage(
      String url) async {
    http.Response response = await _httpClient.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return PokemonEvolutionChainWrapper.fromJson(jsonDecode(response.body));
    } else {
      throw ApiError(code: response.statusCode, message: response.body);
    }
  }
}
