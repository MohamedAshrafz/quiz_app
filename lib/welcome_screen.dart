import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/app_container_screen.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/main_screens_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.onStartQuiz});

  // final VoidCallbackAction startQuizButtonHandlers;
  final void Function(ScreenType) onStartQuiz;

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
          Text(
            "Learn Flutter the fun way",
            style: GoogleFonts.lato(
              color: textColor,
              fontSize: mainTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: homeScreenChildrenSpacing,
          ),
          MainScreenButton(
            buttonText: "start quiz",
            onButtonPressed: onStartQuiz,
            nextScreenType: ScreenType.quizScreen,
            buttonIconData: Icons.arrow_right_alt,
          ),
        ],
      ),
    );
  }
}
