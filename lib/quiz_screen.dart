import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_list.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'app_container_screen.dart';
import 'constants.dart';

final Random rand = Random();

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.toResultScreenHandler,
    required this.answers,
  });

  final void Function(ScreenType) toResultScreenHandler;
  final List<int> answers;

  @override
  State<StatefulWidget> createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  int questionNumber = 0;

  void nextQuestionHandler(int answerIndex) {
    setState(() {
      if (questionNumber < questionsList.length) {
        widget.answers[questionNumber] = answerIndex;
        questionNumber++;
      }
    });

    /// if the question number is equal to questionsList.length
    /// do not update this screen but force the update of the parent screen AppContainerScreen
    if (questionNumber == questionsList.length) {
      questionNumber = 0;
      widget.toResultScreenHandler(ScreenType.resultScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestion currentQuestion = questionsList[questionNumber];
    List<String> shuffledChoicesList = List<String>.of(currentQuestion.choices);
    shuffledChoicesList.shuffle(rand);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentQuestion.questionText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: textColor,
              fontSize: questionTitleFontSize,
            ),
          ),
          const SizedBox(height: questionTitleSpacing),
          ...shuffledChoicesList.map(
            (choice) {
              int answerIndex = currentQuestion.choices.indexOf(choice);
              return SizedBox(
                width: questionButtonsWidth,
                child: ElevatedButton(
                  onPressed: () => nextQuestionHandler(answerIndex),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryButtonsColor,
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
          )
        ],
      ),
    );
  }
}
