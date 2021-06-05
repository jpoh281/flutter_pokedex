import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/bloc/pokemon_state.dart';
import 'package:flutter_pokedex/data/models/pokemon.dart';
import 'package:flutter_pokedex/data/repositories/pokemon_repository.dart';
import 'package:get_it/get_it.dart';

class PokemonCubit extends Cubit<PokemonState> {
  late PokemonRepository _pokemonRepository;

  PokemonCubit() : super(PokemonInitial()) {
    _pokemonRepository = GetIt.I<PokemonRepository>();
  }

  getPokemon() async {
    Pokemon? pokemon = await _pokemonRepository.getPokemonById(1);

    if (pokemon != null) {
      emit(PokemonLoadSuccess(pokemon: pokemon));
    } else {
      emit(PokemonLoadFailed(reason: 'There was an error'));
    }
  }
}
