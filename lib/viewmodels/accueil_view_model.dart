import 'package:coachiny_app/views/login_view.dart';
import 'package:coachiny_app/views/about_you.dart';
import 'package:flutter/material.dart';
// accueil_view_model.dart

class AccueilViewModel extends ChangeNotifier {
  void onTryNowPressed(BuildContext context) {
    Navigator.pushNamed(context, '/aboutYou'); // Utilisation des routes nommées
  }

  void onLoginPressed(BuildContext context) {
    Navigator.pushNamed(context, '/Login'); // Utilisation des routes nommées
  }
}
