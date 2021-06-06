import 'dart:convert';

import 'package:flutter_pokedex/data/data_providers/api/api_error.dart';
import 'package:flutter_pokedex/data/models/pokemon_ability_detail.dart';
import 'package:http/http.dart' as http;

class PokemonAbilityApi {
  final http.Client _httpClient;

  PokemonAbilityApi(this._httpClient);

  Future<PokemonAbilityDetail> getPokemonAbilityPage(String url) async {
    http.Response response = await _httpClient.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return PokemonAbilityDetail.fromJson(jsonDecode(response.body));
    } else {
      throw ApiError(code: response.statusCode, message: response.body);
    }
  }
}
