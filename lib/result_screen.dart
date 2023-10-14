import 'package:flutter/material.dart';
import 'package:quiz_app/main_screens_button.dart';

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
          MainScreenButton(
            buttonText: "reset quiz",
            buttonHandler: startQuizButtonHandler,
            nextScreenType: ScreenType.welcomeScreen,
            buttonIconData: Icons.refresh_rounded,
          ),
        ],
      ),
    );
  }
}
