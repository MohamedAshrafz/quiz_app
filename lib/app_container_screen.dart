import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/data/question_list.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/welcome_screen.dart';

enum ScreenType {
  homeScreen,
  quizScreen,
  resultScreen,
}

List<int> _clearList(int length) => List<int>.filled(length, -1);

class AppContainerScreen extends StatefulWidget {
  const AppContainerScreen({super.key});

  @override
  State<StatefulWidget> createState() => AppContainerScreenState();
}

class AppContainerScreenState extends State<AppContainerScreen> {
  ScreenType currentScreenType = ScreenType.homeScreen;
  List<int> mainAnswersList = _clearList(questionsList.length);

  void nextScreenHandler(ScreenType screenTypeArg) {
    setState(() {
      currentScreenType = screenTypeArg;
      /// the the next screen is the home screen this means the app was reset
      if(screenTypeArg == ScreenType.homeScreen){
        mainAnswersList = _clearList(questionsList.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    final Widget currentScreenWidget;
    switch (currentScreenType) {
      case ScreenType.homeScreen:
        currentScreenWidget = WelcomeScreen(
          startQuizButtonHandler: nextScreenHandler,
        );

      case ScreenType.quizScreen:
        currentScreenWidget = QuizScreen(
          toResultScreenHandler: nextScreenHandler,
          answers: mainAnswersList,
        );

      case ScreenType.resultScreen:
        currentScreenWidget = ResultScreen(
          startQuizButtonHandler: nextScreenHandler,
          finalAnswers: mainAnswersList,
        );
    }

    return Scaffold(
      body: Container(
        // alignment: Alignment.center,
        decoration: appBoxDecoration,
        child: currentScreenWidget,
      ),
    );
  }
}
