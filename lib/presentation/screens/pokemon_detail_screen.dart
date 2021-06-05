import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/models/pokemon.dart';
import 'package:flutter_pokedex/presentation/common/pokemon_utils.dart';
import 'package:flutter_pokedex/presentation/widgets/animated_flat_pokeball.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Pokemon pokemon = context.read<Pokemon>();

    return Scaffold(
      backgroundColor: PokemonUtils.mapTypeToColor(pokemon),
      body: Column(
        children: [
          Text(pokemon.name),
          Spacer(),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 0,
                child: AnimatedFlatPokeball(),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 180),
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: Text("content"),
              ),
              Positioned(
                top: 30,
                child: Container(
                  alignment: Alignment.center,
                  height: 200,
                  child: Hero(
                    tag: pokemon.name,
                    child: SvgPicture.network(
                      pokemon.sprites.other.dreamWorld.frontDefault,
                      fit: BoxFit.contain,
                      alignment: Alignment.topCenter,
                      semanticsLabel: pokemon.name,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
