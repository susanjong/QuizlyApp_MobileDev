import 'package:quiz_app/models/question_model.dart';

class SampleQuestions {
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

  // History Questions
  static List<Question> getHistoryQuestions() {
    return [
      Question(
        id: 'history_q1',
        questionText: 'In which year did World War II end?',
        answers: [
          Answer(id: 'a1', text: '1943', isCorrect: false),
          Answer(id: 'a2', text: '1944', isCorrect: false),
          Answer(id: 'a3', text: '1945', isCorrect: true),
          Answer(id: 'a4', text: '1946', isCorrect: false),
        ],
      ),
      Question(
        id: 'history_q2',
        questionText: 'Who was the first president of the United States?',
        answers: [
          Answer(id: 'a1', text: 'Thomas Jefferson', isCorrect: false),
          Answer(id: 'a2', text: 'George Washington', isCorrect: true),
          Answer(id: 'a3', text: 'Abraham Lincoln', isCorrect: false),
          Answer(id: 'a4', text: 'John Adams', isCorrect: false),
        ],
      ),
      Question(
        id: 'history_q3',
        questionText: 'The Renaissance period began in which country?',
        answers: [
          Answer(id: 'a1', text: 'France', isCorrect: false),
          Answer(id: 'a2', text: 'Spain', isCorrect: false),
          Answer(id: 'a3', text: 'Italy', isCorrect: true),
          Answer(id: 'a4', text: 'England', isCorrect: false),
        ],
      ),
      Question(
        id: 'history_q4',
        questionText: 'Who invented the printing press?',
        answers: [
          Answer(id: 'a1', text: 'Leonardo da Vinci', isCorrect: false),
          Answer(id: 'a2', text: 'Johannes Gutenberg', isCorrect: true),
          Answer(id: 'a3', text: 'Isaac Newton', isCorrect: false),
          Answer(id: 'a4', text: 'Benjamin Franklin', isCorrect: false),
        ],
      ),
      Question(
        id: 'history_q5',
        questionText: 'The Great Wall of China was built to protect against invasions from which direction?',
        answers: [
          Answer(id: 'a1', text: 'South', isCorrect: false),
          Answer(id: 'a2', text: 'North', isCorrect: true),
          Answer(id: 'a3', text: 'East', isCorrect: false),
          Answer(id: 'a4', text: 'West', isCorrect: false),
        ],
      ),
      Question(
        id: 'history_q6',
        questionText: 'Which ancient civilization built the pyramids?',
        answers: [
          Answer(id: 'a1', text: 'Greeks', isCorrect: false),
          Answer(id: 'a2', text: 'Romans', isCorrect: false),
          Answer(id: 'a3', text: 'Egyptians', isCorrect: true),
          Answer(id: 'a4', text: 'Persians', isCorrect: false),
        ],
      ),
      Question(
        id: 'history_q7',
        questionText: 'The Industrial Revolution started in which century?',
        answers: [
          Answer(id: 'a1', text: '16th century', isCorrect: false),
          Answer(id: 'a2', text: '17th century', isCorrect: false),
          Answer(id: 'a3', text: '18th century', isCorrect: true),
          Answer(id: 'a4', text: '19th century', isCorrect: false),
        ],
      ),
      Question(
        id: 'history_q8',
        questionText: 'Who was the leader of the Soviet Union during World War II?',
        answers: [
          Answer(id: 'a1', text: 'Lenin', isCorrect: false),
          Answer(id: 'a2', text: 'Stalin', isCorrect: true),
          Answer(id: 'a3', text: 'Khrushchev', isCorrect: false),
          Answer(id: 'a4', text: 'Gorbachev', isCorrect: false),
        ],
      ),
      Question(
        id: 'history_q9',
        questionText: 'The fall of the Berlin Wall occurred in which year?',
        answers: [
          Answer(id: 'a1', text: '1987', isCorrect: false),
          Answer(id: 'a2', text: '1988', isCorrect: false),
          Answer(id: 'a3', text: '1989', isCorrect: true),
          Answer(id: 'a4', text: '1990', isCorrect: false),
        ],
      ),
      Question(
        id: 'history_q10',
        questionText: 'Which empire was ruled by Julius Caesar?',
        answers: [
          Answer(id: 'a1', text: 'Greek Empire', isCorrect: false),
          Answer(id: 'a2', text: 'Roman Empire', isCorrect: true),
          Answer(id: 'a3', text: 'Ottoman Empire', isCorrect: false),
          Answer(id: 'a4', text: 'British Empire', isCorrect: false),
        ],
      ),
    ];
  }

