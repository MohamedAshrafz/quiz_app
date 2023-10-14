import 'package:flutter/material.dart';

const appColorGradientList = [
  Color.fromARGB(255, 111, 14, 145),
  Color.fromARGB(255, 152, 67, 219),
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

const Color primaryButtonsColor = Color.fromARGB(255, 80, 0, 122);
const Color textColor = Color.fromARGB(255, 234, 219, 245);

const double homeScreenChildrenSpacing = 25.0;
const double questionTitleSpacing = 25.0;
const double homeScreenQuizLogoWidth = 270.0;

const double questionButtonsWidth = 300.0;

const double questionTitleFontSize = 20;
const double mainTitleFontSize = 25;

const double mainButtonsFontSize = 18;
const double questionsButtonsFontSize = 15;