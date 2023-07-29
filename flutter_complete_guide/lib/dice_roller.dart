import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

// underscore means this class is only maint to define
// itself inside the the file it can't b e excess out side
class _DiceRollerState extends State<DiceRoller> {
  var currentDiseRoll = 2;

  //var activeDeviceImage = 'assets/image/dice-images/dice-2.png';

  void rollDice() {
    setState(() {
      currentDiseRoll = randomizer.nextInt(6) + 1;

      // var diceRoll = Random().nextInt(6) + 1; //0 <> 5 that's why +1
      // activeDeviceImage = 'assets/image/dice-images/dice-$diceRoll.png';
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/image/dice-images/dice-$currentDiseRoll.png',
          // activeDeviceImage,
          width: 200,
        ),
        const SizedBox(height: 20),
        // ElevatedButton(onPressed: onPressed, child: child)
        // OutlinedButton(onPressed: onPressed, child: child)
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // padding: const EdgeInsets.only(
            //   top: 20,
            // ),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}
