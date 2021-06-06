import 'package:flutter_pokedex/data/data_providers/api/pokemon_species_api.dart';
import 'package:flutter_pokedex/data/models/pokemon_specie.dart';

class PokemonSpeciesRepository {
  final PokemonSpeciesApi _pokemonSpeciesApi;

  PokemonSpeciesRepository(this._pokemonSpeciesApi);

  Future<PokemonSpecie> getPokemonSpeciePage(String url) =>
      _pokemonSpeciesApi.getPokemonSpeciePage(url);
}
