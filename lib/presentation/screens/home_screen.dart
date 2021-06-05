import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/bloc/pokemon_cubit.dart';
import 'package:flutter_pokedex/bloc/pokemon_state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Screen"),
            TextButton(
                onPressed: context.read<PokemonCubit>().getPokemon,
                child: Text("getPokemon()")),
            BlocBuilder<PokemonCubit, PokemonState>(builder: (context, state) {
              return Text(state.toString());
            })
          ],
        )),
      ),
    );
  }
}
