import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/welcome_screen.dart';

enum ScreenType {
  homeScreen,
  quizScreen,
  resultScreen,
}

class AppContainerScreen extends StatefulWidget {
  const AppContainerScreen({super.key});

  @override
  State<StatefulWidget> createState() => AppContainerScreenState();
}

class AppContainerScreenState extends State<AppContainerScreen> {
  ScreenType currentScreenType = ScreenType.homeScreen;

  void startQuizHandler(ScreenType screenTypeArg) {
    setState(() {
      currentScreenType = screenTypeArg;
    });
  }

  @override
  Widget build(BuildContext context) {


    Widget currentScreenWidget;
    switch (currentScreenType) {
      case ScreenType.homeScreen:
        currentScreenWidget = WelcomeScreen(
          startQuizButtonHandler: startQuizHandler,
        );

      case ScreenType.quizScreen:
        currentScreenWidget = QuizScreen(
          startQuizButtonHandler: startQuizHandler,
        );

      case ScreenType.resultScreen:
        currentScreenWidget = ResultScreen(
          startQuizButtonHandler: startQuizHandler,
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
