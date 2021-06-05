import 'dart:convert';

import 'package:flutter_pokedex/data/data_providers/api/api_error.dart';
import 'package:flutter_pokedex/data/models/paginated_pokemon_list.dart';
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

  Future<Pokemon> getPokemonByName(String name) async {
    http.Response response =
        await _httpClient.get(Uri.parse("$_baseUrl/pokemon/$name"));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw ApiError(code: response.statusCode, message: response.body);
    }
  }

  Future<PaginatedPokemonList> getPokemonList(int limit, int offset) async {
    http.Response response = await _httpClient
        .get(Uri.parse("$_baseUrl/pokemon?limit=$limit&offset=$offset"));

    if (response.statusCode == 200) {
      return PaginatedPokemonList.fromJson(jsonDecode(response.body));
    } else {
      throw ApiError(code: response.statusCode, message: response.body);
    }
  }

  Future<PaginatedPokemonList> getPokemonListPage(String url) async {
    http.Response response = await _httpClient.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return PaginatedPokemonList.fromJson(jsonDecode(response.body));
    } else {
      throw ApiError(code: response.statusCode, message: response.body);
    }
  }
}
