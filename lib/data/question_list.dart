import 'package:quiz_app/models/quiz_question.dart';

const List<QuizQuestion> questionsList = [
  QuizQuestion(
    questionText: 'ما هي لبنات بناء برامج Flutter؟',
    choices: [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  QuizQuestion(
    questionText: 'كيف نبني برامح Flutter ؟',
    choices: [
      'By combining widgets in code',
      'By combining widgets in a visual editor',
      'By defining widgets in config files',
      'By using XCode for iOS and Android Studio for Android',
    ],
  ),
  QuizQuestion(
    questionText: 'What\'s the purpose of a StatefulWidget?',
    choices: [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestion(
    questionText:
        'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    choices: [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuizQuestion(
    questionText: 'What happens if you change data in a StatelessWidget?',
    choices: [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuizQuestion(
    questionText: 'How should you update data inside of StatefulWidgets?',
    choices: [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
];
