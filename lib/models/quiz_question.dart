

class QuizQuestion {
  final String questionText;
  final List<String> choices;
  // final List<int> choicesScore;
  // final List<MaterialColor> buttonsColor;

  const QuizQuestion({
    required this.questionText,
    required this.choices,
    // required this.choicesScore,
    // this.buttonsColor = const [],
  });

  List<String> getShuffledList(){
    final List<String> shuffledChoicesList = List<String>.of(choices);
    shuffledChoicesList.shuffle();
    return shuffledChoicesList;
  }
}