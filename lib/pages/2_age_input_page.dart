import 'package:flutter/material.dart';
import 'package:interview_test/default_layout.dart';
import 'package:interview_test/pages/3_bio_input_page.dart';
import 'package:interview_test/widgets/survey_text.dart';
import 'package:interview_test/widgets/submit_button.dart';

class AgeInputPage extends StatefulWidget {
  const AgeInputPage({super.key});

  @override
  State<AgeInputPage> createState() => _AgeInputPageState();
}

class _AgeInputPageState extends State<AgeInputPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "Age",
      child: Center(
        child: Column(
          children: <Widget>[
            const Spacer(),
            const SurveyText(text: "Write your age:"),
            const SizedBox(height: 30),
            TextFormField(
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const Spacer(),
            SubmitButton(
              label: "Continue",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BioInputPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
