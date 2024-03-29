import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class SurveyModel {
  SurveyModel({this.name, this.age, this.bio});

  String? name;
  int? age;
  String? bio;

  copyWith({String? name, int? age, String? bio}) {
    return SurveyModel(
      name: name ?? this.name,
      age: age ?? this.age,
      bio: bio ?? this.bio,
    );
  }
}

class Survey extends InheritedWidget {
  Survey({super.key, required super.child});

  final ValueNotifier<SurveyModel> state = ValueNotifier(SurveyModel());

  static Survey of(BuildContext context) {
    final Survey? result = context.dependOnInheritedWidgetOfExactType<Survey>();
    assert(result != null, 'No Survey found in context');
    return result!;
  }

  updateName(String name) => state.value = state.value.copyWith(name: name);

  updateAge(int age) => state.value = state.value.copyWith(age: age);

  updateBio(String bio) => state.value = state.value.copyWith(bio: bio);

  reset() => state.value = SurveyModel();

  @override
  bool updateShouldNotify(Survey oldWidget) {
    return true;
  }
}
