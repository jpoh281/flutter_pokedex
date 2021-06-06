import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/models/pokemon_ability_detail.dart';
import 'package:flutter_pokedex/data/models/pokemon_wrapper.dart';
import 'package:flutter_pokedex/presentation/common/pokemon_utils.dart';
import 'package:provider/provider.dart';

class PokemonDetailMovesPage extends StatelessWidget {
  const PokemonDetailMovesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokemonWrapper pokemonWrapper = context.read<PokemonWrapper>();
    List<PokemonAbilityDetail> pokemonAbilityDetails = pokemonWrapper.abilities;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: pokemonAbilityDetails.length,
          itemBuilder: (context, index) => PokemonAbilityDetailView(
            pokemonAbilityDetail: pokemonAbilityDetails[index],
          ),
        ),
      ),
    );
  }
}

class PokemonAbilityDetailView extends StatelessWidget {
  final PokemonAbilityDetail pokemonAbilityDetail;

  const PokemonAbilityDetailView({Key? key, required this.pokemonAbilityDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            PokemonUtils.getAbilityNameText(pokemonAbilityDetail),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(PokemonUtils.getFirstFlavorText(
              pokemonAbilityDetail.flavorTextEntries))
        ],
      ),
    );
  }
}
