import 'package:flutter/material.dart';
import 'package:flutter_pokedex/presentation/common/image_assets.dart';

class AnimatedFlatPokeball extends StatefulWidget {
  const AnimatedFlatPokeball({Key? key}) : super(key: key);

  @override
  _AnimatedFlatPokeballState createState() => _AnimatedFlatPokeballState();
}

class _AnimatedFlatPokeballState extends State<AnimatedFlatPokeball>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Image.asset(
        ImageAssets.FLAT_POKEBALL,
        color: Colors.white10,
      ),
    );
  }
}
