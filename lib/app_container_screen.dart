import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/result_screen.dart';
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

class ScreenTypeClass {
  ScreenTypeClass({required this.screenType, required this.handler}) {
    switch (screenType) {
      case ScreenType.homeScreen:
        widget = WelcomeScreen(startQuizButtonHandler: handler);

      case ScreenType.quizScreen:
        widget = QuizScreen(startQuizButtonHandler: handler);

      case ScreenType.resultScreen:
        widget = ResultScreen(startQuizButtonHandler: handler);
    }
  }

  final ScreenType screenType;
  late Widget widget;
  final void Function(ScreenType) handler;
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
    Widget currentScreenWidget =
        ScreenTypeClass(screenType: currentScreenType, handler: startQuizHandler).widget;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: appBoxDecoration,
        child: currentScreenWidget,
      ),
    );
  }
}
