import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/widgets/darkmode_theme.dart';

class QuizReviewScreen extends StatelessWidget {
  final String quizTitle;
  final List<Question> questions;
  final Map<int, String> userAnswers;
  final Set<int> doubtfulQuestions;

  const QuizReviewScreen({
    super.key,
    required this.quizTitle,
    required this.questions,
    required this.userAnswers,
    required this.doubtfulQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider();

    return ListenableBuilder(
      listenable: themeProvider,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: themeProvider.isDarkMode
              ? const Color(0xFF0F0F1E)
              : Colors.grey.shade50,
          appBar: AppBar(
            backgroundColor: themeProvider.isDarkMode
                ? const Color(0xFF1A1A2E)
                : const Color(0xCC355F3B),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Review Answers',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: questions.length,
            itemBuilder: (context, index) {
              final question = questions[index];
              final userAnswerId = userAnswers[index];
              final isDoubtful = doubtfulQuestions.contains(index);

              // Find user's answer and correct answer
              Answer? userAnswer;
              Answer? correctAnswer;

              for (var answer in question.answers) {
                if (answer.id == userAnswerId) {
                  userAnswer = answer;
                }
                if (answer.isCorrect) {
                  correctAnswer = answer;
                }
              }

              final isCorrect = userAnswer?.isCorrect ?? false;
              final isUnanswered = userAnswer == null;

              return _QuestionReviewCard(
                questionNumber: index + 1,
                question: question,
                userAnswer: userAnswer,
                correctAnswer: correctAnswer,
                isCorrect: isCorrect,
                isUnanswered: isUnanswered,
                isDoubtful: isDoubtful,
                themeProvider: themeProvider,
              );
            },
          ),
        );
      },
    );
  }
}

class _QuestionReviewCard extends StatelessWidget {
  final int questionNumber;
  final Question question;
  final Answer? userAnswer;
  final Answer? correctAnswer;
  final bool isCorrect;
  final bool isUnanswered;
  final bool isDoubtful;
  final ThemeProvider themeProvider;

  const _QuestionReviewCard({
    required this.questionNumber,
    required this.question,
    required this.userAnswer,
    required this.correctAnswer,
    required this.isCorrect,
    required this.isUnanswered,
    required this.isDoubtful,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    IconData statusIcon;
    String statusText;

    if (isUnanswered) {
      statusColor = const Color(0xFF9E9E9E);
      statusIcon = Icons.help_outline;
      statusText = 'Not Answered';
    } else if (isCorrect) {
      statusColor = const Color(0xFF4CAF50);
      statusIcon = Icons.check_circle;
      statusText = 'Correct';
    } else {
      statusColor = const Color(0xFFF44336);
      statusIcon = Icons.cancel;
      statusText = 'Wrong';
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themeProvider.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: themeProvider.getCardShadow(),
        border: Border.all(
          color: statusColor.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Question $questionNumber',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
              ),
              const Spacer(),
              Icon(statusIcon, color: statusColor, size: 24),
              const SizedBox(width: 4),
              Text(
                statusText,
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: statusColor,
                ),
              ),
              if (isDoubtful) ...[
                const SizedBox(width: 8),
                Icon(
                  Icons.warning_amber,
                  color: const Color(0xFFFF9800),
                  size: 20,
                ),
              ],
            ],
          ),
          const SizedBox(height: 12),

          // Question Text
          Text(
            question.questionText,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: themeProvider.primaryTextColor,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),

          // All Answer Options
          ...question.answers.map((answer) {
            final isUserAnswer = answer.id == userAnswer?.id;
            final isCorrectAnswer = answer.isCorrect;

            Color backgroundColor;
            Color borderColor;
            Color textColor;
            IconData? icon;

            if (isCorrectAnswer) {
              backgroundColor = const Color(0xFF4CAF50).withOpacity(0.1);
              borderColor = const Color(0xFF4CAF50);
              textColor = const Color(0xFF4CAF50);
              icon = Icons.check_circle;
            } else if (isUserAnswer && !isCorrect) {
              backgroundColor = const Color(0xFFF44336).withOpacity(0.1);
              borderColor = const Color(0xFFF44336);
              textColor = const Color(0xFFF44336);
              icon = Icons.cancel;
            } else {
              backgroundColor = Colors.transparent;
              borderColor = themeProvider.primaryTextColor.withOpacity(0.2);
              textColor = themeProvider.secondaryTextColor;
              icon = null;
            }

            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor, width: 2),
              ),
              child: Row(
                children: [
                  if (icon != null) ...[
                    Icon(icon, color: textColor, size: 20),
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: Text(
                      answer.text,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: icon != null ? textColor : themeProvider.primaryTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),

          // Answer Status Summary
          if (!isUnanswered) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: themeProvider.isDarkMode
                    ? Colors.white.withOpacity(0.05)
                    : Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isCorrect) ...[
                    Row(
                      children: [
                        Icon(
                          Icons.cancel,
                          color: const Color(0xFFF44336),
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Your answer: ',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: themeProvider.secondaryTextColor,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            userAnswer?.text ?? '',
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFF44336),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                  ],
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: const Color(0xFF4CAF50),
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Correct answer: ',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: themeProvider.secondaryTextColor,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          correctAnswer?.text ?? '',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF4CAF50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],

          if (isUnanswered) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF9E9E9E).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: const Color(0xFF9E9E9E),
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'You did not answer this question',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: themeProvider.secondaryTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}