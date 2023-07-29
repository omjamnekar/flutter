import 'dart:ffi';

import 'package:adv_basics/data/question.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/question-summery.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:adv_basics/start_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.chosenAnswer, required this.start, super.key});
  final List<String> chosenAnswer;
  final void Function() start;
//   @override
//   State<ResultScreen> createState() => _ResultScreenState();
// }

// class _ResultScreenState extends State<ResultScreen> {
  // final void Function() result;
// here  we can ues method Gutter in which get can be use in the method(function ())
  // here via using get we should remove '()' from functiom
  // and it can be use as property

  List<Map<String, Object>> get SummryData {
    // List<Map<String, Object>> getSummryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i]
      });
    }

    return summary;
  }

  // void start(result) {
  //   setState() {
  //     final screenWidget = StartScreen();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final summaryData = SummryData;
    final numTotalQuestions = questions.length;

    // final numCorrectQuestion =  summaryData.where((data){
    final numCorrectQuestion = SummryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    //where is use to filter the list and it will not effect to the actaul list
    // by
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestion out of $numTotalQuestions question correctly!',
              style: const TextStyle(
                  color: Color.fromARGB(255, 187, 124, 238),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummery(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              icon: const Icon(Icons.refresh),
              onPressed: start,
              label: const Text(
                'Result Quiz!',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
