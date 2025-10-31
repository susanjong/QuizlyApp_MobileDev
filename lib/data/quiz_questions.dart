import 'package:quiz_app/models/question_model.dart';

class SampleQuestions {
  // Dart Programming Questions
  static List<Question> getDartQuestions() {
    return [
      Question(
        id: 'dart_q1',
        questionText: 'Apa keyword yang digunakan untuk mendeklarasikan variabel yang nilainya tidak bisa diubah di Dart?',
        answers: [
          Answer(id: 'a1', text: 'var', isCorrect: false),
          Answer(id: 'a2', text: 'final', isCorrect: true),
          Answer(id: 'a3', text: 'dynamic', isCorrect: false),
          Answer(id: 'a4', text: 'let', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q2',
        questionText: 'Manakah yang merupakan tipe data primitif di Dart?',
        answers: [
          Answer(id: 'a1', text: 'int', isCorrect: true),
          Answer(id: 'a2', text: 'integer', isCorrect: false),
          Answer(id: 'a3', text: 'number', isCorrect: false),
          Answer(id: 'a4', text: 'float', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q3',
        questionText: 'Bagaimana cara membuat list di Dart?',
        answers: [
          Answer(id: 'a1', text: 'List myList = new List()', isCorrect: false),
          Answer(id: 'a2', text: 'var myList = []', isCorrect: true),
          Answer(id: 'a3', text: 'array myList = []', isCorrect: false),
          Answer(id: 'a4', text: 'list myList = new list()', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q4',
        questionText: 'Apa output dari kode berikut?\n\nvoid main() {\n  print(5 + 3 * 2);\n}',
        answers: [
          Answer(id: 'a1', text: '16', isCorrect: false),
          Answer(id: 'a2', text: '11', isCorrect: true),
          Answer(id: 'a3', text: '13', isCorrect: false),
          Answer(id: 'a4', text: '10', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q5',
        questionText: 'Keyword apa yang digunakan untuk membuat class di Dart?',
        answers: [
          Answer(id: 'a1', text: 'object', isCorrect: false),
          Answer(id: 'a2', text: 'class', isCorrect: true),
          Answer(id: 'a3', text: 'def', isCorrect: false),
          Answer(id: 'a4', text: 'function', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q6',
        questionText: 'Manakah cara yang benar untuk membuat fungsi di Dart?',
        answers: [
          Answer(id: 'a1', text: 'function myFunction() {}', isCorrect: false),
          Answer(id: 'a2', text: 'void myFunction() {}', isCorrect: true),
          Answer(id: 'a3', text: 'def myFunction() {}', isCorrect: false),
          Answer(id: 'a4', text: 'func myFunction() {}', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q7',
        questionText: 'Apa perbedaan antara "final" dan "const" di Dart?',
        answers: [
          Answer(id: 'a1', text: 'Tidak ada perbedaan', isCorrect: false),
          Answer(id: 'a2', text: 'const harus diketahui saat compile time', isCorrect: true),
          Answer(id: 'a3', text: 'final lebih cepat dari const', isCorrect: false),
          Answer(id: 'a4', text: 'const bisa diubah nilainya', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q8',
        questionText: 'Bagaimana cara membuat string interpolation di Dart?',
        answers: [
          Answer(id: 'a1', text: 'print("Hello " + name)', isCorrect: false),
          Answer(id: 'a2', text: 'print("Hello \$name")', isCorrect: true),
          Answer(id: 'a3', text: 'print("Hello #{name}")', isCorrect: false),
          Answer(id: 'a4', text: 'print("Hello %s", name)', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q9',
        questionText: 'Apa keyword untuk mewarisi class di Dart?',
        answers: [
          Answer(id: 'a1', text: 'inherits', isCorrect: false),
          Answer(id: 'a2', text: 'implements', isCorrect: false),
          Answer(id: 'a3', text: 'extends', isCorrect: true),
          Answer(id: 'a4', text: 'inherit', isCorrect: false),
        ],
      ),
      Question(
        id: 'dart_q10',
        questionText: 'Manakah cara yang benar untuk membuat Map di Dart?',
        answers: [
          Answer(id: 'a1', text: 'var map = ()', isCorrect: false),
          Answer(id: 'a2', text: 'var map = {}', isCorrect: true),
          Answer(id: 'a3', text: 'var map = []', isCorrect: false),
          Answer(id: 'a4', text: 'Map map = Map()', isCorrect: false),
        ],
      ),
    ];
  }

  // Math Questions (your original)
  static List<Question> getMathQuestions() {
    return [
      Question(
        id: 'math_q1',
        questionText: 'Berapakah hasil dari 25 × 4?',
        answers: [
          Answer(id: 'a1', text: '90', isCorrect: false),
          Answer(id: 'a2', text: '100', isCorrect: true),
          Answer(id: 'a3', text: '110', isCorrect: false),
          Answer(id: 'a4', text: '120', isCorrect: false),
        ],
      ),
      Question(
        id: 'math_q2',
        questionText: 'Jika x + 5 = 12, maka nilai x adalah...',
        answers: [
          Answer(id: 'a1', text: '5', isCorrect: false),
          Answer(id: 'a2', text: '6', isCorrect: false),
          Answer(id: 'a3', text: '7', isCorrect: true),
          Answer(id: 'a4', text: '8', isCorrect: false),
        ],
      ),
      Question(
        id: 'math_q3',
        questionText: 'Luas persegi dengan sisi 8 cm adalah...',
        answers: [
          Answer(id: 'a1', text: '32 cm²', isCorrect: false),
          Answer(id: 'a2', text: '48 cm²', isCorrect: false),
          Answer(id: 'a3', text: '56 cm²', isCorrect: false),
          Answer(id: 'a4', text: '64 cm²', isCorrect: true),
        ],
      ),
      Question(
        id: 'math_q4',
        questionText: 'Berapakah 15% dari 200?',
        answers: [
          Answer(id: 'a1', text: '20', isCorrect: false),
          Answer(id: 'a2', text: '25', isCorrect: false),
          Answer(id: 'a3', text: '30', isCorrect: true),
          Answer(id: 'a4', text: '35', isCorrect: false),
        ],
      ),
      Question(
        id: 'math_q5',
        questionText: 'Hasil dari 144 ÷ 12 adalah...',
        answers: [
          Answer(id: 'a1', text: '10', isCorrect: false),
          Answer(id: 'a2', text: '11', isCorrect: false),
          Answer(id: 'a3', text: '12', isCorrect: true),
          Answer(id: 'a4', text: '13', isCorrect: false),
        ],
      ),
      Question(
        id: 'math_q6',
        questionText: 'Keliling lingkaran dengan diameter 14 cm adalah... (π = 22/7)',
        answers: [
          Answer(id: 'a1', text: '38 cm', isCorrect: false),
          Answer(id: 'a2', text: '42 cm', isCorrect: false),
          Answer(id: 'a3', text: '44 cm', isCorrect: true),
          Answer(id: 'a4', text: '48 cm', isCorrect: false),
        ],
      ),
      Question(
        id: 'math_q7',
        questionText: 'Jika 3x - 6 = 15, maka nilai x adalah...',
        answers: [
          Answer(id: 'a1', text: '5', isCorrect: false),
          Answer(id: 'a2', text: '6', isCorrect: false),
          Answer(id: 'a3', text: '7', isCorrect: true),
          Answer(id: 'a4', text: '8', isCorrect: false),
        ],
      ),
      Question(
        id: 'math_q8',
        questionText: 'Volume kubus dengan rusuk 5 cm adalah...',
        answers: [
          Answer(id: 'a1', text: '75 cm³', isCorrect: false),
          Answer(id: 'a2', text: '100 cm³', isCorrect: false),
          Answer(id: 'a3', text: '125 cm³', isCorrect: true),
          Answer(id: 'a4', text: '150 cm³', isCorrect: false),
        ],
      ),
      Question(
        id: 'math_q9',
        questionText: 'Hasil dari √81 + √64 adalah...',
        answers: [
          Answer(id: 'a1', text: '15', isCorrect: false),
          Answer(id: 'a2', text: '17', isCorrect: true),
          Answer(id: 'a3', text: '19', isCorrect: false),
          Answer(id: 'a4', text: '21', isCorrect: false),
        ],
      ),
      Question(
        id: 'math_q10',
        questionText: 'FPB dari 24 dan 36 adalah...',
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
        questionText: 'Widget apa yang digunakan untuk membuat teks di Flutter?',
        answers: [
          Answer(id: 'a1', text: 'Label', isCorrect: false),
          Answer(id: 'a2', text: 'Text', isCorrect: true),
          Answer(id: 'a3', text: 'TextView', isCorrect: false),
          Answer(id: 'a4', text: 'TextWidget', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q2',
        questionText: 'Apa perbedaan StatelessWidget dan StatefulWidget?',
        answers: [
          Answer(id: 'a1', text: 'Tidak ada perbedaan', isCorrect: false),
          Answer(id: 'a2', text: 'StatefulWidget bisa berubah state-nya', isCorrect: true),
          Answer(id: 'a3', text: 'StatelessWidget lebih lambat', isCorrect: false),
          Answer(id: 'a4', text: 'StatefulWidget tidak bisa di-update', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q3',
        questionText: 'Widget apa yang digunakan untuk membuat tombol di Flutter?',
        answers: [
          Answer(id: 'a1', text: 'Button', isCorrect: false),
          Answer(id: 'a2', text: 'ElevatedButton', isCorrect: true),
          Answer(id: 'a3', text: 'ClickButton', isCorrect: false),
          Answer(id: 'a4', text: 'PressButton', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q4',
        questionText: 'Method apa yang dipanggil pertama kali saat widget dibuat?',
        answers: [
          Answer(id: 'a1', text: 'build()', isCorrect: false),
          Answer(id: 'a2', text: 'initState()', isCorrect: true),
          Answer(id: 'a3', text: 'onCreate()', isCorrect: false),
          Answer(id: 'a4', text: 'start()', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q5',
        questionText: 'Widget apa yang digunakan untuk layout horizontal?',
        answers: [
          Answer(id: 'a1', text: 'Column', isCorrect: false),
          Answer(id: 'a2', text: 'Row', isCorrect: true),
          Answer(id: 'a3', text: 'Stack', isCorrect: false),
          Answer(id: 'a4', text: 'Container', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q6',
        questionText: 'Bagaimana cara membuat list yang bisa di-scroll di Flutter?',
        answers: [
          Answer(id: 'a1', text: 'ScrollView', isCorrect: false),
          Answer(id: 'a2', text: 'ListView', isCorrect: true),
          Answer(id: 'a3', text: 'ScrollList', isCorrect: false),
          Answer(id: 'a4', text: 'RecyclerView', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q7',
        questionText: 'Apa fungsi setState() di Flutter?',
        answers: [
          Answer(id: 'a1', text: 'Menghapus state', isCorrect: false),
          Answer(id: 'a2', text: 'Memperbarui UI', isCorrect: true),
          Answer(id: 'a3', text: 'Membuat state baru', isCorrect: false),
          Answer(id: 'a4', text: 'Menyimpan data', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q8',
        questionText: 'Widget apa yang digunakan untuk membuat padding?',
        answers: [
          Answer(id: 'a1', text: 'Margin', isCorrect: false),
          Answer(id: 'a2', text: 'Padding', isCorrect: true),
          Answer(id: 'a3', text: 'Space', isCorrect: false),
          Answer(id: 'a4', text: 'Gap', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q9',
        questionText: 'Apa perintah untuk menjalankan aplikasi Flutter?',
        answers: [
          Answer(id: 'a1', text: 'flutter start', isCorrect: false),
          Answer(id: 'a2', text: 'flutter run', isCorrect: true),
          Answer(id: 'a3', text: 'flutter launch', isCorrect: false),
          Answer(id: 'a4', text: 'flutter build', isCorrect: false),
        ],
      ),
      Question(
        id: 'flutter_q10',
        questionText: 'Widget apa yang digunakan untuk membuat card dengan shadow?',
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
      case 'matematika':
        return getMathQuestions();
      default:
        return getDartQuestions(); // Default to Dart questions
    }
  }
}