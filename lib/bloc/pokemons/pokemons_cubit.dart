import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/bloc/pokemons/pokemons_state.dart';
import 'package:flutter_pokedex/data/data_providers/common/data_provider_error.dart';
import 'package:flutter_pokedex/data/models/paginated_pokemon_list.dart';
import 'package:flutter_pokedex/data/repositories/pokemon_repository.dart';
import 'package:get_it/get_it.dart';

class PokemonsCubit extends Cubit<PokemonsState> {
  late PokemonRepository _pokemonRepository;

  PokemonsCubit() : super(PokemonsInitial()) {
    _pokemonRepository = GetIt.I<PokemonRepository>();
  }

  fetchPokemonList({int limit = 50, int offset = 0}) async {
    try {
      PaginatedPokemonList paginatedPokemonList =
          await _pokemonRepository.getPokemonList(limit, offset);

      emit(PokemonsLoadSuccess(
          pokemonList:
              paginatedPokemonList.results.map((e) => e.name).toList()));
    } on DataProviderError catch (dataProviderError) {
      emit(PokemonsLoadFailed(reason: dataProviderError.message));
    }
  }

  fetchPokemonListPage({required String url}) async {
    try {
      PaginatedPokemonList paginatedPokemonList =
          await _pokemonRepository.getPokemonListPage(url);

      emit(PokemonsLoadSuccess(
          pokemonList:
              paginatedPokemonList.results.map((e) => e.name).toList()));
    } on DataProviderError catch (dataProviderError) {
      emit(PokemonsLoadFailed(reason: dataProviderError.message));
    }
  }
}
