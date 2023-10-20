import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question_list.dart';
import 'package:quiz_app/main_screens_button.dart';
import 'package:quiz_app/result_tuple.dart';

import 'app_container_screen.dart';
import 'constants.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.onResetQuiz,
    required this.finalAnswers,
  });

  final void Function(ScreenType) onResetQuiz;
  final List<int> finalAnswers;

  @override
  Widget build(BuildContext context) {
    final int numberOfCorrectAnswers =
        finalAnswers.where((answerIndex) => answerIndex == 0 ? true : false).length;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "All done, you answered $numberOfCorrectAnswers"
            " out of ${finalAnswers.length} correctly",
            style: GoogleFonts.lato(
              color: textColor,
              fontSize: questionTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            height: resultScreenListViewHeight,
            margin: const EdgeInsets.only(right: 35, left: 35, bottom: 35),
            child: ListView(
              children: questionsList.map((q) {
                int qIndex = questionsList.indexOf(q);
                return ResultTuple(
                  question: q,
                  questionIndex: qIndex,
                  answerIndex: finalAnswers[qIndex],
                );
              }).toList(),
            ),
          ),
          MainScreenButton(
            buttonText: "reset quiz",
            onButtonPressed: onResetQuiz,
            nextScreenType: ScreenType.welcomeScreen,
            buttonIconData: Icons.refresh_rounded,
          ),
        ],
      ),
    );
  }
}
