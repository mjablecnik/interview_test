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
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "Age",
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field is required";
                  }
                  try {
                    final age = int.parse(value);
                    if (age < 0 || age > 150) {
                      return "Number can be value from 0 to 150";
                    }
                  } catch (e) {
                    return "Field must contain number";
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
                        builder: (context) => const BioInputPage(),
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
