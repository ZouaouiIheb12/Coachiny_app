import 'package:flutter/material.dart';
import '../models/experience_model.dart';

class AboutYouViewModel extends ChangeNotifier {
  // Liste des niveaux d'expérience
  final List<ExperienceLevel> _experienceLevels;

  AboutYouViewModel()
      : _experienceLevels = [
          ExperienceLevel(
            title: "I'm Beginner",
            description: "I have trained several times",
          ),
          ExperienceLevel(
            title: "I'm Expert",
            description: "I have trained more times",
          ),
        ];

  // Getter pour récupérer les niveaux d'expérience
  List<ExperienceLevel> get experienceLevels =>
      List.unmodifiable(_experienceLevels);

  // Index de l'expérience sélectionnée
  int _selectedIndex = -1;
  int get selectedIndex => _selectedIndex;

  // Méthode pour sélectionner un niveau d'expérience
  void selectExperience(int index) {
    if (index < 0 || index >= _experienceLevels.length) {
      throw ArgumentError("Index out of range");
    }
    _selectedIndex = index;
    notifyListeners(); // Notifie les widgets écoutant ce ViewModel
  }

  // Vérifie si le bouton "Suivant" doit être activé
  bool get isNextEnabled => _selectedIndex != -1;
}
