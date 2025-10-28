import 'package:flutter/material.dart';
import 'package:quiz_app/screens/login.dart';
import 'package:quiz_app/screens/signup.dart';

class AppRoutes {
  // Route names
  static const String login = '/';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String home = '/home';
  static const String forgotPassword = '/forgot_password';
  static const String resetPassword = '/reset_password';

  // Routes map
  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginPage(),
    signIn: (context) => const LoginPage(),
    signUp: (context) => const SignUpPage(),
    // home: (context) => const HomePage(), // TODO: Create HomePage
    // forgotPassword: (context) => const ForgotPasswordPage(), // TODO: Create ForgotPasswordPage
    // resetPassword: (context) => const ResetPasswordPage(), // TODO: Create ResetPasswordPage
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

  // Go back
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}