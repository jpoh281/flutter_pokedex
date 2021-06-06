import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/bloc/pokemon/pokemon_cubit.dart';
import 'package:flutter_pokedex/bloc/pokemon/pokemon_state.dart';
import 'package:flutter_pokedex/bloc/pokemons/pokemons_state.dart';
import 'package:flutter_pokedex/data/models/pokemon_type.dart';
import 'package:flutter_pokedex/data/models/pokemon_wrapper.dart';
import "package:flutter_pokedex/presentation/common/extensions.dart";
import 'package:flutter_pokedex/presentation/common/image_assets.dart';
import 'package:flutter_pokedex/presentation/common/pokemon_utils.dart';
import 'package:flutter_pokedex/presentation/screens/pokemon_detail_screen.dart';
import 'package:flutter_pokedex/presentation/widgets/pokemon_type_badge.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PokemonPreview extends StatelessWidget {
  final String pokemonName;

  const PokemonPreview({Key? key, required this.pokemonName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PokemonCubit>().fetchPokemonByName(pokemonName);

    return BlocBuilder<PokemonCubit, PokemonState>(
      builder: (context, state) => GestureDetector(
        onTap: state is PokemonLoadSuccess
            ? () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Provider<PokemonWrapper>.value(
                        value: state.pokemonWrapper,
                        child: PokemonDetailScreen()),
                  ),
                );
              }
            : null,
        child: Container(
          decoration: BoxDecoration(
            color: state is PokemonLoadSuccess
                ? PokemonUtils.mapTypeToColor(state.pokemonWrapper.pokemon)
                : Colors.blueGrey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: ClipRRect(
            child: Stack(
              children: [
                Positioned(
                  bottom: -85,
                  right: -85,
                  child: Image.asset(
                    ImageAssets.FLAT_POKEBALL,
                    color: Colors.white10,
                    scale: 1.5,
                  ),
                ),
                if (state is PokemonsLoadInProgress) ...{
                  Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blueGrey),
                    ),
                  )
                },
                if (state is PokemonLoadSuccess) ...{
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.pokemonWrapper.pokemon.name.capitalize(),
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        for (PokemonType pokemonType
                            in state.pokemonWrapper.pokemon.types)
                          Container(
                              margin: const EdgeInsets.only(bottom: 5.0),
                              child:
                                  PokemonTypeBadge(name: pokemonType.type.name))
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 65,
                      height: 100,
                      child: Hero(
                        tag: state.pokemonWrapper.pokemon.name,
                        child: SvgPicture.network(
                          state.pokemonWrapper.pokemon.sprites.other.dreamWorld
                              .frontDefault,
                          fit: BoxFit.contain,
                          alignment: Alignment.bottomRight,
                          semanticsLabel: state.pokemonWrapper.pokemon.name,
                        ),
                      ),
                    ),
                  ),
                }
              ],
            ),
          ),
        ),
      ),
    );
  }
}
