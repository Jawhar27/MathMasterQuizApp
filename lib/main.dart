import 'package:flutter/material.dart';
import 'package:mathquiz/screens/mainScreen.dart';
import 'package:mathquiz/screens/result.dart';

import './screens/quizScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      routes: {
        QuizScreen.routeName: (ctx) => QuizScreen(),
        ResultScreen.routeName: (ctx) => ResultScreen(),
        MainScreen.routeName: (ctx) => MainScreen(),
      },
      home: MainScreen(),
    );
  }
}
