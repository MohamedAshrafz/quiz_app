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

const double homeScreenChildrenSpacing = 25.0;
const double homeScreenQuizLogoWidth = 250.0;