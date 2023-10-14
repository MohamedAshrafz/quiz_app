import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/data/question_list.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/welcome_screen.dart';

enum ScreenType {
  welcomeScreen,
  quizScreen,
  resultScreen,
}

class AppContainerScreen extends StatefulWidget {
  const AppContainerScreen({super.key});

  @override
  State<StatefulWidget> createState() => AppContainerScreenState();
}

class AppContainerScreenState extends State<AppContainerScreen> {
  ScreenType currentScreenType = ScreenType.welcomeScreen;
  List<int> mainAnswersList = List<int>.filled(questionsList.length, -1);

  void chooseScreenHandler(ScreenType screenTypeArg) {
    setState(() {
      currentScreenType = screenTypeArg;

      /// the the next screen is the home screen this means the app was reset
      if (screenTypeArg == ScreenType.welcomeScreen) {
        mainAnswersList = List<int>.filled(questionsList.length, -1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget currentScreenWidget;
    switch (currentScreenType) {
      case ScreenType.welcomeScreen:
        currentScreenWidget = WelcomeScreen(
          onStartQuiz: chooseScreenHandler,
        );

      case ScreenType.quizScreen:
        currentScreenWidget = QuizScreen(
          onQuestionsExhausted: chooseScreenHandler,
          answers: mainAnswersList,
        );

      case ScreenType.resultScreen:
        currentScreenWidget = ResultScreen(
          onResetQuiz: chooseScreenHandler,
          finalAnswers: mainAnswersList,
        );
    }

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: appBoxDecoration,
        child: currentScreenWidget,
      ),
    );
  }
}
