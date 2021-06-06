import 'package:flutter_pokedex/data/models/pokemon.dart';
import 'package:flutter_pokedex/data/models/pokemon_ability_detail.dart';
import 'package:flutter_pokedex/data/models/pokemon_evolution_chain.dart';
import 'package:flutter_pokedex/data/models/pokemon_specie.dart';

class PokemonWrapper {
  final Pokemon pokemon;
  final PokemonSpecie pokemonSpecie;
  final PokemonEvolutionChainWrapper pokemonEvolutionChainWrapper;
  final List<PokemonAbilityDetail> abilities;

  PokemonWrapper(
      {required this.pokemon,
      required this.pokemonSpecie,
      required this.pokemonEvolutionChainWrapper,
      required this.abilities});
}
