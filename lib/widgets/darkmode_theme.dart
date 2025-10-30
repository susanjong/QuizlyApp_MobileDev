import 'package:flutter/material.dart';

// Theme Provider SINGLETON untuk mengelola dark mode state secara global
class ThemeProvider extends ChangeNotifier {
  // Singleton pattern
  static final ThemeProvider _instance = ThemeProvider._internal();
  factory ThemeProvider() => _instance;
  ThemeProvider._internal();

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void setTheme(bool isDark) {
    _isDarkMode = isDark;
    notifyListeners();
  }

  // Getter untuk warna background gradient (untuk GradientBackground)
  List<Color> get gradientColors => _isDarkMode
      ? [
          const Color(0xFF1A1A2E),
          const Color(0xFF16213E),
          const Color(0xFF0F3460),
        ]
      : [
          const Color(0xFFFFBBBE), // Warna asli Anda
          const Color(0xFFFDF8E8), // Warna asli Anda
        ];

  // Getter untuk warna text
  Color get primaryTextColor => _isDarkMode ? Colors.white : Colors.black;

  Color get secondaryTextColor =>
      _isDarkMode ? Colors.white70 : Colors.black54;

  // Getter untuk background input field
  Color get inputBackgroundColor => _isDarkMode
      ? Colors.white.withValues(alpha: 0.1)
      : Colors.white.withValues(alpha: 0.5);

  // Getter untuk background tab
  Color get tabBackgroundColor => _isDarkMode
      ? Colors.white.withValues(alpha: 0.1)
      : Colors.white.withValues(alpha: 0.7);

    Color get dayIndicatorInactiveColor => _isDarkMode 
      ? Colors.white.withValues(alpha: 0.1)
      : Colors.black.withValues(alpha:0.05);

  // Getter untuk checkbox
  Color get checkboxColor => _isDarkMode
      ? Colors.white.withValues(alpha: 0.2)
      : Colors.white.withValues(alpha: 0.5);

  // Getter untuk divider
  Color get dividerColor => _isDarkMode ? Colors.white24 : Colors.black12;

  // Getter untuk hint text
  Color get hintTextColor => _isDarkMode
      ? Colors.white.withValues(alpha: 0.4)
      : Colors.black.withValues(alpha: 0.4);

  // Getter untuk background halaman
  Color get backgroundColor =>
      _isDarkMode ? const Color(0xFF121212) : const Color(0xFFF5F5F5);

  // Getter untuk background kartu
  Color get cardColor =>
      _isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

  // Getter untuk background progress bar
  Color get progressBarBackground =>
      _isDarkMode ? Colors.white12 : Colors.black12;

  // Metode untuk mendapatkan bayangan kartu
  List<BoxShadow> getCardShadow() => _isDarkMode
      ? [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ]
      : [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ];
  // Metode untuk mendapatkan bayangan bottom navigation
  List<BoxShadow> getBottomNavShadow() => _isDarkMode
      ? [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ]
      : [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ];
}

// Widget Toggle untuk Dark Mode - Style 1: Button with Icon and Text
class DarkModeToggle extends StatelessWidget {
  final ThemeProvider themeProvider;

  const DarkModeToggle({
    Key? key,
    required this.themeProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        themeProvider.toggleTheme();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: themeProvider.isDarkMode
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: themeProvider.primaryTextColor,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              themeProvider.isDarkMode ? 'Dark' : 'Light',
              style: TextStyle(
                color: themeProvider.primaryTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Style 2: Switch Style Toggle
class DarkModeSwitchToggle extends StatelessWidget {
  final ThemeProvider themeProvider;

  const DarkModeSwitchToggle({
    Key? key,
    required this.themeProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode
            ? Colors.white.withValues(alpha: 0.1)
            : Colors.black.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.wb_sunny,
            color: themeProvider.primaryTextColor.withValues(alpha: 0.7),
            size: 18,
          ),
          const SizedBox(width: 4),
          Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
            activeColor: const Color(0xFF4169E1),
            activeTrackColor: const Color(0xFF4169E1).withValues(alpha: 0.5),
            inactiveThumbColor: Colors.orange,
            inactiveTrackColor: Colors.orange.withValues(alpha: 0.5),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.nightlight_round,
            color: themeProvider.primaryTextColor.withValues(alpha: 0.7),
            size: 18,
          ),
        ],
      ),
    );
  }
}

// Icon Only Toggle
class DarkModeIconToggle extends StatelessWidget {
  final ThemeProvider themeProvider;

  const DarkModeIconToggle({
    Key? key,
    required this.themeProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode
            ? Colors.white.withValues(alpha: 0.1)
            : Colors.black.withValues(alpha: 0.05),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          themeProvider.toggleTheme();
        },
        icon: Icon(
          themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
          color: themeProvider.primaryTextColor,
        ),
        tooltip: themeProvider.isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
      ),
    );
  }
}

// Style 4: Animated Toggle
class DarkModeAnimatedToggle extends StatelessWidget {
  final ThemeProvider themeProvider;

  const DarkModeAnimatedToggle({
    Key? key,
    required this.themeProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        themeProvider.toggleTheme();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: themeProvider.isDarkMode
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: animation,
                  child: child,
                );
              },
              child: Icon(
                themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                key: ValueKey(themeProvider.isDarkMode),
                color: themeProvider.primaryTextColor,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
