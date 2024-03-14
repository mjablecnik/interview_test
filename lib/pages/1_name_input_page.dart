import 'package:flutter/material.dart';
import 'package:interview_test/default_layout.dart';
import 'package:interview_test/pages/2_age_input_page.dart';
import 'package:interview_test/widgets/survey_text.dart';
import 'package:interview_test/widgets/submit_button.dart';

class NameInputPage extends StatefulWidget {
  const NameInputPage({super.key});

  @override
  State<NameInputPage> createState() => _NameInputPageState();
}

class _NameInputPageState extends State<NameInputPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "Name",
      child: Center(
        child: Column(
          children: <Widget>[
            const Spacer(),
            const SurveyText(text: "Write your name:"),
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
                    builder: (context) => const AgeInputPage(),
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
