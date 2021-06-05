import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/bloc/pokemon_state.dart';
import 'package:flutter_pokedex/data/data_providers/data_provider_error.dart';
import 'package:flutter_pokedex/data/models/pokemon.dart';
import 'package:flutter_pokedex/data/repositories/pokemon_repository.dart';
import 'package:get_it/get_it.dart';

class PokemonCubit extends Cubit<PokemonState> {
  late PokemonRepository _pokemonRepository;

  PokemonCubit() : super(PokemonInitial()) {
    _pokemonRepository = GetIt.I<PokemonRepository>();
  }

  getPokemonById(int id) async {
    try {
      Pokemon? pokemon = await _pokemonRepository.getPokemonById(id);

      emit(PokemonLoadSuccess(pokemon: pokemon));
    } on DataProviderError catch (dataProviderError) {
      emit(PokemonLoadFailed(reason: dataProviderError.message));
    }
  }
}
