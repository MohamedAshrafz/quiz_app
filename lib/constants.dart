import 'package:flutter/material.dart';

const appColorGradientList = [
  Color.fromARGB(255, 98, 13, 150),
  Color.fromARGB(255, 98, 13, 150),
  // Color.fromARGB(255, 128, 55, 182),
  // Color.fromARGB(255, 109, 66, 219),
  // Color.fromARGB(255, 84, 66, 219),
];

const appBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: appColorGradientList,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);

const Color primaryButtonsColor = Color.fromARGB(255, 60, 0, 100);
const Color textColor = Color.fromARGB(217, 255, 255, 255);

const Color redResult = Color.fromARGB(255, 250, 160, 160);
const Color greenResult = Color.fromARGB(255, 90, 200, 90);

const double homeScreenChildrenSpacing = 25.0;
const double questionTitleSpacing = 25.0;

const double quizButtonPadding = 10.0;

const double homeScreenQuizLogoWidth = 270.0;
const double questionButtonsWidth = 300.0;
const double resultScreenListViewHeight = 350.0;

const double questionTitleFontSize = 20.0;
const double mainTitleFontSize = 25.0;

const double mainButtonsFontSize = 18.0;
const double questionsButtonsFontSize = 15.0;

OutlinedBorder generalButtonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));

const double resultTupleCircleRadius = 20.0;

const double resultTupleNumbersFontSize = 17.0;
const double resultTupleFontSize = 14.0;
const double resultTupleSmallFontSize = 13.0;