import 'package:flutter/material.dart';
import 'package:interview_test/default_layout.dart';
import 'package:interview_test/pages/finish_page.dart';
import 'package:interview_test/widgets/survey_text.dart';
import 'package:interview_test/widgets/submit_button.dart';

class BioInputPage extends StatefulWidget {
  const BioInputPage({super.key});

  @override
  State<BioInputPage> createState() => _BioInputPageState();
}

class _BioInputPageState extends State<BioInputPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "Bio",
      child: Center(
        child: Column(
          children: <Widget>[
            const Spacer(),
            const SurveyText(text: "Write your bio:"),
            const SizedBox(height: 30),
            TextFormField(
              style: const TextStyle(fontSize: 20),
              minLines: 3,
              maxLines: 20,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const Spacer(),
            SubmitButton(
              label: "Finish",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FinishPage(),
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
