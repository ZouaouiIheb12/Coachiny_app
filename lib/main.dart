import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewModels/about_you.dart'; // Importez le ViewModel
import 'views/page_accueil.dart';
import 'views/about_you.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AboutYouViewModel()), // Fournit AboutYouViewModel
      ],
      child: CoachinyApp(),
    ),
  );
}

class CoachinyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coachiny',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PageAccueil(), // Page d'accueil
        '/aboutYou': (context) => AboutYou(), // Page "About You"
        // Ajoutez ici d'autres routes si nécessaire
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
