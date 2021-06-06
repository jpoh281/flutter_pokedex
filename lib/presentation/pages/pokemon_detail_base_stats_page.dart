import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/models/pokemon_stat.dart';
import 'package:flutter_pokedex/data/models/pokemon_wrapper.dart';
import 'package:flutter_pokedex/presentation/common/extensions.dart';
import 'package:provider/provider.dart';

class PokemonDetailBaseStatsPage extends StatelessWidget {
  const PokemonDetailBaseStatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokemonWrapper pokemonWrapper = context.read<PokemonWrapper>();

    _buildStatRow(PokemonStat pokemonStat) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            pokemonStat.stat.name.capitalize(),
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(pokemonStat.baseStat.toString()),
        ],
      );
    }

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                color: Colors.grey.shade300,
                height: 1,
              ),
              itemBuilder: (context, index) =>
                  _buildStatRow(pokemonWrapper.pokemon.stats[index]),
              itemCount: pokemonWrapper.pokemon.stats.length,
              shrinkWrap: true,
            )
          ],
        ),
      ),
    );
  }
}
