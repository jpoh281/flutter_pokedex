import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/models/pokemon.dart';

@immutable
abstract class PokemonState extends Equatable {}

class PokemonInitial extends PokemonState {
  @override
  List<Object?> get props => [];
}

class PokemonLoadSuccess extends PokemonState {
  final Pokemon pokemon;

  PokemonLoadSuccess({required this.pokemon});

  @override
  List<Object?> get props => [pokemon];
}

class PokemonLoadFailed extends PokemonState {
  final String reason;

  PokemonLoadFailed({required this.reason});

  @override
  List<Object?> get props => [reason];
}
