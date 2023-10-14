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

List<int> _clearList(int length) => List<int>.filled(length, -1);

class AppContainerScreen extends StatefulWidget {
  const AppContainerScreen({super.key});

  @override
  State<StatefulWidget> createState() => AppContainerScreenState();
}

class AppContainerScreenState extends State<AppContainerScreen> {
  ScreenType currentScreenType = ScreenType.welcomeScreen;
  List<int> mainAnswersList = _clearList(questionsList.length);

  void chooseScreenHandler(ScreenType screenTypeArg) {
    setState(() {
      currentScreenType = screenTypeArg;
      /// the the next screen is the home screen this means the app was reset
      if(screenTypeArg == ScreenType.welcomeScreen){
        mainAnswersList = _clearList(questionsList.length);
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
