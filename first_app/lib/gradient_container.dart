import 'package:flutter/material.dart';
import 'package:first_app/dice_roller.dart';

const startAllignment = Alignment.topCenter;
const endAllignment = Alignment.bottomCenter;

class GradientContainer extends StatelessWidget {
  //const GradientContainer({keyy}) : super(key: keyy);
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAllignment,
          end: endAllignment,
        ),
      ),
      child: const Center(child: DiceRoller()),
    );
  }
}
