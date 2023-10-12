import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'app_container_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.startQuizButtonHandler});

  final void Function(ScreenType) startQuizButtonHandler;

  @override
  State<StatefulWidget> createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Hi there from the quiz screen",
            style: TextStyle(
              color: Colors.white,
              fontSize: normalFontSize,
            ),
          ),
          OutlinedButton(
            onPressed: () => widget.startQuizButtonHandler(ScreenType.resultScreen),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white),
            ),
            child: const Text(
              "quiz result",
              style: TextStyle(color: Colors.white, fontSize: buttonTextsNormalFontSize),
            ),
          ),
        ],
      ),
    );
  }
}
