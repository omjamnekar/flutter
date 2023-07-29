// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dice_roller.dart';
// import 'package:flutter_complete_guide/dice_roller.dart';
// import 'package:flutter_complete_guide/styletext.dart';

const startAlignment = Alignment.topLeft;
final endAlignment = Alignment.bottomRight;

// StatelessWidget

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  // const GradientContainer.purple({super.key})
  //     : color1 = Colors.deepPurple,
  //       color1 = Colors.indigo;

  //  const StyledText(this.text, {super.key,required this.colors});

  // ignore: prefer_typing_uninitialized_variables

  final Color color1, color2;
  // final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(child: DiceRoller()),
    );
  }
}
