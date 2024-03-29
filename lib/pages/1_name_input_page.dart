import 'package:flutter/material.dart';
import 'package:interview_test/default_layout.dart';
import 'package:interview_test/pages/2_age_input_page.dart';
import 'package:interview_test/survey.dart';
import 'package:interview_test/widgets/survey_text.dart';
import 'package:interview_test/widgets/submit_button.dart';

class NameInputPage extends StatefulWidget {
  const NameInputPage({super.key});

  @override
  State<NameInputPage> createState() => _NameInputPageState();
}

class _NameInputPageState extends State<NameInputPage> {

  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    formKey.currentState?.dispose();
    controller.dispose();
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
                controller: controller,
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
                    Survey.of(context).updateName(controller.text);
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
