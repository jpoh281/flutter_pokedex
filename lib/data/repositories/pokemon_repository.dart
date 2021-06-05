import 'package:flutter_pokedex/data/data_providers/api/pokemon_api.dart';
import 'package:flutter_pokedex/data/models/paginated_pokemon_list.dart';
import 'package:flutter_pokedex/data/models/pokemon.dart';

class PokemonRepository {
  final PokemonApi _pokemonApi;

  PokemonRepository(this._pokemonApi);

  Future<Pokemon> getPokemonById(int id) => _pokemonApi.getPokemonById(id);

  Future<Pokemon> getPokemonByName(String name) =>
      _pokemonApi.getPokemonByName(name);

  Future<PaginatedPokemonList> getPokemonList(int limit, int offset) =>
      _pokemonApi.getPokemonList(limit, offset);

  Future<PaginatedPokemonList> getPokemonListPage(String url) =>
      _pokemonApi.getPokemonListPage(url);
}
