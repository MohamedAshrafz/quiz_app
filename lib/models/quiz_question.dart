class QuizQuestion {
  final String questionText;
  final List<String> choices;

  const QuizQuestion({
    required this.questionText,
    required this.choices,
  });

  List<String> get shuffledList {
    final List<String> shuffledChoicesList = List<String>.of(choices);
    shuffledChoicesList.shuffle();
    return shuffledChoicesList;
  }
}
