import 'package:adv_basics/models/quiz_question.dart';

const questions = [
  QuizQuestion(
    'What are the main building blocks of Flutter UIs?',
    ['Widgets', 'Component', 'Blocks', 'Functions'],
  ),
  QuizQuestion(
    'How are Flutter UIs built?',
    [
      'By combining widgets in code',
      'By combining widget in a visual editor',
      'By defining Widgets in config files',
      'By using XCode for IOS and android Studio for android',
    ],
  ),
  QuizQuestion(
    'What\'s the purppose of a StatefulWidget?',
    [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that Does not depend on data',
    ],
  ),
  QuizQuestion(
    'Which happens if you change data in a StatelessWidget?',
    [
      'The  UI is not updated',
      'The UI IS updated',
      'The closest StaefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuizQuestion(
    'How should you update data inside of StatefulWidgets?',
    [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling update()',
      'By calling updateState()',
    ],
  ),
];
