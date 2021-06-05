import 'package:flutter_pokedex/data/data_providers/pokemon_api.dart';
import 'package:flutter_pokedex/data/models/pokemon.dart';

class PokemonRepository {
  final PokemonApi _pokemonApi;

  PokemonRepository(this._pokemonApi);

  Future<Pokemon> getPokemonById(int id) => _pokemonApi.getPokemonById(id);
}
