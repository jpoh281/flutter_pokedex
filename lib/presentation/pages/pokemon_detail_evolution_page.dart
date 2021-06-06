import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/models/pokemon_evolution_chain.dart';
import 'package:flutter_pokedex/data/models/pokemon_wrapper.dart';
import 'package:provider/provider.dart';

class PokemonDetailEvolutionPage extends StatelessWidget {
  const PokemonDetailEvolutionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> evolutionWidgets = [];
    PokemonWrapper pokemonWrapper = context.read<PokemonWrapper>();
    PokemonEvolutionChain evolutionChain =
        pokemonWrapper.pokemonEvolutionChainWrapper.chain;

    _buildEvolutionWidget(PokemonEvolutionChain evolutionChain) {
      return Column(
        children: [
          Text(
            evolutionChain.species.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          if (evolutionChain.evolutionDetails.isNotEmpty) ...{
            SizedBox(
              height: 5.0,
            ),
            Text(
              "min. level: ${evolutionChain.evolutionDetails[0].minLevel ?? 'unknown'}",
              style: TextStyle(color: Colors.grey),
            )
          }
        ],
      );
    }

    _buildEvolutionWidgets(PokemonEvolutionChain evolutionChain) {
      evolutionWidgets.add(_buildEvolutionWidget(evolutionChain));

      if (evolutionChain.evolvesTo.isNotEmpty) {
        _buildEvolutionWidgets(evolutionChain.evolvesTo[0]);
      }
    }

    _buildEvolutionWidgets(evolutionChain);

    return SingleChildScrollView(
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: evolutionWidgets,
              )
            ],
          )),
    );
  }
}
