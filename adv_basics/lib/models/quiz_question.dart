class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  // here also gutter used and get is use to convert
  // function into property

  // List<String> get ShuffleAnswers {
  List<String> getShuffleAnswers() {
    final shufflerList = List.of(answers);
    shufflerList.shuffle();
    return shufflerList;
  }
}
