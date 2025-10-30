import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';

class QuizResult {
  final int totalQuestions;
  final int correctAnswers;
  final int wrongAnswers;
  final int unanswered;
  final int doubtfulAnswers;
  final List<Question> questions;
  final Map<int, String> userAnswers;
  final Set<int> doubtfulQuestions;

  QuizResult({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.unanswered,
    required this.doubtfulAnswers,
    required this.questions,
    required this.userAnswers,
    required this.doubtfulQuestions,
  });

  double get score => (correctAnswers / totalQuestions) * 100;

  String get grade {
    if (score >= 90) return 'A';
    if (score >= 80) return 'B';
    if (score >= 70) return 'C';
    if (score >= 60) return 'D';
    return 'E';
  }

  String get feedback {
    if (score >= 90) return 'Sempurna! Pertahankan!';
    if (score >= 80) return 'Bagus Sekali!';
    if (score >= 70) return 'Cukup Baik!';
    if (score >= 60) return 'Perlu Lebih Giat!';
    return 'Ayo Semangat!';
  }

  Color get gradeColor {
    if (score >= 90) return const Color(0xFF4CAF50); // Hijau
    if (score >= 80) return const Color(0xFF2196F3); // Biru
    if (score >= 70) return const Color(0xFFFFC107); // Kuning
    if (score >= 60) return const Color(0xFFFF9800); // Oranye
    return const Color(0xFFF44336); // Merah
  }
}
