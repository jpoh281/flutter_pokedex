import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/bloc/pokemon/pokemon_state.dart';
import 'package:flutter_pokedex/data/data_providers/common/data_provider_error.dart';
import 'package:flutter_pokedex/data/models/pokemon.dart';
import 'package:flutter_pokedex/data/models/pokemon_ability.dart';
import 'package:flutter_pokedex/data/models/pokemon_ability_detail.dart';
import 'package:flutter_pokedex/data/models/pokemon_evolution_chain.dart';
import 'package:flutter_pokedex/data/models/pokemon_specie.dart';
import 'package:flutter_pokedex/data/models/pokemon_wrapper.dart';
import 'package:flutter_pokedex/data/repositories/pokemon_ability_repository.dart';
import 'package:flutter_pokedex/data/repositories/pokemon_evolution_chain_repository.dart';
import 'package:flutter_pokedex/data/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/data/repositories/pokemon_species_repository.dart';
import 'package:get_it/get_it.dart';

class PokemonCubit extends Cubit<PokemonState> {
  late PokemonRepository _pokemonRepository;
  late PokemonSpeciesRepository _pokemonSpeciesRepository;
  late PokemonEvolutionChainRepository _pokemonEvolutionChainRepository;
  late PokemonAbilityRepository _pokemonAbilityRepository;

  PokemonCubit() : super(PokemonInitial()) {
    _pokemonRepository = GetIt.I<PokemonRepository>();
    _pokemonSpeciesRepository = GetIt.I<PokemonSpeciesRepository>();
    _pokemonEvolutionChainRepository =
        GetIt.I<PokemonEvolutionChainRepository>();
    _pokemonAbilityRepository = GetIt.I<PokemonAbilityRepository>();
  }

  fetchPokemonById(int id) async {
    try {
      Pokemon pokemon = await _pokemonRepository.getPokemonById(id);
      PokemonSpecie pokemonSpecie = await _pokemonSpeciesRepository
          .getPokemonSpeciePage(pokemon.species.url);
      PokemonEvolutionChainWrapper pokemonEvolutionChainWrapper =
          await _pokemonEvolutionChainRepository
              .getPokemonEvolutionChainPage(pokemonSpecie.evolutionChain.url);

      List<PokemonAbilityDetail> pokemonAbilityDetails = [];
      for (PokemonAbility ability in pokemon.abilities) {
        PokemonAbilityDetail pokemonAbilityDetail =
            await _pokemonAbilityRepository
                .getPokemonAbilityPage(ability.ability.url);

        pokemonAbilityDetails.add(pokemonAbilityDetail);
      }

      emit(PokemonLoadSuccess(
          pokemonWrapper: PokemonWrapper(
              pokemon: pokemon,
              pokemonSpecie: pokemonSpecie,
              pokemonEvolutionChainWrapper: pokemonEvolutionChainWrapper,
              abilities: pokemonAbilityDetails)));
    } on DataProviderError catch (dataProviderError) {
      emit(PokemonLoadFailed(reason: dataProviderError.message));
    }
  }

  fetchPokemonByName(String name) async {
    try {
      Pokemon pokemon = await _pokemonRepository.getPokemonByName(name);
      PokemonSpecie pokemonSpecie = await _pokemonSpeciesRepository
          .getPokemonSpeciePage(pokemon.species.url);
      PokemonEvolutionChainWrapper pokemonEvolutionChainWrapper =
          await _pokemonEvolutionChainRepository
              .getPokemonEvolutionChainPage(pokemonSpecie.evolutionChain.url);

      List<PokemonAbilityDetail> pokemonAbilityDetails = [];
      for (PokemonAbility ability in pokemon.abilities) {
        PokemonAbilityDetail pokemonAbilityDetail =
            await _pokemonAbilityRepository
                .getPokemonAbilityPage(ability.ability.url);

        pokemonAbilityDetails.add(pokemonAbilityDetail);
      }

      emit(PokemonLoadSuccess(
          pokemonWrapper: PokemonWrapper(
              pokemon: pokemon,
              pokemonSpecie: pokemonSpecie,
              pokemonEvolutionChainWrapper: pokemonEvolutionChainWrapper,
              abilities: pokemonAbilityDetails)));
    } on DataProviderError catch (dataProviderError) {
      emit(PokemonLoadFailed(reason: dataProviderError.message));
    }
  }
}
