import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/models/pokemon_wrapper.dart';
import 'package:flutter_pokedex/presentation/common/pokemon_utils.dart';
import 'package:provider/provider.dart';

class PokemonDetailAboutPage extends StatelessWidget {
  const PokemonDetailAboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokemonWrapper pokemonWrapper = context.read<PokemonWrapper>();

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(PokemonUtils.getFirstFlavorText(pokemonWrapper.pokemonSpecie),
                textAlign: TextAlign.center),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Height",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text("${pokemonWrapper.pokemon.height / 10} m")
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Weight",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text("${pokemonWrapper.pokemon.weight / 10} kg")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
