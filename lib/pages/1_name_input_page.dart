import 'package:flutter/material.dart';
import 'package:interview_test/default_layout.dart';
import 'package:interview_test/pages/2_age_input_page.dart';
import 'package:interview_test/popup.dart';
import 'package:interview_test/widgets/survey_text.dart';
import 'package:interview_test/widgets/submit_button.dart';

class NameInputPage extends StatefulWidget {
  const NameInputPage({super.key});

  @override
  State<NameInputPage> createState() => _NameInputPageState();
}

class _NameInputPageState extends State<NameInputPage> {

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "Name",
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field is required";
                  }
                  return null;
                },
              ),
              const Spacer(),
              SubmitButton(
                label: "Continue",
                onPressed: () {
                  final result = formKey.currentState?.validate();
                  if (result == true) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AgeInputPage(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
