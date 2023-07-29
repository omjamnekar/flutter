import 'package:flutter/material.dart';

import 'package:adv_basics/quiz.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:google_fonts/google_fonts.dart';

// // class Question extends StatelessWidget {
// //   const Question({super.key});

// //   @override
// //   Widget build(context) {
// //     return Center(
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: const [
// //           Text(
// //             'What are the main building blocks of Flutter UIs?',
// //             style: TextStyle(
// //               color: Colors.white,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// class Change extends StatefulWidget {
//   const Change({super.key});

//   @override
//   State<Change> createState() {
//     return _ChangeSlide();
//   }
// }

// class _ChangeSlide extends State<Change> {
//  // var changingpoint = const StartScreen();

//   void change() {
//     setState(() {
//       // ignore: unused_local_variable
//       // var changingpoint = const Question();
//     });
//   }

//   @override
//   Widget build(context) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(colors: [
//           Color.fromARGB(255, 61, 7, 148),
//           Color.fromARGB(255, 94, 41, 180)
//         ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//       ),
//       child: ,
//     );
//   }
// }

class StartScreen extends StatelessWidget {
  const StartScreen(this.switching, {super.key});

  final void Function() switching;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize
          .min, //here the  soze of image is going to be vertically align with the screen
      children: [
        Opacity(
          opacity: 0.6,
          child: Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        const SizedBox(height: 80), // keep the note
        Text(
          'learn Flutter the fun way!',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 179, 137, 218),
            fontSize: 24,
          ),
          // style: TextStyle(
          //     color: Color.fromARGB(255, 255, 226, 226), fontSize: 24),
        ),
        const SizedBox(height: 30),

        //button
        OutlinedButton.icon(
          onPressed: switching,
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quize'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white, //note this
          ),
        ) //annonimus function
      ],
    ));
  }
}
