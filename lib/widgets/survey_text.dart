import 'package:flutter/material.dart';

class SurveyText extends StatelessWidget {
  const SurveyText({super.key, required this.text,});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}

