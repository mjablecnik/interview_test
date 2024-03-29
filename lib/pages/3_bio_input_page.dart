import 'package:flutter/material.dart';
import 'package:interview_test/default_layout.dart';
import 'package:interview_test/pages/finish_page.dart';
import 'package:interview_test/survey.dart';
import 'package:interview_test/widgets/survey_text.dart';
import 'package:interview_test/widgets/submit_button.dart';

class BioInputPage extends StatefulWidget {
  const BioInputPage({super.key});

  @override
  State<BioInputPage> createState() => _BioInputPageState();
}

class _BioInputPageState extends State<BioInputPage> {

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
      title: "Bio",
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                maxLength: 1000,
                controller: controller,
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
                label: "Finish",
                onPressed: () {
                  final result = formKey.currentState?.validate();
                  if (result == true) {
                    Survey.of(context).updateBio(controller.text);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const FinishPage(),
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
