import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/quiz_question.dart';

import 'constants.dart';

class ResultTuple extends StatelessWidget {
  const ResultTuple({
    super.key,
    required this.question,
    required this.questionIndex,
    required this.answerIndex,
  });

  final QuizQuestion question;
  final int questionIndex;
  final int answerIndex;

  @override
  Widget build(BuildContext context) {
    bool answeredRight = answerIndex == 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            /// width and height needs to be double of radius to fit the circle correctly
            height: resultTupleCircleRadius * 2,
            width: resultTupleCircleRadius * 2,
            margin: const EdgeInsets.only(right: 10),
            child: CustomPaint(
              painter: _CirclePainter(
                radius: resultTupleCircleRadius,
                fillColor: answeredRight ? greenResult : redResult,
              ),
              child: Center(
                child: Text(
                  (questionIndex + 1).toString(),
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(191, 0, 0, 0),
                    fontSize: resultTupleNumbersFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          LimitedBox(
            maxWidth: 280,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.questionText,
                  style: GoogleFonts.lato(
                    color: textColor,
                    fontSize: resultTupleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  question.choices[answerIndex],
                  style: GoogleFonts.lato(
                    color: answeredRight ? greenResult : redResult,
                    fontSize: resultTupleSmallFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (!answeredRight) ...{
                  Text(
                    question.choices[0],
                    style: GoogleFonts.lato(
                      color: greenResult,
                      fontSize: resultTupleSmallFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                },
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  _CirclePainter({required this.radius, required this.fillColor});

  final double radius;
  final Color fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    Paint p1 = Paint();
    p1.color = fillColor;
    p1.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(radius, radius), radius, p1);
    // canvas.drawRect(Rect.fromCenter(center: Offset(50, 50), width: 50, height: 80), p1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
