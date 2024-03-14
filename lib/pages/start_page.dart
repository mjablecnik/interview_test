import 'package:flutter/material.dart';
import 'package:interview_test/default_layout.dart';
import 'package:interview_test/pages/1_name_input_page.dart';
import 'package:interview_test/widgets/survey_text.dart';
import 'package:interview_test/widgets/submit_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "Simple Survey",
      child: Center(
        child: Column(
          children: <Widget>[
            const Spacer(),
            const SurveyText(text: "For start survey click on Start button:"),
            const Spacer(),
            SubmitButton(
              label: "Start",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NameInputPage(),
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
