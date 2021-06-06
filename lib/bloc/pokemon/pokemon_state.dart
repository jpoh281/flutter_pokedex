import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/models/pokemon_wrapper.dart';

@immutable
abstract class PokemonState extends Equatable {}

class PokemonInitial extends PokemonState {
  @override
  List<Object?> get props => [];
}

class PokemonLoadSuccess extends PokemonState {
  final PokemonWrapper pokemonWrapper;

  PokemonLoadSuccess({required this.pokemonWrapper});

  @override
  List<Object?> get props => [pokemonWrapper];
}

class PokemonLoadFailed extends PokemonState {
  final String reason;

  PokemonLoadFailed({required this.reason});

  @override
  List<Object?> get props => [reason];
}
