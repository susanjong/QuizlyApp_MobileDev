import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/widgets/darkmode_theme.dart';
import 'package:quiz_app/routes/app_routes.dart';

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
    if (score >= 90) return 'Perfect! Keep it up!';
    if (score >= 80) return 'Great job!';
    if (score >= 70) return 'Good Enough!';
    if (score >= 60) return 'Needs more effort!';
    return 'Keep trying!';
  }

  Color get gradeColor {
    if (score >= 90) return const Color(0xFF4CAF50);
    if (score >= 80) return const Color(0xFF2196F3);
    if (score >= 70) return const Color(0xFFFFC107);
    if (score >= 60) return const Color(0xFFFF9800);
    return const Color(0xFFF44336);
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String quizTitle;
  final List<Question> questions;
  final Map<int, String> userAnswers;
  final Set<int> doubtfulQuestions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.quizTitle,
    required this.questions,
    required this.userAnswers,
    required this.doubtfulQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider();

    final unanswered = totalQuestions - userAnswers.length;
    final wrongAnswers = userAnswers.length - score;

    final result = QuizResult(
      totalQuestions: totalQuestions,
      correctAnswers: score,
      wrongAnswers: wrongAnswers,
      unanswered: unanswered,
      doubtfulAnswers: doubtfulQuestions.length,
      questions: questions,
      userAnswers: userAnswers,
      doubtfulQuestions: doubtfulQuestions,
    );

    return ListenableBuilder(
      listenable: themeProvider,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: themeProvider.isDarkMode
              ? const Color(0xFF0F0F1E)
              : Colors.grey.shade50,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 180,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: result.score >= 70
                            ? [
                          const Color(0xFF4CAF50),
                          const Color(0xFF81C784),
                        ]
                            : result.score >= 50
                            ? [
                          const Color(0xFFFFC107),
                          const Color(0xFFFFD54F),
                        ]
                            : [
                          const Color(0xFFFF84A1),
                          const Color(0xFFFFBBBE),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            result.score >= 70
                                ? Icons.emoji_events
                                : result.score >= 50
                                ? Icons.sentiment_satisfied
                                : Icons.sentiment_dissatisfied,
                            size: 60,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Quiz Completed!',
                            style: GoogleFonts.montserrat(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            quizTitle,
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                backgroundColor: themeProvider.isDarkMode
                    ? const Color(0xFF1A1A2E)
                    : result.gradeColor,
                leading: IconButton(
                  onPressed: () => AppRoutes.navigateToHome(context),
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _ScoreCard(result: result, themeProvider: themeProvider),
                      const SizedBox(height: 16),
                      _StatisticsGrid(
                          result: result, themeProvider: themeProvider),
                      const SizedBox(height: 16),
                      _ActionButtons(
                        themeProvider: themeProvider,
                        result: result,
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ScoreCard extends StatelessWidget {
  final QuizResult result;
  final ThemeProvider themeProvider;

  const _ScoreCard({
    required this.result,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: themeProvider.cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: themeProvider.getCardShadow(),
      ),
      child: Column(
        children: [
          Text(
            'Your Score',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: themeProvider.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 16),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  value: result.score / 100,
                  strokeWidth: 12,
                  backgroundColor: themeProvider.progressBarBackground,
                  valueColor: AlwaysStoppedAnimation<Color>(result.gradeColor),
                ),
              ),
              Column(
                children: [
                  Text(
                    result.score.toStringAsFixed(0),
                    style: GoogleFonts.montserrat(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: result.gradeColor,
                    ),
                  ),
                  Text(
                    result.grade,
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: themeProvider.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            result.feedback,
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: result.gradeColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'You answered ${result.correctAnswers} out of ${result.totalQuestions} correctly!',
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: themeProvider.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatisticsGrid extends StatelessWidget {
  final QuizResult result;
  final ThemeProvider themeProvider;

  const _StatisticsGrid({
    required this.result,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.check_circle,
                iconColor: const Color(0xFF4CAF50),
                label: 'Correct',
                value: '${result.correctAnswers}',
                themeProvider: themeProvider,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.cancel,
                iconColor: const Color(0xFFF44336),
                label: 'Wrong',
                value: '${result.wrongAnswers}',
                themeProvider: themeProvider,
              ),
            ),
          ],
        ),
        if (result.unanswered > 0 || result.doubtfulAnswers > 0) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              if (result.unanswered > 0)
                Expanded(
                  child: _StatCard(
                    icon: Icons.help_outline,
                    iconColor: const Color(0xFF9E9E9E),
                    label: 'Unanswered',
                    value: '${result.unanswered}',
                    themeProvider: themeProvider,
                  ),
                ),
              if (result.unanswered > 0 && result.doubtfulAnswers > 0)
                const SizedBox(width: 12),
              if (result.doubtfulAnswers > 0)
                Expanded(
                  child: _StatCard(
                    icon: Icons.warning_amber,
                    iconColor: const Color(0xFFFF9800),
                    label: 'Doubtful',
                    value: '${result.doubtfulAnswers}',
                    themeProvider: themeProvider,
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final ThemeProvider themeProvider;

  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themeProvider.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: themeProvider.getCardShadow(),
      ),
      child: Column(
        children: [
          Icon(icon, size: 36, color: iconColor),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: themeProvider.primaryTextColor,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: themeProvider.secondaryTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final ThemeProvider themeProvider;
  final QuizResult result;

  const _ActionButtons({
    required this.themeProvider,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              AppRoutes.navigateToHome(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF84A1),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
            ),
            child: Text(
              'Back to Home',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              _showShareDialog(context, result);
            },
            icon: Icon(
              Icons.share,
              size: 20,
              color: themeProvider.primaryTextColor,
            ),
            label: Text(
              'Share Results',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: themeProvider.primaryTextColor,
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: BorderSide(
                color: themeProvider.primaryTextColor.withOpacity(0.5),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showShareDialog(BuildContext context, QuizResult result) {
    final shareText = '''
🎉 My Quiz Results

📚 ${result.questions.isNotEmpty ? "Dart Programming Quiz" : "Quiz"}
✅ Correct: ${result.correctAnswers}/${result.totalQuestions}
📊 Score: ${result.score.toStringAsFixed(0)}
🏆 Grade: ${result.grade}

${result.feedback}
''';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            const Icon(Icons.share, color: Color(0xFFFF84A1)),
            const SizedBox(width: 8),
            Text(
              'Share Results',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shareText,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Sharing feature coming soon!',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}