  // Music Questions
  static List<Question> getMusicQuestions() {
    return [
      Question(
        id: 'music_q1',
        questionText: 'How many strings does a standard guitar have?',
        answers: [
          Answer(id: 'a1', text: '4', isCorrect: false),
          Answer(id: 'a2', text: '5', isCorrect: false),
          Answer(id: 'a3', text: '6', isCorrect: true),
          Answer(id: 'a4', text: '7', isCorrect: false),
        ],
      ),
      Question(
        id: 'music_q2',
        questionText: 'Which note comes after G in the musical scale?',
        answers: [
          Answer(id: 'a1', text: 'H', isCorrect: false),
          Answer(id: 'a2', text: 'A', isCorrect: true),
          Answer(id: 'a3', text: 'F', isCorrect: false),
          Answer(id: 'a4', text: 'B', isCorrect: false),
        ],
      ),
      Question(
        id: 'music_q3',
        questionText: 'What is the name of the five lines on which music is written?',
        answers: [
          Answer(id: 'a1', text: 'Music sheet', isCorrect: false),
          Answer(id: 'a2', text: 'Staff', isCorrect: true),
          Answer(id: 'a3', text: 'Scale', isCorrect: false),
          Answer(id: 'a4', text: 'Ledger', isCorrect: false),
        ],
      ),
      Question(
        id: 'music_q4',
        questionText: 'Which of these is a percussion instrument?',
        answers: [
          Answer(id: 'a1', text: 'Violin', isCorrect: false),
          Answer(id: 'a2', text: 'Flute', isCorrect: false),
          Answer(id: 'a3', text: 'Drums', isCorrect: true),
          Answer(id: 'a4', text: 'Guitar', isCorrect: false),
        ],
      ),
      Question(
        id: 'music_q5',
        questionText: 'What is the term for gradually getting louder in music?',
        answers: [
          Answer(id: 'a1', text: 'Diminuendo', isCorrect: false),
          Answer(id: 'a2', text: 'Crescendo', isCorrect: true),
          Answer(id: 'a3', text: 'Forte', isCorrect: false),
          Answer(id: 'a4', text: 'Piano', isCorrect: false),
        ],
      ),
      Question(
        id: 'music_q6',
        questionText: 'Who composed the famous "Moonlight Sonata"?',
        answers: [
          Answer(id: 'a1', text: 'Mozart', isCorrect: false),
          Answer(id: 'a2', text: 'Beethoven', isCorrect: true),
          Answer(id: 'a3', text: 'Bach', isCorrect: false),
          Answer(id: 'a4', text: 'Chopin', isCorrect: false),
        ],
      ),
      Question(
        id: 'music_q7',
        questionText: 'What is the highest female singing voice?',
        answers: [
          Answer(id: 'a1', text: 'Alto', isCorrect: false),
          Answer(id: 'a2', text: 'Soprano', isCorrect: true),
          Answer(id: 'a3', text: 'Mezzo', isCorrect: false),
          Answer(id: 'a4', text: 'Contralto', isCorrect: false),
        ],
      ),
      Question(
        id: 'music_q8',
        questionText: 'How many keys does a standard piano have?',
        answers: [
          Answer(id: 'a1', text: '76', isCorrect: false),
          Answer(id: 'a2', text: '82', isCorrect: false),
          Answer(id: 'a3', text: '88', isCorrect: true),
          Answer(id: 'a4', text: '92', isCorrect: false),
        ],
      ),
      Question(
        id: 'music_q9',
        questionText: 'What genre of music did Elvis Presley primarily perform?',
        answers: [
          Answer(id: 'a1', text: 'Jazz', isCorrect: false),
          Answer(id: 'a2', text: 'Rock and Roll', isCorrect: true),
          Answer(id: 'a3', text: 'Classical', isCorrect: false),
          Answer(id: 'a4', text: 'Hip Hop', isCorrect: false),
        ],
      ),
      Question(
        id: 'music_q10',
        questionText: 'What is a group of four musicians called?',
        answers: [
          Answer(id: 'a1', text: 'Trio', isCorrect: false),
          Answer(id: 'a2', text: 'Quartet', isCorrect: true),
          Answer(id: 'a3', text: 'Quintet', isCorrect: false),
          Answer(id: 'a4', text: 'Orchestra', isCorrect: false),
        ],
      ),
    ];
  }

