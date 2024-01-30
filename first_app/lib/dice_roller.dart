import 'dart:math';
import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

var randomizer = Random();

class _DiceRollerState extends State<DiceRoller> {
  @override
  String selectedAsset = 'assets/images/dice-2.png';

  void rolldice() {
    setState(() {
      var randomInt = randomizer.nextInt(6) + 1;
      selectedAsset = 'assets/images/dice-$randomInt.png';
      print('printed');
    });
  }

  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        selectedAsset,
        width: 200,
      ),
      TextButton(onPressed: rolldice, child: const Text('Roll dice'))
    ]);
  }
}
