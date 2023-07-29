import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:adv_basics/models/answer.dart';
import 'package:adv_basics/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 136, 87, 182),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: 30,
            ),

            // ...currentQuestion.ShuffleAnswers.map(
            ...currentQuestion.getShuffleAnswers().map(
              (answer) {
                return AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    });
              },
            ),

            // AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
            // AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
            // AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
            // AnswerButton(answerText: currentQuestion.answers[3], onTap: () {}),
          ],
        ),
      ),
    );
  }
}


















 

// class TextOfButton extends StatelessWidget {
//   const TextOfButton(this.Text1, {super.key});

// // ignore: non_constant_identifier_names
//   final String Text1;

//   @override
//   Widget build(context) {
//     return TextButton(
//       onPressed: () {},
//       style: TextButton.styleFrom(
//           fixedSize: const Size(340, 2),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           backgroundColor: Color.fromARGB(233, 43, 11, 68)),
//       child: Text(
//         Text1,
//         style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
//       ),
//     );
//   }
// }

// class QuestionScreen extends StatefulWidget {
//   const QuestionScreen({super.key});

//   @override
//   State<QuestionScreen> createState() {
//     // TODO: implement createState
//     return _QuestionScreenState();
//   }
// }

// class _QuestionScreenState extends State<QuestionScreen> {
//   @override
//   Widget build(context) {
//     return Center(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const SizedBox(
//             width: 350,
//             child: Text(
//               'What are the main building blocks of Flutter UIs?',
//               style: TextStyle(
//                   color: Color.fromARGB(255, 168, 114, 199),
//                   fontSize: 25,
//                   fontWeight: FontWeight.w800),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           // ignore: unnecessary_const
//           const SizedBox(
//             height: 20,
//           ),
//           const TextOfButton('Functions'),
//           const TextOfButton('Components'),
//           const TextOfButton('Blocks'),
//           const TextOfButton('Widgets'),
//         ],
//       ),
//     );
//   }
// }
