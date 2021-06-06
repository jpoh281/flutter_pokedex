import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/models/pokemon_wrapper.dart';
import "package:flutter_pokedex/presentation/common/extensions.dart";
import 'package:flutter_pokedex/presentation/common/pokemon_utils.dart';
import 'package:flutter_pokedex/presentation/pages/pokemon_detail_about_page.dart';
import 'package:flutter_pokedex/presentation/pages/pokemon_detail_base_stats_page.dart';
import 'package:flutter_pokedex/presentation/pages/pokemon_detail_evolution_page.dart';
import 'package:flutter_pokedex/presentation/pages/pokemon_detail_moves_page.dart';
import 'package:flutter_pokedex/presentation/widgets/animated_flat_pokeball.dart';
import 'package:flutter_pokedex/presentation/widgets/pokemon_type_badge.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokemonWrapper pokemonWrapper = context.read<PokemonWrapper>();

    return Scaffold(
      backgroundColor: PokemonUtils.mapTypeToColor(pokemonWrapper.pokemon),
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 26.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "#${PokemonUtils.formatId(pokemonWrapper.pokemon.id)}",
                          style: Theme.of(context).textTheme.headline3,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      pokemonWrapper.pokemon.name.capitalize(),
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: pokemonWrapper.pokemon.types
                          .map((pokemonType) => Container(
                              margin: const EdgeInsets.only(right: 5.0),
                              child: PokemonTypeBadge(
                                  name: pokemonType.type.name)))
                          .toList(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                      top: 0,
                      child: AnimatedFlatPokeball(),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 180),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          TabBar(
                            labelColor: Color(0XFF303943),
                            unselectedLabelColor: Colors.blueGrey,
                            tabs: [
                              Tab(
                                child: Text("About"),
                              ),
                              Tab(
                                child: Text("Base Stats"),
                              ),
                              Tab(
                                child: Text("Evolution"),
                              ),
                              Tab(
                                child: Text("Moves"),
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                PokemonDetailAboutPage(),
                                PokemonDetailBaseStatsPage(),
                                PokemonDetailEvolutionPage(),
                                PokemonDetailMovesPage()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 30,
                      child: Container(
                        alignment: Alignment.center,
                        height: 200,
                        child: Hero(
                          tag: pokemonWrapper.pokemon.name,
                          child: SvgPicture.network(
                            pokemonWrapper
                                .pokemon.sprites.other.dreamWorld.frontDefault,
                            fit: BoxFit.contain,
                            alignment: Alignment.topCenter,
                            semanticsLabel: pokemonWrapper.pokemon.name,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
