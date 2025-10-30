import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/darkmode_theme.dart';
import 'package:quiz_app/widgets/category_card.dart';
import 'package:quiz_app/widgets/programming_card.dart';
import 'package:quiz_app/widgets/days_indicator.dart';
import 'package:quiz_app/widgets/featured_challenge_card.dart';
import 'package:quiz_app/widgets/navbar_widget.dart';
import 'package:quiz_app/models/education_level.dart';
import 'package:quiz_app/models/programming_challenge.dart';
import 'package:quiz_app/routes/app_routes.dart';
import 'package:quiz_app/data/sample_questions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ThemeProvider _themeProvider = ThemeProvider();
  int _currentIndex = 0;
  late List<EducationLevel> educationLevels;
  late List<ProgrammingChallenge> programmingChallenges;

  @override
  void initState() {
    super.initState();
    educationLevels = EducationLevel.getDefaultLevels();
    programmingChallenges = ProgrammingChallenge.getDefaultChallenges();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeProvider,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: _themeProvider.backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 20),
                    _buildWeeklyProgress(),
                    const SizedBox(height: 20),
                    FeaturedChallengeCard(
                      onPressed: _startProgrammingQuest,
                    ),
                    const SizedBox(height: 24),
                    _buildSectionHeader('Pilih Jenjang'),
                    const SizedBox(height: 16),
                    _buildEducationLevelGrid(),
                    const SizedBox(height: 24),
                    _buildSectionHeader('Recent Activity'),
                    const SizedBox(height: 16),
                    _buildProgrammingChallengesList(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: NavbarWidget(
            currentIndex: _currentIndex,
            themeProvider: _themeProvider,
            onTap: _handleNavbarTap,
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello Susan 👋',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _themeProvider.primaryTextColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                'Siap belajar hari ini?',
                style: TextStyle(
                  fontSize: 13,
                  color: _themeProvider.secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Row(
          children: [
            DarkModeIconToggle(themeProvider: _themeProvider),
            const SizedBox(width: 8),
            _buildStreakButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildStreakButton() {
    return GestureDetector(
      onTap: () {
        // _showSnackBar('Streak kamu: 7 hari! 🔥');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFF1493), Color(0xFFFF69B4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF1493).withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.local_fire_department, color: Colors.white, size: 18),
            SizedBox(width: 4),
            Text(
              '7',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyProgress() {
    final days = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
    final today = DateTime.now().weekday - 1; // Monday = 0

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: _themeProvider.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: _themeProvider.getCardShadow(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          days.length,
              (index) => DayIndicator(
            day: days[index],
            isActive: index == today,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _themeProvider.primaryTextColor,
          ),
        ),
        TextButton(
          onPressed: () {
            // _showSnackBar('Menampilkan semua $title...');
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'Lihat Semua',
            style: TextStyle(
              color: Color(0xFFFF1493),
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEducationLevelGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.95,
      ),
      itemCount: educationLevels.length,
      itemBuilder: (context, index) {
        final level = educationLevels[index];
        return CategoryCard(
          educationLevel: level,
          onTap: () {
            _startQuizByCategory(level.title);
          },
        );
      },
    );
  }

  Widget _buildProgrammingChallengesList() {
    return Column(
      children: programmingChallenges.map((challenge) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ProgrammingCard(
            challenge: challenge,
            themeProvider: _themeProvider,
            onTap: () {
              /*_showSnackBar(
                'Membuka ${challenge.title} - Level ${challenge.level}',
              );*/
            },
          ),
        );
      }).toList(),
    );
  }

// Function untuk start Programming Quest
  void _startProgrammingQuest() {
    AppRoutes.navigateToQuiz(
      context,
      quizTitle: 'Programming Quest - Dart Challenge',
      questions: SampleQuestions.getDartQuestions(),
    );
  }

// Function untuk start quiz by category
  void _startQuizByCategory(String category) {
    AppRoutes.navigateToQuiz(
      context,
      quizTitle: '$category Quiz',
      questions: SampleQuestions.getQuestionsByCategory(category),
    );
  }

  void _handleNavbarTap(int index) {
    if (_currentIndex == index) return;

    setState(() {
      _currentIndex = index;
    });

    //  final messages = [
    //   'Menu Home',
    //   'Menu Progress',
    //   'Menu Prestasi',
    //   'Menu Profil',
    // ];
    //
    // if (index < messages.length) {
    //   _showSnackBar(messages[index]);
    // }
  }

  void _showSnackBar(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xFFFF1493),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}