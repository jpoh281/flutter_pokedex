import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/bloc/pokemons/pokemons_cubit.dart';
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
      title: "Flutter PokeDex",
      theme: ThemeData(
          fontFamily: "Google",
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              headline2: TextStyle(
                  color: Color(0XFF303943),
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
              headline3: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Color(0XFF303943)))),
      home: BlocProvider(
          create: (context) => PokemonsCubit(), child: HomeScreen()),
    );
  }
}