  // Education Questions
  static List<Question> getEducationQuestions() {
    return [
      Question(
        id: 'edu_q1',
        questionText: 'What is the primary purpose of assessment in education?',
        answers: [
          Answer(id: 'a1', text: 'To punish students', isCorrect: false),
          Answer(id: 'a2', text: 'To measure learning progress', isCorrect: true),
          Answer(id: 'a3', text: 'To rank students', isCorrect: false),
          Answer(id: 'a4', text: 'To fill time', isCorrect: false),
        ],
      ),
      Question(
        id: 'edu_q2',
        questionText: 'Which learning theory emphasizes learning through observation?',
        answers: [
          Answer(id: 'a1', text: 'Behaviorism', isCorrect: false),
          Answer(id: 'a2', text: 'Constructivism', isCorrect: false),
          Answer(id: 'a3', text: 'Social Learning Theory', isCorrect: true),
          Answer(id: 'a4', text: 'Cognitivism', isCorrect: false),
        ],
      ),
      Question(
        id: 'edu_q3',
        questionText: 'What does the acronym STEM stand for in education?',
        answers: [
          Answer(id: 'a1', text: 'Science, Technology, Engineering, Math', isCorrect: true),
          Answer(id: 'a2', text: 'Study, Test, Evaluate, Measure', isCorrect: false),
          Answer(id: 'a3', text: 'Student Teaching Education Method', isCorrect: false),
          Answer(id: 'a4', text: 'Standard Teaching Evaluation Model', isCorrect: false),
        ],
      ),
      Question(
        id: 'edu_q4',
        questionText: 'Which teaching method involves students teaching each other?',
        answers: [
          Answer(id: 'a1', text: 'Lecture', isCorrect: false),
          Answer(id: 'a2', text: 'Peer teaching', isCorrect: true),
          Answer(id: 'a3', text: 'Direct instruction', isCorrect: false),
          Answer(id: 'a4', text: 'Independent study', isCorrect: false),
        ],
      ),
      Question(
        id: 'edu_q5',
        questionText: 'What is formative assessment?',
        answers: [
          Answer(id: 'a1', text: 'Final exam only', isCorrect: false),
          Answer(id: 'a2', text: 'Ongoing assessment during learning', isCorrect: true),
          Answer(id: 'a3', text: 'Standardized testing', isCorrect: false),
          Answer(id: 'a4', text: 'Admission test', isCorrect: false),
        ],
      ),
      Question(
        id: 'edu_q6',
        questionText: 'Who developed the theory of multiple intelligences?',
        answers: [
          Answer(id: 'a1', text: 'Jean Piaget', isCorrect: false),
          Answer(id: 'a2', text: 'Howard Gardner', isCorrect: true),
          Answer(id: 'a3', text: 'Lev Vygotsky', isCorrect: false),
          Answer(id: 'a4', text: 'B.F. Skinner', isCorrect: false),
        ],
      ),
      Question(
        id: 'edu_q7',
        questionText: 'What is differentiated instruction?',
        answers: [
          Answer(id: 'a1', text: 'Teaching all students the same way', isCorrect: false),
          Answer(id: 'a2', text: 'Adapting teaching to meet diverse needs', isCorrect: true),
          Answer(id: 'a3', text: 'Separating students by ability', isCorrect: false),
          Answer(id: 'a4', text: 'Using only technology', isCorrect: false),
        ],
      ),
      Question(
        id: 'edu_q8',
        questionText: 'What does scaffolding mean in education?',
        answers: [
          Answer(id: 'a1', text: 'Building a school', isCorrect: false),
          Answer(id: 'a2', text: 'Providing temporary support for learning', isCorrect: true),
          Answer(id: 'a3', text: 'Creating lesson plans', isCorrect: false),
          Answer(id: 'a4', text: 'Grading homework', isCorrect: false),
        ],
      ),
      Question(
        id: 'edu_q9',
        questionText: 'What is cooperative learning?',
        answers: [
          Answer(id: 'a1', text: 'Students working alone', isCorrect: false),
          Answer(id: 'a2', text: 'Students working in groups', isCorrect: true),
          Answer(id: 'a3', text: 'Teacher lecturing', isCorrect: false),
          Answer(id: 'a4', text: 'Online learning only', isCorrect: false),
        ],
      ),
      Question(
        id: 'edu_q10',
        questionText: 'What is the flipped classroom model?',
        answers: [
          Answer(id: 'a1', text: 'Traditional lecture in class', isCorrect: false),
          Answer(id: 'a2', text: 'Content at home, activities in class', isCorrect: true),
          Answer(id: 'a3', text: 'No homework ever', isCorrect: false),
          Answer(id: 'a4', text: 'Only group projects', isCorrect: false),
        ],
      ),
    ];
  }

  // Math Questions (tetap ada untuk backward compatibility)
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

  // Flutter Questions (tetap ada untuk backward compatibility)
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
      case 'programming':
      case 'dart':
        return getDartQuestions();
      case 'history':
        return getHistoryQuestions();
      case 'music':
        return getMusicQuestions();
      case 'education':
        return getEducationQuestions();
      case 'flutter':
        return getFlutterQuestions();
      case 'math':
      case 'mathematics':
        return getMathQuestions();
      default:
        return getDartQuestions();
    }
  }

  // Get category icon
  static String getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'programming':
      case 'dart':
        return '💻';
      case 'history':
        return '📚';
      case 'music':
        return '🎵';
      case 'education':
        return '🎓';
      case 'flutter':
        return '📱';
      case 'math':
      case 'mathematics':
        return '🔢';
      default:
        return '📝';
    }
  }

  // Get total questions count by category
  static int getQuestionCount(String category) {
    return getQuestionsByCategory(category).length;
  }
}