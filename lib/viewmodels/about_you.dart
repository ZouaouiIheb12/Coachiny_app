import 'package:flutter/material.dart';
import '../models/experience_model.dart';

// ViewModel pour gérer la logique de la page "About You"
class AboutYouViewModel extends ChangeNotifier {
  // Liste des niveaux d'expérience
  List<ExperienceLevel> _experienceLevels = [
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
  List<ExperienceLevel> get experienceLevels => _experienceLevels;

  // Index de l'expérience sélectionnée
  int _selectedIndex = -1;
  int get selectedIndex => _selectedIndex;

  // Méthode pour sélectionner un niveau d'expérience
  void selectExperience(int index) {
    _selectedIndex = index;
    notifyListeners(); // Notifie les widgets écoutant ce ViewModel
  }

  // Vérifie si le bouton "Suivant" doit être activé
  bool isNextEnabled() {
    return _selectedIndex != -1;
  }
}
