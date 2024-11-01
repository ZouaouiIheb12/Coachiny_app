import 'package:flutter/material.dart';
import 'views/page_accueil.dart'; // Importez la page d'accueil

void main() {
  runApp(CoachinyApp());
}

class CoachinyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coachiny',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Couleur principale pour le thème
        brightness: Brightness.dark, // Utilisez un thème sombre
      ),
      home: PageAccueil(), // Définit la page d'accueil comme page principale
      debugShowCheckedModeBanner: false, // Supprime l'étiquette "debug" en haut à droite
    );
  }
}
