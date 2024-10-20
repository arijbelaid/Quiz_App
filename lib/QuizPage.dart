import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Application Quiz",
      home: QuizPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  List<int> selectedAnswers = [];
final List<Question> questions = [
  Question("Quel est le langage de programmation utilisé pour le développement web côté serveur ?", [
    Answer("PHP", true),
    Answer("HTML", false),
    Answer("CSS", false),
  ]),
  Question("Quel est le système d'exploitation mobile développé par Google ?", [
    Answer("Android", true),
    Answer("iOS", false),
    Answer("Windows", false),
  ]),
  Question("Quel est le langage de programmation principalement utilisé pour le développement d'applications iOS ?", [
    Answer("Swift", true),
    Answer("Java", false),
    Answer("C#", false),
  ]),
  Question("Quel est le nom du modèle de données utilisé par MongoDB ?", [
    Answer("Documents", true),
    Answer("Tables", false),
    Answer("Colonnes", false),
  ]),
  Question("Quelle technologie est utilisée pour créer des pages web dynamiques ?", [
    Answer("JavaScript", true),
    Answer("Markdown", false),
    Answer("CSS", false),
  ]),
  Question("Quel est le terme utilisé pour désigner la capacité d'un système à traiter plusieurs tâches simultanément ?", [
    Answer("Multitâche", true),
    Answer("Unicore", false),
    Answer("Batch processing", false),
  ]),
  Question("Quel protocole est principalement utilisé pour sécuriser les communications sur Internet ?", [
    Answer("HTTPS", true),
    Answer("HTTP", false),
    Answer("FTP", false),
  ]),
  Question("Quelle base de données est connue pour son architecture relationnelle ?", [
    Answer("MySQL", true),
    Answer("MongoDB", false),
    Answer("Redis", false),
  ]),
  Question("Quel langage est principalement utilisé pour l'analyse de données et le machine learning ?", [
    Answer("Python", true),
    Answer("C++", false),
    Answer("Ruby", false),
  ]),
  Question("Quelle méthode de développement logiciel se concentre sur l'amélioration continue et l'efficacité ?", [
    Answer("Agile", true),
    Answer("Waterfall", false),
    Answer("V-Model", false),
  ]),
  // Questions supplémentaires
  Question("Quel est le principe fondamental de la programmation orientée objet ?", [
    Answer("Encapsulation", true),
    Answer("Compilation", false),
    Answer("Débogage", false),
  ]),
  Question("Quelle est la fonction principale d'un système d'exploitation ?", [
    Answer("Gérer les ressources matérielles", true),
    Answer("Créer des applications", false),
    Answer("Développer des sites web", false),
  ]),
  Question("Quel est le format de fichier utilisé pour stocker des images en haute qualité ?", [
    Answer("PNG", true),
    Answer("TXT", false),
    Answer("MP3", false),
  ]),
  Question("Quel algorithme est utilisé pour le tri des données ?", [
    Answer("QuickSort", true),
    Answer("StringSearch", false),
    Answer("FileSort", false),
  ]),
  Question("Quel langage est principalement utilisé pour le développement de jeux vidéo ?", [
    Answer("C#", true),
    Answer("HTML", false),
    Answer("SQL", false),
  ]),
  Question("Quelle est la principale différence entre un compilateur et un interpréteur ?", [
    Answer("Un compilateur traduit tout le code avant l'exécution", true),
    Answer("Un interpréteur exécute le code ligne par ligne", true),
    Answer("Les deux font la même chose", false),
  ]),
  Question("Quel est le rôle principal d'un serveur web ?", [
    Answer("Héberger des sites web", true),
    Answer("Stocker des données", false),
    Answer("Envoyer des emails", false),
  ]),
  Question("Quel protocole est utilisé pour envoyer des courriels ?", [
    Answer("SMTP", true),
    Answer("HTTP", false),
    Answer("FTP", false),
  ]),
  Question("Quelle est la principale fonction d'un pare-feu dans un réseau ?", [
    Answer("Contrôler le trafic entrant et sortant", true),
    Answer("Accélérer la connexion Internet", false),
    Answer("Stocker des fichiers", false),
  ]),
  Question("Quel terme désigne le stockage de données dans le cloud ?", [
    Answer("Cloud computing", true),
    Answer("Virtualisation", false),
    Answer("Big Data", false),
  ]),
];


  void selectAnswer(int index) {
    // Enregistrer l'index de la réponse sélectionnée
    selectedAnswers.add(index);

    // Passer à la question suivante ou finir le quiz si plus de questions
    if (currentQuestionIndex + 1 < questions.length) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      finishQuiz();
    }
  }

  void finishQuiz() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScorePage(
          score: calculateScore(),
          totalQuestions: questions.length,
        ),
      ),
    );
  }

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].answers[selectedAnswers[i]].isCorrect) {
        score++;
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Application de Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              question.text,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            for (int i = 0; i < question.answers.length; i++)
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: () => selectAnswer(i),
                  child: Text(
                    question.answers[i].text,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ScorePage({super.key, required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Score Final"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Votre score est : $score/$totalQuestions",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
               onPressed: () {
              
                Navigator.pushNamed(context,'/Acceuil',
                  
                );
              },
              child: const Text("Retour à l'accueil"),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String text;
  final List<Answer> answers;

  Question(this.text, this.answers);
}

class Answer {
  final String text;
  final bool isCorrect;

  Answer(this.text, this.isCorrect);
}
