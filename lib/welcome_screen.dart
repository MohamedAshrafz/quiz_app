import 'package:flutter/material.dart';
import 'package:quiz_app/app_container_screen.dart';
import 'package:quiz_app/constants.dart';

class WelcomeScreen extends StatelessWidget {
  // final VoidCallbackAction startQuizButtonHandlers;
  final void Function(ScreenType) startQuizButtonHandler;

  const WelcomeScreen({super.key, required this.startQuizButtonHandler});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: homeScreenQuizLogoWidth,
          ),
          const SizedBox(
            height: homeScreenChildrenSpacing,
          ),
          const Text(
            "Learn Flutter the fun way",
            style: TextStyle(color: Colors.white, fontSize: mainTitleFontSize),
          ),
          const SizedBox(
            height: homeScreenChildrenSpacing,
          ),
          OutlinedButton.icon(
            onPressed: () => startQuizButtonHandler(ScreenType.quizScreen),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              "start quiz",
              style: TextStyle(color: Colors.white, fontSize: buttonTextsNormalFontSize),
            ),
          ),
        ],
      ),
    );
  }
}
