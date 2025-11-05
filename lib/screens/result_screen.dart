import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/widgets/darkmode_theme.dart';
import 'package:quiz_app/routes/app_routes.dart';
import 'package:quiz_app/screens/quiz_review_screen.dart';
import 'package:quiz_app/models/user_session.dart';

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
  final String? userName;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.quizTitle,
    required this.questions,
    required this.userAnswers,
    required this.doubtfulQuestions,
    this.userName,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider();
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

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

    final displayName = UserSession().getDisplayName();

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
                expandedHeight: isLargeScreen ? 200 : 180,
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isLargeScreen ? 32 : 16,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              result.score >= 70
                                  ? Icons.emoji_events
                                  : result.score >= 50
                                  ? Icons.sentiment_satisfied
                                  : Icons.sentiment_dissatisfied,
                              size: isLargeScreen ? 72 : 60,
                              color: Colors.white,
                            ),
                            SizedBox(height: isLargeScreen ? 12 : 8),
                            Text(
                              'Quiz Completed!',
                              style: GoogleFonts.montserrat(
                                fontSize: isLargeScreen ? 28 : 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            Flexible(
                              child: Text(
                                quizTitle,
                                style: GoogleFonts.montserrat(
                                  fontSize: isLargeScreen ? 16 : 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white70,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
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
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final maxWidth = constraints.maxWidth;
                    final contentWidth = maxWidth > 800 ? 800.0 : maxWidth;

                    return Center(
                      child: Container(
                        width: contentWidth,
                        padding: EdgeInsets.all(isLargeScreen ? 24 : 16),
                        child: Column(
                          children: [
                            _ScoreCard(
                              result: result,
                              themeProvider: themeProvider,
                              userName: displayName,
                              isLargeScreen: isLargeScreen,
                            ),
                            SizedBox(height: isLargeScreen ? 24 : 16),
                            _StatisticsGrid(
                              result: result,
                              themeProvider: themeProvider,
                              isLargeScreen: isLargeScreen,
                            ),
                            SizedBox(height: isLargeScreen ? 24 : 16),
                            _ActionButtons(
                              themeProvider: themeProvider,
                              result: result,
                              quizTitle: quizTitle,
                              questions: questions,
                              userAnswers: userAnswers,
                              doubtfulQuestions: doubtfulQuestions,
                              isLargeScreen: isLargeScreen,
                            ),
                            SizedBox(height: isLargeScreen ? 48 : 32),
                          ],
                        ),
                      ),
                    );
                  },
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
  final String userName;
  final bool isLargeScreen;

  const _ScoreCard({
    required this.result,
    required this.themeProvider,
    required this.userName,
    required this.isLargeScreen,
  });

  @override
  Widget build(BuildContext context) {
    final circleSize = isLargeScreen ? 180.0 : 150.0;

    return Container(
      padding: EdgeInsets.all(isLargeScreen ? 32 : 24),
      decoration: BoxDecoration(
        color: themeProvider.cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: themeProvider.getCardShadow(),
      ),
      child: Column(
        children: [
          // Display "Your Score, [Name]" with text wrapping
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Your Score, ',
                    style: GoogleFonts.montserrat(
                      fontSize: isLargeScreen ? 18 : 16,
                      fontWeight: FontWeight.w500,
                      color: themeProvider.secondaryTextColor,
                    ),
                  ),
                  TextSpan(
                    text: userName,
                    style: GoogleFonts.montserrat(
                      fontSize: isLargeScreen ? 18 : 16,
                      fontWeight: FontWeight.w700,
                      color: themeProvider.primaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: isLargeScreen ? 24 : 16),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: circleSize,
                height: circleSize,
                child: CircularProgressIndicator(
                  value: result.score / 100,
                  strokeWidth: isLargeScreen ? 14 : 12,
                  backgroundColor: themeProvider.progressBarBackground,
                  valueColor: AlwaysStoppedAnimation<Color>(result.gradeColor),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    result.score.toStringAsFixed(0),
                    style: GoogleFonts.montserrat(
                      fontSize: isLargeScreen ? 56 : 48,
                      fontWeight: FontWeight.w700,
                      color: result.gradeColor,
                    ),
                  ),
                  Text(
                    result.grade,
                    style: GoogleFonts.montserrat(
                      fontSize: isLargeScreen ? 28 : 24,
                      fontWeight: FontWeight.w600,
                      color: themeProvider.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: isLargeScreen ? 24 : 16),
          Text(
            result.feedback,
            style: GoogleFonts.montserrat(
              fontSize: isLargeScreen ? 20 : 18,
              fontWeight: FontWeight.w600,
              color: result.gradeColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isLargeScreen ? 12 : 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'You answered ${result.correctAnswers} out of ${result.totalQuestions} correctly!',
              style: GoogleFonts.montserrat(
                fontSize: isLargeScreen ? 16 : 14,
                fontWeight: FontWeight.w400,
                color: themeProvider.secondaryTextColor,
              ),
              textAlign: TextAlign.center,
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
  final bool isLargeScreen;

  const _StatisticsGrid({
    required this.result,
    required this.themeProvider,
    required this.isLargeScreen,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = isLargeScreen ? 16.0 : 12.0;

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
                isLargeScreen: isLargeScreen,
              ),
            ),
            SizedBox(width: spacing),
            Expanded(
              child: _StatCard(
                icon: Icons.cancel,
                iconColor: const Color(0xFFF44336),
                label: 'Wrong',
                value: '${result.wrongAnswers}',
                themeProvider: themeProvider,
                isLargeScreen: isLargeScreen,
              ),
            ),
          ],
        ),
        if (result.unanswered > 0 || result.doubtfulAnswers > 0) ...[
          SizedBox(height: spacing),
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
                    isLargeScreen: isLargeScreen,
                  ),
                ),
              if (result.unanswered > 0 && result.doubtfulAnswers > 0)
                SizedBox(width: spacing),
              if (result.doubtfulAnswers > 0)
                Expanded(
                  child: _StatCard(
                    icon: Icons.warning_amber,
                    iconColor: const Color(0xFFFF9800),
                    label: 'Doubtful',
                    value: '${result.doubtfulAnswers}',
                    themeProvider: themeProvider,
                    isLargeScreen: isLargeScreen,
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
  final bool isLargeScreen;

  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.themeProvider,
    required this.isLargeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isLargeScreen ? 20 : 16),
      decoration: BoxDecoration(
        color: themeProvider.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: themeProvider.getCardShadow(),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: isLargeScreen ? 42 : 36,
            color: iconColor,
          ),
          SizedBox(height: isLargeScreen ? 12 : 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: GoogleFonts.montserrat(
                fontSize: isLargeScreen ? 28 : 24,
                fontWeight: FontWeight.w700,
                color: themeProvider.primaryTextColor,
              ),
            ),
          ),
          SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              style: GoogleFonts.montserrat(
                fontSize: isLargeScreen ? 14 : 12,
                fontWeight: FontWeight.w500,
                color: themeProvider.secondaryTextColor,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final ThemeProvider themeProvider;
  final QuizResult result;
  final String quizTitle;
  final List<Question> questions;
  final Map<int, String> userAnswers;
  final Set<int> doubtfulQuestions;
  final bool isLargeScreen;

  const _ActionButtons({
    required this.themeProvider,
    required this.result,
    required this.quizTitle,
    required this.questions,
    required this.userAnswers,
    required this.doubtfulQuestions,
    required this.isLargeScreen,
  });

  @override
  Widget build(BuildContext context) {
    final buttonPadding = isLargeScreen ? 20.0 : 16.0;
    final fontSize = isLargeScreen ? 18.0 : 16.0;
    final spacing = isLargeScreen ? 16.0 : 12.0;

    return Column(
      children: [
        // TOMBOL SEE RESULTS DAN BACK TO HOME SELALU BERSEBELAHAN
        Row(
          children: [
            Expanded(
              child: _buildSeeResultsButton(
                context,
                buttonPadding,
                fontSize,
              ),
            ),
            SizedBox(width: spacing),
            Expanded(
              child: _buildBackToHomeButton(
                context,
                buttonPadding,
                fontSize,
              ),
            ),
          ],
        ),
        SizedBox(height: spacing),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              _showShareDialog(context, result);
            },
            icon: Icon(
              Icons.share,
              size: isLargeScreen ? 22 : 20,
              color: themeProvider.primaryTextColor,
            ),
            label: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Share Results',
                style: GoogleFonts.montserrat(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: themeProvider.primaryTextColor,
                ),
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: buttonPadding),
              side: BorderSide(
                color: themeProvider.primaryTextColor.withValues(alpha: 0.5),
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

  Widget _buildSeeResultsButton(
      BuildContext context,
      double padding,
      double fontSize,
      ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizReviewScreen(
                quizTitle: quizTitle,
                questions: questions,
                userAnswers: userAnswers,
                doubtfulQuestions: doubtfulQuestions,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: padding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              color: Color(0xCC355F3B),
              width: 2,
            ),
          ),
          elevation: 0,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'See Results',
            style: GoogleFonts.montserrat(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: const Color(0xCC355F3B),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackToHomeButton(
      BuildContext context,
      double padding,
      double fontSize,
      ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          AppRoutes.navigateToHome(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xCC355F3B),
          padding: EdgeInsets.symmetric(vertical: padding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Back to Home',
            style: GoogleFonts.montserrat(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFFFCCF),
            ),
          ),
        ),
      ),
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
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 400,
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.share, color: Color(0xFFFF84A1)),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          'Share Results',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    child: SelectableText(
                      shareText,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Sharing feature coming soon!',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Close',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF616161),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}