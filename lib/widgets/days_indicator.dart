import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/widgets/darkmode_theme.dart';

class DayIndicator extends StatelessWidget {
  final String day;
  final bool isActive;

  const DayIndicator({
    super.key,
    required this.day,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    // Menggunakan Provider untuk mendapatkan ThemeProvider
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Enkapsulasi logika pemilihan style berdasarkan status 'isActive'
    final containerDecoration = _buildContainerDecoration(themeProvider);
    final iconData = isActive ? Icons.check : Icons.circle;
    final iconColor = isActive ? const Color(0xFF2D5016) : themeProvider.secondaryTextColor;
    final textStyle = _buildTextStyle(themeProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: containerDecoration,
          child: Icon(
            iconData,
            color: iconColor,
            size: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          day,
          style: textStyle,
        ),
      ],
    );
  }

  // Metode privat untuk mengenkapsulasi pembuatan dekorasi container
  BoxDecoration _buildContainerDecoration(ThemeProvider themeProvider) {
    if (isActive) {
      return BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFCDFF00), Color(0xFF9AFF00)],
        ),
        shape: BoxShape.circle,
        boxShadow:  [
          BoxShadow(
            color: Color(0x4DCDFF00),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      );
    } else {
      return BoxDecoration(
        color: themeProvider.dayIndicatorInactiveColor,
        shape: BoxShape.circle,
      );
    }
  }

  // Metode privat untuk mengenkapsulasi pembuatan style teks
  TextStyle _buildTextStyle(ThemeProvider themeProvider) {
    return TextStyle(
      fontSize: 10,
      fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
      color: isActive
          ? themeProvider.primaryTextColor
          : themeProvider.secondaryTextColor,
    );
  }
}
