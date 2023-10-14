import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question_list.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'app_container_screen.dart';
import 'constants.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.onQuestionsExhausted,
    required this.answers,
  });

  final void Function(ScreenType) onQuestionsExhausted;
  final List<int> answers;

  @override
  State<StatefulWidget> createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  int questionIndex = 0;

  void nextQuestionHandler(int answerIndex) {
    setState(() {
      if (questionIndex < questionsList.length) {
        widget.answers[questionIndex] = answerIndex;
        questionIndex++;
      }
    });

    /// if the question number is equal to questionsList.length (questions are exhausted)
    /// do not update this screen but force the update of the parent screen AppContainerScreen
    /// to the next screen ResultScreen
    if (questionIndex == questionsList.length) {
      widget.onQuestionsExhausted(ScreenType.resultScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestion currentQuestion = questionsList[questionIndex];

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentQuestion.questionText,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: textColor,
              fontSize: questionTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: questionTitleSpacing),
          ...currentQuestion.getShuffledList().map(
            (choice) {
              int answerIndex = currentQuestion.choices.indexOf(choice);
              return SizedBox(
                width: questionButtonsWidth,
                child: ElevatedButton(
                  onPressed: () => nextQuestionHandler(answerIndex),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: quizButtonPadding),
                    backgroundColor: primaryButtonsColor,
                    shape: generalButtonShape,
                  ),
                  child: Text(
                    choice,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: textColor,
                      fontSize: questionsButtonsFontSize,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
