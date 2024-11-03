import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/experience_model.dart';
import '../viewmodels/about_you.dart';


class AboutYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AboutYouViewModel>(context); 

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About You',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We want to know more about you, follow the next steps to complete the information',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 32),
            ExperienceOptions(),
            Spacer(),
            NavigationButtons(), // Utilisation du widget NavigationButtons ici
          ],
        ),
      ),
    );
  }
}

// Widget pour afficher les options d'expérience
class ExperienceOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AboutYouViewModel>(context);

    return Column(
      children: viewModel.ExperienceLevels.asMap().entries.map((entry) {
        int idx = entry.key;
        ExperienceLevel experience = entry.value;
        bool isSelected = idx == viewModel.selectedIndex;

        return GestureDetector(
          onTap: () => viewModel.selectedExperience(idx),
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.grey[850],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  experience.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  experience.description,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// Widget NavigationButtons pour les boutons "Retour" et "Suivant"
class NavigationButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AboutYouViewModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Bouton Retour
          },
          child: Text(
            'Retour',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: viewModel.isNextEnabled() // Bouton Suivant
              ? () {
                  // Action pour passer à la prochaine page
                  Navigator.pushNamed(context, '/nextPage'); // Assurez-vous de définir '/nextPage' dans vos routes
                }
              : null,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text('Suivant'),
        ),
      ],
    );
  }
}
