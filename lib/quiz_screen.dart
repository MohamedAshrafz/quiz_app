import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<StatefulWidget> createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "hi there from the quiz screen",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ));
  }
}
