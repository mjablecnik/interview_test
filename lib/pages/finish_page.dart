import 'package:flutter/material.dart';
import 'package:interview_test/default_layout.dart';
import 'package:interview_test/pages/start_page.dart';
import 'package:interview_test/widgets/survey_text.dart';
import 'package:interview_test/widgets/submit_button.dart';

class FinishPage extends StatelessWidget {
  const FinishPage({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultLayout(
      title: "Finish survey",
      child: Center(
        child: Column(
          children: <Widget>[
            const Spacer(),
            const SurveyText(text: "Thank you for survey."),
            const SizedBox(height: 80),
            const SurveyText(text: "Your results are:"),
            const SizedBox(height: 20),
            const SurveyText(text: "Name: ???"),
            const SurveyText(text: "Age: ???"),
            const SurveyText(text: "Bio: ???"),
            const Spacer(),
            SubmitButton(
              label: "Return to start",
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const StartPage(),
                  ),
                  ModalRoute.withName('/'),
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
