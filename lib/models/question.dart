class Question {
  const Question({
    required this.text,
    required this.answers,
  });

  final String text;
  final List<String> answers;
  List<String> get shuffledAnswers {
    List<String> shuffeldList = [...answers];
    shuffeldList.shuffle();
    return shuffeldList;
  }
}
