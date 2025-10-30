import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/darkmode_theme.dart';

class NavbarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final ThemeProvider themeProvider;

  const NavbarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: themeProvider.cardColor,
        boxShadow: themeProvider.getBottomNavShadow(),
      ),
      child: SafeArea(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: const Color(0xFFFF1493),
          unselectedItemColor: themeProvider.secondaryTextColor,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          currentIndex: currentIndex,
          onTap: onTap,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded, size: 24),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded, size: 24),
              label: 'Progress',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_rounded, size: 24),
              label: 'Prestasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded, size: 24),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}