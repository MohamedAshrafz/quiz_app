import 'package:flutter/material.dart';

import 'app_container_screen.dart';
import 'constants.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.startQuizButtonHandler,
    required this.finalAnswers,
  });

  final void Function(ScreenType) startQuizButtonHandler;
  final List<int> finalAnswers;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Congratulations, result screen is here",
            style: TextStyle(
              color: textColor,
              fontSize: questionTitleFontSize,
            ),
          ),
          ...finalAnswers.map((ans) => Text(ans.toString())),
          OutlinedButton.icon(
            onPressed: () => startQuizButtonHandler(ScreenType.homeScreen),
            style: OutlinedButton.styleFrom(
              foregroundColor: textColor,
              side: const BorderSide(color: textColor),
            ),
            icon: const Icon(Icons.refresh_rounded),
            label: const Text(
              "reset quiz",
              style: TextStyle(color: textColor, fontSize: mainButtonsFontSize),
            ),
          ),
        ],
      ),
    );
  }
}
