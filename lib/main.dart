import 'package:coachiny_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/page_accueil.dart';
import 'views/about_you.dart';
import 'viewmodels/login_view_model.dart';
import 'viewmodels/register_view_model.dart';
import 'viewmodels/about_you.dart';
import 'views/login_view.dart';
import 'views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation Firebase avec gestion des erreurs
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Erreur lors de l\'initialisation de Firebase : $e');
    // Vous pouvez ajouter ici une gestion avancée des erreurs, comme un logger
  }

  // Lancement de l'application
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AboutYouViewModel()),
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
        '/': (context) => PageAccueil(),
        '/aboutYou': (context) => AboutYou(),
        '/Login': (context) => LoginView(),
        '/register': (context) => RegisterView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
