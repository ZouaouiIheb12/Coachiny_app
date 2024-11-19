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
            // Titre principal
            Text(
              'About You',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Description
            Text(
              'We want to know more about you, follow the next steps to complete the information',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 32),
            // Liste des options d'expérience
            ExperienceOptions(),
            Spacer(),
            // Boutons de navigation
            NavigationButtons(),
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
      children: viewModel.experienceLevels.asMap().entries.map((entry) {
        int idx = entry.key;
        ExperienceLevel experience = entry.value;
        bool isSelected = idx == viewModel.selectedIndex;

        return GestureDetector(
          onTap: () => viewModel.selectExperience(idx),
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

// Widget pour les boutons de navigation
class NavigationButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AboutYouViewModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Bouton "Retour"
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
          onPressed: viewModel.isNextEnabled() // Bouton "Suivant"
              ? () {
                  Navigator.pushNamed(
                      context, '/nextPage'); // Naviguer vers la page suivante
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
