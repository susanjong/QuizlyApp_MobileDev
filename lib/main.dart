import 'package:flutter/material.dart';
import 'package:quiz_app/routes/app_routes.dart';
import 'package:quiz_app/screens/login.dart';

void main() {
  runApp(const QuizlyApp());
}

class QuizlyApp extends StatelessWidget {
  const QuizlyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizly',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF1a1a2e),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}