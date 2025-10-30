import 'package:flutter/material.dart';

class QuestionNumberBar extends StatelessWidget {
  final int totalQuestions;
  final int currentQuestion;
  final Set<int> answeredQuestions;
  final Set<int> doubtfulQuestions; // Tambahkan parameter ini
  final Function(int) onQuestionTap;

  const QuestionNumberBar({
    super.key,
    required this.totalQuestions,
    required this.currentQuestion,
    required this.answeredQuestions,
    required this.doubtfulQuestions, // Tambahkan parameter ini
    required this.onQuestionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: totalQuestions,
        itemBuilder: (context, index) {
          final questionNumber = index + 1;
          final isAnswered = answeredQuestions.contains(questionNumber);
          final isCurrent = currentQuestion == questionNumber;
          final isDoubtful = doubtfulQuestions.contains(questionNumber); // Cek apakah ragu-ragu

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: _QuestionNumberChip(
              number: questionNumber,
              isAnswered: isAnswered,
              isCurrent: isCurrent,
              isDoubtful: isDoubtful, // Pass ke chip
              onTap: () => onQuestionTap(questionNumber),
            ),
          );
        },
      ),
    );
  }
}

class _QuestionNumberChip extends StatelessWidget {
  final int number;
  final bool isAnswered;
  final bool isCurrent;
  final bool isDoubtful; // Tambahkan parameter ini
  final VoidCallback onTap;

  const _QuestionNumberChip({
    required this.number,
    required this.isAnswered,
    required this.isCurrent,
    required this.isDoubtful, // Tambahkan parameter ini
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    if (isCurrent) {
      backgroundColor = const Color(0xFFFF6B35);
      textColor = Colors.white;
    } else if (isDoubtful) {
      // Prioritaskan warna orange untuk soal yang ditandai ragu-ragu
      backgroundColor = Colors.orange;
      textColor = Colors.white;
    } else if (isAnswered) {
      backgroundColor = Colors.blue.shade100;
      textColor = Colors.blue.shade700;
    } else {
      backgroundColor = Colors.grey.shade200;
      textColor = Colors.grey.shade700;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '$number',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}