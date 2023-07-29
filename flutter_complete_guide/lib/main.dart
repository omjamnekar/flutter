import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        // backgroundColor: Color.fromARGB(209, 66, 2, 177),
        body: GradientContainer(
          Color.fromARGB(255, 27, 3, 68),
          Color.fromARGB(209, 88, 30, 189),
        ),
      ),
    ),
  );
}
