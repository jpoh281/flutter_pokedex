import 'package:flutter/material.dart';

class PokemonTypeBadge extends StatelessWidget {
  final String name;

  const PokemonTypeBadge({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.only(bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          name,
          style: Theme.of(context).textTheme.bodyText1,
        ));
  }
}
