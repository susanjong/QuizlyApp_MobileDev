import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/widgets/quiz/quiz_header.dart';
import 'package:quiz_app/widgets/quiz/question_number_bar.dart';
import 'package:quiz_app/widgets/quiz/question_card.dart';
import 'package:quiz_app/widgets/quiz/answer_option_list.dart';
import 'package:quiz_app/widgets/quiz/quiz_bottom_bar.dart';
import 'package:quiz_app/widgets/quiz/doubt_checkbox.dart';

class QuizScreen extends StatefulWidget {
  final String quizTitle;
  final List<Question> questions;

  const QuizScreen({
    super.key,
    required this.quizTitle,
    required this.questions,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  final Map<int, String> _userAnswers = {};
  final Set<int> _answeredQuestions = {};
  final Set<int> _doubtfulQuestions = {};

  Question get _currentQuestion => widget.questions[_currentQuestionIndex];
  int get _currentQuestionNumber => _currentQuestionIndex + 1;

  void _onAnswerSelected(String answerId) {
    setState(() {
      _userAnswers[_currentQuestionNumber] = answerId;
      _answeredQuestions.add(_currentQuestionNumber);
    });
  }

  void _onDoubtChanged(bool isDoubtful) {
    setState(() {
      if (isDoubtful) {
        _doubtfulQuestions.add(_currentQuestionNumber);
      } else {
        _doubtfulQuestions.remove(_currentQuestionNumber);
      }
    });
  }

  void _goToQuestion(int questionNumber) {
    setState(() {
      _currentQuestionIndex = questionNumber - 1;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  void _submitQuiz() {
    final unansweredCount = widget.questions.length - _answeredQuestions.length;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Kumpulkan Quiz?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kamu telah menjawab ${_answeredQuestions.length} dari ${widget.questions.length} soal.',
            ),
            if (unansweredCount > 0) ...[
              const SizedBox(height: 8),
              Text(
                'Masih ada $unansweredCount soal yang belum dijawab.',
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
            if (_doubtfulQuestions.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                'Kamu ragu-ragu pada ${_doubtfulQuestions.length} soal.',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Batal',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Kembali ke home
              // TODO: Navigate to result screen
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF6B35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Kumpulkan',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _onTimeUp() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Row(
          children: [
            Icon(Icons.access_time, color: Colors.red),
            SizedBox(width: 8),
            Text('Waktu Habis!'),
          ],
        ),
        content: const Text(
          'Waktu quiz telah habis. Quiz akan dikumpulkan secara otomatis.',
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Kembali ke home
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF6B35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showSubmitButton() {
     showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tombol Jawaban'),
        content: const Text('Klik tombol di atas untuk melihat semua soal'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          QuizHeader(
            title: widget.quizTitle,
            timeInMinutes: 50,
            onTimeUp: _onTimeUp,
            onBackPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  title: const Text('Keluar Quiz?'),
                  content: const Text(
                    'Progres kamu akan hilang jika keluar sekarang.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Batal'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Keluar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          QuestionNumberBar(
            totalQuestions: widget.questions.length,
            currentQuestion: _currentQuestionNumber,
            answeredQuestions: _answeredQuestions,
            onQuestionTap: _goToQuestion,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  QuestionCard(
                    question: _currentQuestion,
                    questionNumber: _currentQuestionNumber,
                    totalQuestions: widget.questions.length,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AnswerOptionList(
                      answers: _currentQuestion.answers,
                      selectedAnswerId: _userAnswers[_currentQuestionNumber],
                      onAnswerSelected: _onAnswerSelected,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        DoubtCheckbox(
                          isChecked: _doubtfulQuestions.contains(_currentQuestionNumber),
                          onChanged: _onDoubtChanged,
                        ),
                        const Spacer(),
                        TextButton.icon(
                          onPressed: _showSubmitButton,
                          icon: const Icon(Icons.grid_view, size: 20),
                          label: const Text('Jawaban'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: QuizBottomBar(
        isFirstQuestion: _currentQuestionIndex == 0,
        isLastQuestion: _currentQuestionIndex == widget.questions.length - 1,
        hasAnswer: _userAnswers.containsKey(_currentQuestionNumber),
        onPrevious: _previousQuestion,
        onNext: _nextQuestion,
        onSubmit: _submitQuiz,
      ),
    );
  }
}
