import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:adv_basics/result-screen.dart';
import 'package:adv_basics/data/question.dart';
import 'dart:math';

import 'package:flutter/rendering.dart';

class QuestionSummery extends StatelessWidget {
  const QuestionSummery(this.summeryData, {super.key});

  final List<Map<String, Object>> summeryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child:

          //it is used for scrolling the Column

          SingleChildScrollView(
        child: Column(
          children: summeryData.map((data) {
            return Row(
              children: [
                // alignment: const Alignment(0, 0),
                // padding: const EdgeInsets.all(15),
                // width: 23,
                // color: Colors.green,
                // child:
                Text(
                  ((data['questionIndex'] as int) + 1).toString(),
                  style: const TextStyle(
                    backgroundColor: Colors.white,
                    fontSize: 15,
                  ),

                  // textAlign: TextAlign.center,
                  // style: const TextStyle(
                  //     fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
                ),

                //HERE Expand sures that the Column
                // width should not go the screen of flex element(Row|^)

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 177, 79, 243)),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 123, 192, 248)),
                      )
                    ],
                  ),
                )
              ],

              //toString is the operator that con
              //verts the int into string
              // AS INT operator will converts the string into int.
            );
          }).toList(),
        ),
      ),
    );
  }
}
