import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/welcome_screen.dart';

class AppContainerScreen extends StatefulWidget {
  const AppContainerScreen({super.key});

  @override
  State<StatefulWidget> createState() => AppContainerScreenState();
}

enum ScreenType {
  homeScreen,
  quizScreen,
  resultScreen,
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
    Widget currentScreenWidget = WelcomeScreen(
      startQuizButtonHandler: startQuizHandler,
    );

    if(currentScreenType == ScreenType.quizScreen){
      currentScreenWidget = const QuizScreen();
    }

    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            decoration: appBoxDecoration,
            child: currentScreenWidget,
        )
    );
  }
}
