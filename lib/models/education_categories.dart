import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationLevel {
  final String title;
  final IconData icon;
  final Color backgroundColor;

  EducationLevel({
    required this.title,
    required this.icon,
    required this.backgroundColor,
  });

  // Method untuk mendapatkan TextStyle dengan Montserrat
  TextStyle getTitleStyle({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w600,
    Color? color,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Colors.black,
    );
  }

  // Static list untuk data default
  static List<EducationLevel> getDefaultLevels() {
    return [
      EducationLevel(
        title: 'Programming',
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