import 'package:flutter/material.dart';
import 'package:quiz_app/app_container_screen.dart';

import 'constants.dart';

class MainScreenButton extends StatelessWidget {
  const MainScreenButton({
    super.key,
    required this.buttonText,
    required this.buttonHandler,
    required this.nextScreenType,
    required this.buttonIconData,
  });

  final String buttonText;
  final void Function(ScreenType) buttonHandler;
  final ScreenType nextScreenType;
  final IconData buttonIconData;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => buttonHandler(nextScreenType),
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor,
        side: const BorderSide(color: textColor),
        shape: generalButtonShape,
      ),
      icon: Icon(buttonIconData),
      label: Text(
        buttonText,
        style: const TextStyle(color: textColor, fontSize: mainButtonsFontSize),
      ),
    );
  }
}
