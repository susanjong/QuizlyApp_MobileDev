import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/darkmode_theme.dart';
import 'package:quiz_app/widgets/category_card.dart';
import 'package:quiz_app/widgets/programming_card.dart';
import 'package:quiz_app/widgets/days_indicator.dart';
import 'package:quiz_app/widgets/daily_challenge_card.dart';
import 'package:quiz_app/widgets/navbar_widget.dart';
import 'package:quiz_app/models/education_categories.dart';
import 'package:quiz_app/models/programming_challenge.dart';
import 'package:quiz_app/routes/app_routes.dart';
import 'package:quiz_app/data/quiz_questions.dart';
import 'package:quiz_app/models/user_session.dart';

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

  // TAMBAHKAN FUNGSI INI untuk extract nama dari email
  String _getUserName() {
    final userIdentifier = UserSession().displayIdentifier;

    // Jika user identifier adalah email, extract nama dari email
    if (userIdentifier.contains('@')) {
      final emailParts = userIdentifier.split('@');
      if (emailParts.isNotEmpty) {
        String name = emailParts[0];

        // Replace underscore dan dot dengan spasi
        name = name.replaceAll('_', ' ').replaceAll('.', ' ');

        // Capitalize setiap kata
        return name.split(' ').map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        }).join(' ');
      }
    }

    // Jika bukan email atau jika sudah ada nama, return as is
    return userIdentifier;
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
    // AMBIL NAMA USER DARI SESSION
    final userName = _getUserName();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello $userName 👋', // GANTI "Susan" dengan userName
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: _themeProvider.primaryTextColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                'Lets do the questions today 🔥',
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
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
      onTap: () {},
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
              color: const Color(0xFFCBE3B3).withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.local_fire_department, color: Colors.white, size: 18),
            const SizedBox(width: 4),
            Text(
              '7',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyProgress() {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final today = DateTime.now().weekday - 1;

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
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: _themeProvider.primaryTextColor,
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'See All',
            style: GoogleFonts.montserrat(
              color: const Color(0xFF355F3B),
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
            onTap: () {},
          ),
        );
      }).toList(),
    );
  }

  void _startProgrammingQuest() {
    AppRoutes.navigateToQuiz(
      context,
      quizTitle: 'Programming Quest - Dart Challenge',
      questions: SampleQuestions.getDartQuestions(),
    );
  }

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
  }

  void _showSnackBar(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
          ),
        ),
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