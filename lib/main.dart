import 'package:flutter/material.dart';
import 'package:quiz_app/app_container_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const AppContainerScreen(),
    );
  }
}