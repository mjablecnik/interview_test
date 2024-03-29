import 'package:flutter/material.dart';
import 'package:interview_test/pages/start_page.dart';
import 'package:interview_test/survey.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Survey(
      child: MaterialApp(
        title: "Simple Survey",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const StartPage(),
      ),
    );
  }
}
