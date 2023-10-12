import 'package:flutter/material.dart';

import 'app_container_screen.dart';
import 'constants.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.startQuizButtonHandler});

  final void Function(ScreenType) startQuizButtonHandler;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Congratulations, result screen is here",
            style: TextStyle(
              color: Colors.white,
              fontSize: normalFontSize,
            ),
          ),
          OutlinedButton(
            onPressed: () => startQuizButtonHandler(ScreenType.homeScreen),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white),
            ),
            child: const Text(
              "home screen",
              style: TextStyle(color: Colors.white, fontSize: buttonTextsNormalFontSize),
            ),
          ),
        ],
      ),
    );
  }
}
