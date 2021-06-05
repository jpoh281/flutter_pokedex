import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/bloc/pokemon_cubit.dart';
import 'package:flutter_pokedex/locator.dart';
import 'package:flutter_pokedex/presentation/screens/home_screen.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter PokeDex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => PokemonCubit(), child: HomeScreen()),
    );
  }
}
