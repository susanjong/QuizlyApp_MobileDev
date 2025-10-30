import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/widgets/quiz/quiz_header.dart';
import 'package:quiz_app/widgets/quiz/question_number_bar.dart';
import 'package:quiz_app/widgets/quiz/question_card.dart';
import 'package:quiz_app/widgets/quiz/answer_option_list.dart';
import 'package:quiz_app/widgets/quiz/quiz_bottom_bar.dart';
import 'package:quiz_app/widgets/quiz/doubt_checkbox.dart';
import 'package:quiz_app/widgets/darkmode_theme.dart';

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
  final ThemeProvider _themeProvider = ThemeProvider();

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
        backgroundColor: _themeProvider.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Kumpulkan Quiz?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _themeProvider.primaryTextColor,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kamu telah menjawab ${_answeredQuestions.length} dari ${widget.questions.length} soal.',
              style: TextStyle(color: _themeProvider.primaryTextColor),
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
            child: Text(
              'Batal',
              style: TextStyle(color: _themeProvider.secondaryTextColor),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF84A1),
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
        backgroundColor: _themeProvider.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            const Icon(Icons.access_time, color: Colors.red),
            const SizedBox(width: 8),
            Text(
              'Waktu Habis!',
              style: TextStyle(color: _themeProvider.primaryTextColor),
            ),
          ],
        ),
        content: Text(
          'Waktu quiz telah habis. Quiz akan dikumpulkan secara otomatis.',
          style: TextStyle(color: _themeProvider.primaryTextColor),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
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
        backgroundColor: _themeProvider.cardColor,
        title: Text(
          'Tombol Jawaban',
          style: TextStyle(color: _themeProvider.primaryTextColor),
        ),
        content: Text(
          'Klik tombol di atas untuk melihat semua soal',
          style: TextStyle(color: _themeProvider.primaryTextColor),
        ),
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
    return ListenableBuilder(
      listenable: _themeProvider,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: _themeProvider.backgroundColor,
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
                      backgroundColor: _themeProvider.cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      title: Text(
                        'Keluar Quiz?',
                        style: TextStyle(
                          color: _themeProvider.primaryTextColor,
                        ),
                      ),
                      content: Text(
                        'Progres kamu akan hilang jika keluar sekarang.',
                        style: TextStyle(
                          color: _themeProvider.primaryTextColor,
                        ),
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
                doubtfulQuestions: _doubtfulQuestions,
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
                              isChecked: _doubtfulQuestions
                                  .contains(_currentQuestionNumber),
                              onChanged: _onDoubtChanged,
                            ),
                            const Spacer(),
                            TextButton.icon(
                              onPressed: _showSubmitButton,
                              icon: const Icon(Icons.grid_view, size: 20),
                              label: const Text('Jawaban'),
                              style: TextButton.styleFrom(
                                foregroundColor: _themeProvider.secondaryTextColor,
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
      },
    );
  }
}