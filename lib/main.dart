import 'package:flutter/material.dart';
import 'package:quiz_app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splashScreen, // Mulai dari splash screen
      routes: AppRoutes.routes,
    );
  }
}