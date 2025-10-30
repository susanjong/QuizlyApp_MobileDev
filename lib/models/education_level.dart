import 'package:flutter/material.dart';

class EducationLevel {
  final String title;
  final IconData icon;
  final Color backgroundColor;

  EducationLevel({
    required this.title,
    required this.icon,
    required this.backgroundColor,
  });

  // Static list untuk data default
  static List<EducationLevel> getDefaultLevels() {
    return [
      EducationLevel(
        title: 'Space',
        icon: Icons.public,
        backgroundColor: const Color(0xFFF5DDA9),
      ),
      EducationLevel(
        title: 'History',
        icon: Icons.auto_stories,
        backgroundColor: const Color(0xFFD4C5E2),
      ),
      EducationLevel(
        title: 'Music',
        icon: Icons.music_note,
        backgroundColor: const Color(0xFFFFCCB3),
      ),
      EducationLevel(
        title: 'Education',
        icon: Icons.school,
        backgroundColor: const Color(0xFFB8E6D5),
      ),
    ];
  }
}