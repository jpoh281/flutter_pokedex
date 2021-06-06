import 'package:flutter_pokedex/data/data_providers/api/pokemon_evolution_chain_api.dart';
import 'package:flutter_pokedex/data/models/pokemon_evolution_chain.dart';

class PokemonEvolutionChainRepository {
  final PokemonEvolutionChainApi _pokemonEvolutionChainApi;

  PokemonEvolutionChainRepository(this._pokemonEvolutionChainApi);

  Future<PokemonEvolutionChainWrapper> getPokemonEvolutionChainPage(
          String url) =>
      _pokemonEvolutionChainApi.getPokemonEvolutionChainPage(url);
}
