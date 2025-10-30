import 'package:flutter/material.dart';
import 'package:quiz_app/models/programming_challenge.dart';
import 'package:quiz_app/widgets/darkmode_theme.dart';

class ProgrammingCard extends StatelessWidget {
  final ProgrammingChallenge challenge;
  final ThemeProvider themeProvider;
  final VoidCallback onTap;

  const ProgrammingCard({
    super.key,
    required this.challenge,
    required this.themeProvider,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: themeProvider.cardColor,
          borderRadius: BorderRadius.circular(14),
          boxShadow: themeProvider.getCardShadow(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: challenge.accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    challenge.icon,
                    color: challenge.accentColor,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        challenge.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: themeProvider.primaryTextColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: challenge.accentColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              challenge.level,
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: challenge.accentColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            challenge.questionCount,
                            style: TextStyle(
                              fontSize: 11,
                              color: themeProvider.secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: themeProvider.secondaryTextColor,
                ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: challenge.progress,
                backgroundColor: themeProvider.progressBarBackground,
                valueColor: AlwaysStoppedAnimation<Color>(challenge.accentColor),
                minHeight: 5,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${(challenge.progress * 100).toInt()}% Selesai',
              style: TextStyle(
                fontSize: 11,
                color: themeProvider.secondaryTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}