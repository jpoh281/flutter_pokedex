import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/bloc/pokemon/pokemon_cubit.dart';
import 'package:flutter_pokedex/bloc/pokemons/pokemons_cubit.dart';
import 'package:flutter_pokedex/bloc/pokemons/pokemons_state.dart';
import 'package:flutter_pokedex/presentation/widgets/pokemon_preview.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PokemonsCubit>().fetchPokemonList();

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pokedex", style: Theme.of(context).textTheme.headline2),
                SizedBox(
                  height: 16.0,
                ),
                BlocBuilder<PokemonsCubit, PokemonsState>(
                  builder: (context, state) {
                    if (state is PokemonsLoadSuccess) {
                      return Expanded(
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                  mainAxisExtent: 140,
                                  crossAxisCount: 2),
                          itemCount: state.pokemonList.length,
                          itemBuilder: (context, index) =>
                              BlocProvider<PokemonCubit>(
                            create: (context) => PokemonCubit(),
                            child: PokemonPreview(
                              pokemonName: state.pokemonList[index],
                            ),
                          ),
                        ),
                      );
                    }

                    if (state is PokemonsLoadInProgress) {
                      return CircularProgressIndicator();
                    }

                    return Text(state.toString());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
