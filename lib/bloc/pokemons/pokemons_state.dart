import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PokemonsState extends Equatable {}

class PokemonsInitial extends PokemonsState {
  @override
  List<Object?> get props => [];
}

class PokemonsLoadInProgress extends PokemonsState {
  @override
  List<Object?> get props => [];
}

class PokemonsLoadSuccess extends PokemonsState {
  final List<String> pokemonList;

  PokemonsLoadSuccess({required this.pokemonList});

  @override
  List<Object?> get props => [pokemonList];
}

class PokemonsLoadFailed extends PokemonsState {
  final String reason;

  PokemonsLoadFailed({required this.reason});

  @override
  List<Object?> get props => [reason];
}
