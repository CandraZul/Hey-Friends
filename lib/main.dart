import 'package:flutter/material.dart';
import 'package:hey_friends/pages/main_page.dart';
import 'package:hey_friends/pages/quiz_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/quiz': (context) => QuizPage()
      },
    );
  }
}