import 'package:flutter/material.dart';
import 'package:quiz_app/screens/login.dart';
import 'package:quiz_app/screens/signup.dart';
import 'package:quiz_app/screens/splashscreen.dart';
import 'package:quiz_app/screens/homepage.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/models/question_model.dart';

class AppRoutes {
  // Route names
  static const String splashScreen = '/splashscreen';
  static const String login = '/';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String home = '/home';
  static const String quiz = '/quiz';
  static const String forgotPassword = '/forgot_password';
  static const String resetPassword = '/reset_password';

  // Routes map
  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    login: (context) => const LoginPage(),
    signIn: (context) => const LoginPage(),
    signUp: (context) => const SignUpPage(),
    home: (context) => const HomePage(),
    // forgotPassword: (context) => const ForgotPasswordPage(),
    // resetPassword: (context) => const ResetPasswordPage(),
  };

  // Navigate to route
  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  // Navigate and replace current route
  static void navigateAndReplace(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  // Navigate and remove all previous routes
  static void navigateAndRemoveUntil(BuildContext context, String routeName) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }

  // Navigate to quiz with data
  static void navigateToQuiz(
      BuildContext context, {
        required String quizTitle,
        required List<Question> questions,
      }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizScreen(
          quizTitle: quizTitle,
          questions: questions,
        ),
      ),
    );
  }

  // Go back
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}