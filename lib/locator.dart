import 'package:flutter_pokedex/data/data_providers/pokemon_api.dart';
import 'package:flutter_pokedex/data/repositories/pokemon_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

void setupLocator() {
  GetIt.I.registerSingleton<http.Client>(http.Client());
  GetIt.I.registerSingleton<PokemonApi>(PokemonApi(GetIt.I<http.Client>()));
  GetIt.I.registerSingleton<PokemonRepository>(
      PokemonRepository(GetIt.I<PokemonApi>()));
}
