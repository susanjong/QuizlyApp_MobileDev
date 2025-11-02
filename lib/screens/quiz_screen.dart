import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/widgets/quiz/quiz_header.dart';
import 'package:quiz_app/widgets/quiz/question_number_bar.dart';
import 'package:quiz_app/widgets/quiz/question_card.dart';
import 'package:quiz_app/widgets/quiz/answer_option_list.dart';
import 'package:quiz_app/widgets/quiz/quiz_bottom_bar.dart';
import 'package:quiz_app/widgets/quiz/doubt_checkbox.dart';
import 'package:quiz_app/widgets/darkmode_theme.dart';
import 'package:quiz_app/routes/app_routes.dart';

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
          'Submit Quiz?',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            color: _themeProvider.primaryTextColor,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You have answered ${_answeredQuestions.length} out of ${widget.questions.length} questions.',
              style: GoogleFonts.montserrat(
                color: _themeProvider.primaryTextColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            if (unansweredCount > 0) ...[
              const SizedBox(height: 8),
              Text(
                'There are still $unansweredCount questions unanswered.',
                style: GoogleFonts.montserrat(
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
            if (_doubtfulQuestions.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                'You are doubtful about ${_doubtfulQuestions.length} questions.',
                style: GoogleFonts.montserrat(
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
              'Cancel',
              style: GoogleFonts.montserrat(
                color: _themeProvider.secondaryTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _calculateAndNavigateToResult();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xCC355F3B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Submit',
              style: GoogleFonts.montserrat(
                color: const Color(0xFFFFFCCF),
                fontWeight: FontWeight.w600,
              ),
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
              'Time\'s Up!',
              style: GoogleFonts.montserrat(
                color: _themeProvider.primaryTextColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        content: Text(
          'Quiz time has expired. The quiz will be submitted automatically.',
          style: GoogleFonts.montserrat(
            color: _themeProvider.primaryTextColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _calculateAndNavigateToResult();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF6B35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'View Results',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _calculateAndNavigateToResult() {
    int correctAnswers = 0;

    for (int i = 0; i < widget.questions.length; i++) {
      final questionNumber = i + 1;
      final userAnswerId = _userAnswers[questionNumber];

      if (userAnswerId != null) {
        final question = widget.questions[i];
        final isCorrect = question.answers.any(
              (answer) => answer.id == userAnswerId && answer.isCorrect,
        );

        if (isCorrect) {
          correctAnswers++;
        }
      }
    }

    AppRoutes.navigateToResult(
      context,
      score: correctAnswers,
      totalQuestions: widget.questions.length,
      quizTitle: widget.quizTitle,
      questions: widget.questions,
      userAnswers: _userAnswers,
      doubtfulQuestions: _doubtfulQuestions,
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
                        'Exit Quiz?',
                        style: GoogleFonts.montserrat(
                          color: _themeProvider.primaryTextColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      content: Text(
                        'Your progress will be lost if you exit now.',
                        style: GoogleFonts.montserrat(
                          color: _themeProvider.primaryTextColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.montserrat(
                              color: _themeProvider.secondaryTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Exit',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
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
                              onPressed: _submitQuiz,
                              icon: const Icon(Icons.check_circle, size: 20),
                              label: Text(
                                'Submit',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
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