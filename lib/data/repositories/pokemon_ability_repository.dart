import 'package:flutter_pokedex/data/data_providers/api/pokemon_ability_api.dart';
import 'package:flutter_pokedex/data/models/pokemon_ability_detail.dart';

class PokemonAbilityRepository {
  final PokemonAbilityApi _pokemonAbilitiesApi;

  PokemonAbilityRepository(this._pokemonAbilitiesApi);

  Future<PokemonAbilityDetail> getPokemonAbilityPage(String url) =>
      _pokemonAbilitiesApi.getPokemonAbilityPage(url);
}
