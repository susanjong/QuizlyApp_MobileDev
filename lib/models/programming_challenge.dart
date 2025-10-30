import 'package:flutter/material.dart';

class ProgrammingChallenge {
  final String title;
  final String level;
  final String questionCount;
  final double progress;
  final Color accentColor;
  final IconData icon;

  ProgrammingChallenge({
    required this.title,
    required this.level,
    required this.questionCount,
    required this.progress,
    required this.accentColor,
    required this.icon,
  });

  // Static list untuk data default
  static List<ProgrammingChallenge> getDefaultChallenges() {
    return [
      ProgrammingChallenge(
        title: 'JavaScript Basics',
        level: 'Beginner',
        questionCount: '24 Soal',
        progress: 0.6,
        accentColor: const Color(0xFFFDD835), // Kuning cerah
        icon: Icons.code,
      ),
      ProgrammingChallenge(
        title: 'Python Data Structures',
        level: 'Intermediate',
        questionCount: '18 Soal',
        progress: 0.4,
        accentColor: const Color(0xFF4CAF50), // Hijau untuk Python
        icon: Icons.terminal,
      ),
      ProgrammingChallenge(
        title: 'React Components',
        level: 'Advanced',
        questionCount: '32 Soal',
        progress: 0.2,
        accentColor: const Color(0xFF61DAFB), // Biru cyan untuk React
        icon: Icons.web,
      ),
    ];
  }
}