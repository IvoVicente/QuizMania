import 'package:flutter/material.dart';
import 'package:quizmania/pages/home.dart';
import 'package:quizmania/pages/howplay.dart';
import 'package:quizmania/pages/options.dart';
import 'package:quizmania/pages/game_over.dart';
import 'package:quizmania/pages/score.dart';
import 'package:quizmania/pages/quiz.dart';
import 'package:quizmania/providers/quiz_provider.dart';
import 'package:provider/provider.dart';


void main() => runApp(
  ChangeNotifierProvider(
      create: (context) => QuizProvider(),
      child: const MainApp(),
    ),
  );

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 2, 120, 254)),
          useMaterial3: true,
          fontFamily: 'Krona One'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/how': (context) => const HowPlay(),
        '/options': (context) => const OptionsPage(),
        '/game_over': (context) => const GameOver(),
        '/score': (context) => const Score(),
        '/quiz': (context) => const Quiz()
      },
    );
  }
}
