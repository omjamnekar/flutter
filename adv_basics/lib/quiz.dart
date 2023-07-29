import 'package:adv_basics/data/question.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/result-screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quizstate();
  }
}

class _Quizstate extends State<Quiz> {
// chaning the screen
  // Widget? activeScreen;
  List<String> _seletedAnswers = [];

  //  here the initState is use for initializing the swithScreen
  //in the StartScreen Before execution of Build

  var activeScreen = 'start-screen';

  void chooseAnswers(String answer) {
    _seletedAnswers.add(answer);

    if (_seletedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  // void restart() {
  //   setState(() {
  //     activeScreen = 'start-screen';
  //   });
  // }

  @override
  void initState() {
    activeScreen = 'start-screen';
    super.initState();
  }

  void swicthScreen() {
    setState(() {
      activeScreen = 'question-screen';
      // activeScreen = QuestionScreen(
      //   onSelectAnswer: chooseAnswers,
      // );
    });
  }

  void nul() {
    // setState() {
    //   // activeScreen = 'question-screen';
    //   // activeScreen = QuestionScreen(
    //   //   onSelectAnswer: chooseAnswers,
    //   // );
    // }
  }

  void restartQuiz() {
    setState(() {
      _seletedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(swicthScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswers,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswer: _seletedAnswers,
        start: restartQuiz,
        // result: nul,
      );
    }

    // if (activeScreen == 'start-screen') {
    //   screenWidget = ResultScreen(
    //     chosenAnswer: seletedAnswers,
    //     // result: restart,
    //   );
    // }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 61, 7, 148),
              Color.fromARGB(255, 94, 41, 180)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
          // activeScreen != 'start-screen'
          //     ? const QuestionScreen()
          //     : StartScreen(swicthScreen),
        ),
      ),
    );
  }
}
