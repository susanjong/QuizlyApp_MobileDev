import 'package:flutter/material.dart';

class EducationLevel {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color startColor;
  final Color endColor;
  final String quizCount;

  EducationLevel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.startColor,
    required this.endColor,
    required this.quizCount,
  });

  // Static list untuk data default
  static List<EducationLevel> getDefaultLevels() {
    return [
      EducationLevel(
        title: 'SD',
        subtitle: 'Dasar',
        icon: Icons.school,
        startColor: const Color(0xFFFFBBBE),
        endColor: const Color(0xFFFFBBBE),
        quizCount: '120 Quiz',
      ),
      EducationLevel(
        title: 'SMP',
        subtitle: 'Menengah',
        icon: Icons.menu_book,
        startColor: const Color(0xFFCBE3B3),
        endColor: const Color(0xFFCBE3B3),
        quizCount: '98 Quiz',
      ),
      EducationLevel(
        title: 'SMA',
        subtitle: 'Lanjutan',
        icon: Icons.auto_stories,
        startColor: const Color(0xFFFFBBBE),
        endColor: const Color(0xFFFFBBBE),
        quizCount: '156 Quiz',
      ),
      EducationLevel(
        title: 'Kuliah',
        subtitle: 'Advanced',
        icon: Icons.psychology,
        startColor: const Color(0xFFCBE3B3),
        endColor: const Color(0xFFCBE3B3),
        quizCount: '203 Quiz',
      ),
    ];
  }
}