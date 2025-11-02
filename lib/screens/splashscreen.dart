import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:quiz_app/widgets/gradient_background.dart';
import 'package:quiz_app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _pulseController;
  late AnimationController _slideController;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutCubic),
      ),
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: _pulseController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.3, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.easeOutCubic,
      ),
    );

    _mainController.forward();
    _slideController.forward();

    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        _pulseController.repeat(reverse: true);
      }
    });

    Timer(const Duration(milliseconds: 3500), () {
      if (mounted) {
        AppRoutes.navigateAndReplace(context, AppRoutes.login);
      }
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    _pulseController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Center(
            child: AnimatedBuilder(
              animation: Listenable.merge([
                _mainController,
                _pulseController,
                _slideController,
              ]),
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: _pulseAnimation.value,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.1),
                                        blurRadius: 20,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      'assets/images/Logo.png',
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFE06B9F),
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: const Icon(
                                            Icons.quiz,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                SlideTransition(
                                  position: _slideAnimation,
                                  child: Image.asset(
                                    'assets/images/logo_text.png',
                                    width: 180,
                                    height: 60,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Text(
                                        'QUIZLY',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w900,
                                          color: const Color(0xFFCBE3B3),
                                          letterSpacing: 3,
                                          shadows: const [
                                            Shadow(
                                              offset: Offset(2, 2),
                                              blurRadius: 8,
                                              color: Color(0xFFCBE3B3),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}