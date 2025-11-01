import 'package:quiz_app/models/question_model.dart';

class SampleQuestions {
  // Dart Programming Questions
  static List<Question> getDartQuestions() {
    return [
      Question(
        id: 'dart_q1',
        questionText:
        'Which keyword is used to declare a variable whose value cannot be changed in Dart?',
        answers: [
          Answer(id: 'a1', text: 'var', isCorrect: false),
          Answer(id: 'a2', text: 'final', isCorrect: true),
          Answer(id: 'a3', text: 'dynamic', isCorrect: false),
          Answer(id: 'a4', text: 'let', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q2',
        questionText: 'Which are the primitive data types in Dart?',
        answers: [
          Answer(id: 'a1', text: 'int', isCorrect: true),
          Answer(id: 'a2', text: 'integer', isCorrect: false),
          Answer(id: 'a3', text: 'number', isCorrect: false),
          Answer(id: 'a4', text: 'float', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q3',
        questionText: 'How do you create a list in Dart?',
        answers: [
          Answer(id: 'a1', text: 'List myList = new List()', isCorrect: false),
          Answer(id: 'a2', text: 'var myList = []', isCorrect: true),
          Answer(id: 'a3', text: 'array myList = []', isCorrect: false),
          Answer(id: 'a4', text: 'list myList = new list()', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q4',
        questionText:
        'What is the output of the following code?\n\nvoid main() {\n  print(5 + 3 * 2);\n}',
        answers: [
          Answer(id: 'a1', text: '16', isCorrect: false),
          Answer(id: 'a2', text: '11', isCorrect: true),
          Answer(id: 'a3', text: '13', isCorrect: false),
          Answer(id: 'a4', text: '10', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q5',
        questionText: 'Which keyword is used to create a class in Dart?',
        answers: [
          Answer(id: 'a1', text: 'object', isCorrect: false),
          Answer(id: 'a2', text: 'class', isCorrect: true),
          Answer(id: 'a3', text: 'def', isCorrect: false),
          Answer(id: 'a4', text: 'function', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q6',
        questionText:
        'Which of the following is the correct way to create a function in Dart?',
        answers: [
          Answer(id: 'a1', text: 'function myFunction() {}', isCorrect: false),
          Answer(id: 'a2', text: 'void myFunction() {}', isCorrect: true),
          Answer(id: 'a3', text: 'def myFunction() {}', isCorrect: false),
          Answer(id: 'a4', text: 'func myFunction() {}', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q7',
        questionText: 'What is the difference between "final" and "const" in Dart?',
        answers: [
          Answer(id: 'a1', text: 'There is no difference', isCorrect: false),
          Answer(
              id: 'a2',
              text: '"const" must be known at compile time',
              isCorrect: true),
          Answer(id: 'a3', text: '"final" is faster than const', isCorrect: false),
          Answer(id: 'a4', text: '"const" can be changed', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q8',
        questionText: 'How do you use string interpolation in Dart?',
        answers: [
          Answer(id: 'a1', text: 'print("Hello " + name)', isCorrect: false),
          Answer(id: 'a2', text: 'print("Hello \$name")', isCorrect: true),
          Answer(id: 'a3', text: 'print("Hello #{name}")', isCorrect: false),
          Answer(id: 'a4', text: 'print("Hello %s", name)', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q9',
        questionText: 'Which keyword is used to inherit a class in Dart?',
        answers: [
          Answer(id: 'a1', text: 'inherits', isCorrect: false),
          Answer(id: 'a2', text: 'implements', isCorrect: false),
          Answer(id: 'a3', text: 'extends', isCorrect: true),
          Answer(id: 'a4', text: 'inherit', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q10',
        questionText: 'Which of the following is the correct way to create a Map in Dart?',
        answers: [
          Answer(id: 'a1', text: 'var map = ()', isCorrect: false),
          Answer(id: 'a2', text: 'var map = {}', isCorrect: true),
          Answer(id: 'a3', text: 'var map = []', isCorrect: false),
          Answer(id: 'a4', text: 'Map map = Map()', isCorrect: false),
        ],
      ),
    ];
  }

  // Math Questions
  static List<Question> getMathQuestions() {
    return [
      Question(
        id: 'math_q1',
        questionText: 'What is the result of 25 × 4?',
        answers: [
          Answer(id: 'a1', text: '90', isCorrect: false),
          Answer(id: 'a2', text: '100', isCorrect: true),
          Answer(id: 'a3', text: '110', isCorrect: false),
          Answer(id: 'a4', text: '120', isCorrect: false),
        ],
      ),
      Question(
        id: 'math_q2',
        questionText: 'If x + 5 = 12, what is the value of x?',
        answers: [
          Answer(id: 'a1', text: '5', isCorrect: false),
          Answer(id: 'a2', text: '6', isCorrect: false),
          Answer(id: 'a3', text: '7', isCorrect: true),
          Answer(id: 'a4', text: '8', isCorrect: false),
        ],
      ),
      Question(
        id: 'math_q3',
        questionText: 'The area of a square with a side of 8 cm is...',
        answers: [
          Answer(id: 'a1', text: '32 cm²', isCorrect: false),
          Answer(id: 'a2', text: '48 cm²', isCorrect: false),
          Answer(id: 'a3', text: '56 cm²', isCorrect: false),
          Answer(id: 'a4', text: '64 cm²', isCorrect: true),
        ],
      ),
      Question(
        id: 'math_q4',
        questionText: 'What is 15% of 200?',
        answers: [
          Answer(id: 'a1', text: '20', isCorrect: false),
          Answer(id: 'a2', text: '25', isCorrect: false),
          Answer(id: 'a3', text: '30', isCorrect: true),
          Answer(id: 'a4', text: '35', isCorrect: false),
        ],
      ),
      Question(
        id: 'math_q5',
        questionText: 'The result of 144 ÷ 12 is...',
        answers: [
          Answer(id: 'a1', text: '10', isCorrect: false),
          Answer(id: 'a2', text: '11', isCorrect: false),
          Answer(id: 'a3', text: '12', isCorrect: true),
          Answer(id: 'a4', text: '13', isCorrect: false),
        ],
      ),
      Question(
        id: 'math_q6',
        questionText:
        'The circumference of a circle with a diameter of 14 cm is... (π = 22/7)',
        answers: [
          Answer(id: 'a1', text: '38 cm', isCorrect: false),
          Answer(id: 'a2', text: '42 cm', isCorrect: false),
          Answer(id: 'a3', text: '44 cm', isCorrect: true),
          Answer(id: 'a4', text: '48 cm', isCorrect: false),
        ],
      ),
      Question(
        id: 'math_q7',
        questionText: 'If 3x - 6 = 15, what is the value of x?',
        answers: [
          Answer(id: 'a1', text: '5', isCorrect: false),
          Answer(id: 'a2', text: '6', isCorrect: false),
          Answer(id: 'a3', text: '7', isCorrect: true),
          Answer(id: 'a4', text: '8', isCorrect: false),
        ],
      ),
      Question(
        id: 'math_q8',
        questionText: 'The volume of a cube with a side of 5 cm is...',
        answers: [
          Answer(id: 'a1', text: '75 cm³', isCorrect: false),
          Answer(id: 'a2', text: '100 cm³', isCorrect: false),
          Answer(id: 'a3', text: '125 cm³', isCorrect: true),
          Answer(id: 'a4', text: '150 cm³', isCorrect: false),
        ],
      ),
      Question(
        id: 'math_q9',
        questionText: 'The result of √81 + √64 is...',
        answers: [
          Answer(id: 'a1', text: '15', isCorrect: false),
          Answer(id: 'a2', text: '17', isCorrect: true),
          Answer(id: 'a3', text: '19', isCorrect: false),
          Answer(id: 'a4', text: '21', isCorrect: false),
        ],
      ),
      Question(
        id: 'math_q10',
        questionText: 'The greatest common divisor (GCD) of 24 and 36 is...',
        answers: [
          Answer(id: 'a1', text: '6', isCorrect: false),
          Answer(id: 'a2', text: '8', isCorrect: false),
          Answer(id: 'a3', text: '12', isCorrect: true),
          Answer(id: 'a4', text: '18', isCorrect: false),
        ],
      ),
    ];
  }

  // Flutter Questions
  static List<Question> getFlutterQuestions() {
    return [
      Question(
        id: 'flutter_q1',
        questionText: 'Which widget is used to display text in Flutter?',
        answers: [
          Answer(id: 'a1', text: 'Label', isCorrect: false),
          Answer(id: 'a2', text: 'Text', isCorrect: true),
          Answer(id: 'a3', text: 'TextView', isCorrect: false),
          Answer(id: 'a4', text: 'TextWidget', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q2',
        questionText: 'What is the difference between StatelessWidget and StatefulWidget?',
        answers: [
          Answer(id: 'a1', text: 'No difference', isCorrect: false),
          Answer(
              id: 'a2',
              text: 'StatefulWidget can change its state',
              isCorrect: true),
          Answer(id: 'a3', text: 'StatelessWidget is slower', isCorrect: false),
          Answer(
              id: 'a4',
              text: 'StatefulWidget cannot be updated',
              isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q3',
        questionText: 'Which widget is used to create a button in Flutter?',
        answers: [
          Answer(id: 'a1', text: 'Button', isCorrect: false),
          Answer(id: 'a2', text: 'ElevatedButton', isCorrect: true),
          Answer(id: 'a3', text: 'ClickButton', isCorrect: false),
          Answer(id: 'a4', text: 'PressButton', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q4',
        questionText:
        'Which method is called first when a widget is created?',
        answers: [
          Answer(id: 'a1', text: 'build()', isCorrect: false),
          Answer(id: 'a2', text: 'initState()', isCorrect: true),
          Answer(id: 'a3', text: 'onCreate()', isCorrect: false),
          Answer(id: 'a4', text: 'start()', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q5',
        questionText: 'Which widget is used for horizontal layout?',
        answers: [
          Answer(id: 'a1', text: 'Column', isCorrect: false),
          Answer(id: 'a2', text: 'Row', isCorrect: true),
          Answer(id: 'a3', text: 'Stack', isCorrect: false),
          Answer(id: 'a4', text: 'Container', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q6',
        questionText: 'How do you create a scrollable list in Flutter?',
        answers: [
          Answer(id: 'a1', text: 'ScrollView', isCorrect: false),
          Answer(id: 'a2', text: 'ListView', isCorrect: true),
          Answer(id: 'a3', text: 'ScrollList', isCorrect: false),
          Answer(id: 'a4', text: 'RecyclerView', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q7',
        questionText: 'What is the purpose of setState() in Flutter?',
        answers: [
          Answer(id: 'a1', text: 'To delete state', isCorrect: false),
          Answer(id: 'a2', text: 'To update the UI', isCorrect: true),
          Answer(id: 'a3', text: 'To create a new state', isCorrect: false),
          Answer(id: 'a4', text: 'To save data', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q8',
        questionText: 'Which widget is used to add padding?',
        answers: [
          Answer(id: 'a1', text: 'Margin', isCorrect: false),
          Answer(id: 'a2', text: 'Padding', isCorrect: true),
          Answer(id: 'a3', text: 'Space', isCorrect: false),
          Answer(id: 'a4', text: 'Gap', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q9',
        questionText: 'Which command is used to run a Flutter app?',
        answers: [
          Answer(id: 'a1', text: 'flutter start', isCorrect: false),
          Answer(id: 'a2', text: 'flutter run', isCorrect: true),
          Answer(id: 'a3', text: 'flutter launch', isCorrect: false),
          Answer(id: 'a4', text: 'flutter build', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q10',
        questionText: 'Which widget is used to create a card with shadow?',
        answers: [
          Answer(id: 'a1', text: 'Container', isCorrect: false),
          Answer(id: 'a2', text: 'Card', isCorrect: true),
          Answer(id: 'a3', text: 'Box', isCorrect: false),
          Answer(id: 'a4', text: 'Panel', isCorrect: false),
        ],
      ),
    ];
  }

  // Get questions by category
  static List<Question> getQuestionsByCategory(String category) {
    switch (category.toLowerCase()) {
      case 'dart':
      case 'programming':
        return getDartQuestions();
      case 'flutter':
        return getFlutterQuestions();
      case 'math':
      case 'mathematics':
        return getMathQuestions();
      default:
        return getDartQuestions(); // Default to Dart questions
    }
  }
}
