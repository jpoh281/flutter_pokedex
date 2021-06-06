import 'package:flutter_pokedex/data/data_providers/api/pokemon_ability_api.dart';
import 'package:flutter_pokedex/data/data_providers/api/pokemon_api.dart';
import 'package:flutter_pokedex/data/data_providers/api/pokemon_evolution_chain_api.dart';
import 'package:flutter_pokedex/data/data_providers/api/pokemon_species_api.dart';
import 'package:flutter_pokedex/data/repositories/pokemon_ability_repository.dart';
import 'package:flutter_pokedex/data/repositories/pokemon_evolution_chain_repository.dart';
import 'package:flutter_pokedex/data/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/data/repositories/pokemon_species_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

void setupLocator() {
  final String _baseUrl = "https://pokeapi.co/api/v2";

  GetIt.I.registerSingleton<http.Client>(http.Client());

  GetIt.I.registerSingleton<PokemonApi>(
      PokemonApi(GetIt.I<http.Client>(), _baseUrl));
  GetIt.I.registerSingleton<PokemonRepository>(
      PokemonRepository(GetIt.I<PokemonApi>()));

  GetIt.I.registerSingleton<PokemonSpeciesApi>(
      PokemonSpeciesApi(GetIt.I<http.Client>()));
  GetIt.I.registerSingleton<PokemonSpeciesRepository>(
      PokemonSpeciesRepository(GetIt.I<PokemonSpeciesApi>()));

  GetIt.I.registerSingleton<PokemonEvolutionChainApi>(
      PokemonEvolutionChainApi(GetIt.I<http.Client>()));
  GetIt.I.registerSingleton<PokemonEvolutionChainRepository>(
      PokemonEvolutionChainRepository(GetIt.I<PokemonEvolutionChainApi>()));

  GetIt.I.registerSingleton<PokemonAbilityApi>(
      PokemonAbilityApi(GetIt.I<http.Client>()));
  GetIt.I.registerSingleton<PokemonAbilityRepository>(
      PokemonAbilityRepository(GetIt.I<PokemonAbilityApi>()));
}
