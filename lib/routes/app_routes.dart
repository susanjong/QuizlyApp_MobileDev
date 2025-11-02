import 'package:flutter/material.dart';
import 'package:quiz_app/screens/login.dart';
import 'package:quiz_app/screens/signup.dart';
import 'package:quiz_app/screens/splashscreen.dart';
import 'package:quiz_app/screens/homepage.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/forgot_password.dart';
import 'package:quiz_app/screens/reset_password.dart';
import 'package:quiz_app/models/question_model.dart';

// File ini diletakkan di: lib/routes/app_routes.dart

class AppRoutes {
  // route names
  static const String splashScreen = '/splashscreen';
  static const String login = '/';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String home = '/home';
  static const String quiz = '/quiz';
  static const String result = '/result';
  static const String forgotPassword = '/forgot_password';
  static const String resetPassword = '/reset_password';

  // routes map
  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    login: (context) => const LoginPage(),
    signIn: (context) => const LoginPage(),
    signUp: (context) => const SignUpPage(),
    home: (context) => const HomePage(),
    forgotPassword: (context) => const ForgotPasswordPage(),
    resetPassword: (context) => const ResetPasswordPage(),
  };

  // navigate to route
  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  // navigate and replace current route
  static void navigateAndReplace(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  // navigate and remove all previous routes
  static void navigateAndRemoveUntil(BuildContext context, String routeName) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }

  // navigate to home and clear all routes
  static void navigateToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false,
    );
  }

  // navigate to quiz with data
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

  // navigate to result with data
  static void navigateToResult(
      BuildContext context, {
        required int score,
        required int totalQuestions,
        required String quizTitle,
        required List<Question> questions,
        required Map<int, String> userAnswers,
        required Set<int> doubtfulQuestions,
      }) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          score: score,
          totalQuestions: totalQuestions,
          quizTitle: quizTitle,
          questions: questions,
          userAnswers: userAnswers,
          doubtfulQuestions: doubtfulQuestions,
        ),
      ),
    );
  }

  // navigate to forgot password
  static void navigateToForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, forgotPassword);
  }

  // navigate to reset password
  static void navigateToResetPassword(BuildContext context) {
    Navigator.pushNamed(context, resetPassword);
  }

  // go back
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}