import 'package:flutter/material.dart';
import 'package:quiz_app/app_container_screen.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/main_screens_button.dart';

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
            color: const Color.fromARGB(190, 255, 255, 255),
          ),
          const SizedBox(
            height: homeScreenChildrenSpacing,
          ),
          const Text(
            "Learn Flutter the fun way",
            style: TextStyle(color: textColor, fontSize: mainTitleFontSize),
          ),
          const SizedBox(
            height: homeScreenChildrenSpacing,
          ),
          MainScreenButton(
            buttonText: "start quiz",
            buttonHandler: startQuizButtonHandler,
            nextScreenType: ScreenType.quizScreen,
            buttonIconData: Icons.arrow_right_alt,
          ),
        ],
      ),
    );
  }
}
