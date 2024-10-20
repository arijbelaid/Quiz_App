import 'package:flutter/material.dart';
import 'package:quiz/Acceuil.dart';
import 'package:quiz/QuizPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Application Quiz",
      initialRoute: '/',
      routes: {
        '/': (context) => const Acceuil(), // Set the initial route to Acceuil
        '/QuizPage': (context) => const QuizPage(),
        
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
