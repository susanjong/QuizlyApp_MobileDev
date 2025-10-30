import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/routes/app_routes.dart';
import 'package:quiz_app/widgets/darkmode_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Quizly',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: themeProvider.isDarkMode ? Brightness.dark : Brightness.light,
            scaffoldBackgroundColor: themeProvider.backgroundColor,
            primaryColor: Colors.pink,
            useMaterial3: true,
          ),
          initialRoute: AppRoutes.splashScreen, // Mulai dari splash screen
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
