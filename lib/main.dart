import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewModels/about_you.dart'; // Importez le ViewModel
import 'views/page_accueil.dart';
import 'views/about_you.dart';
import 'viewmodels/login_view_model.dart';
import 'viewmodels/register_view_model.dart';
import 'views/login_view.dart';
import 'views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AboutYouViewModel()), // Fournit AboutYouViewModel
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
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
        '/login': (context) => LoginView(), // Route login
        '/register': (context) => RegisterView(),
        // Ajoutez ici d'autres routes si nécessaire
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
