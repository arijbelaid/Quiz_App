import 'package:flutter/material.dart';

class Acceuil extends StatelessWidget {
  const Acceuil({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
        children: [
          Text(
            "Bienvenue ",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: 100),
          Image.asset(
            'assets/img/login.png',
            width: 300, // Largeur réduite de l'image
            height: 200, // Hauteur réduite de l'image
            fit: BoxFit.cover,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/QuizPage'); // Navigate to QuizPage
            },
            child: Text(
              "Entrer",
              style: TextStyle(
                fontSize: 30,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
