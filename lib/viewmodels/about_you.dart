import 'package:flutter/material.dart';
import '../models/experience_model.dart';
import 'package:flutter/foundation.dart';

class AboutYouViewModel extends ChangeNotifier {
  List<ExperienceLevel> ExperienceLevels = [
    ExperienceLevel(title: "I'm Beginner", description: "I have trained several times"),
    ExperienceLevel(title: "I'm Expert", description: "I have trained more times"),
  ];
  int _selectedIndex = -1;
  int get selectedIndex => _selectedIndex;

  void selectedExperience(int index){
    _selectedIndex = index;
    notifyListeners();
  }

  bool isNextEnabled() {
    return _selectedIndex != -1;
  }
}