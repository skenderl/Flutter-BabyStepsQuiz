import 'package:quiz_app/models/Category.dart';
import 'package:quiz_app/models/Quiz.dart';
import 'package:quiz_app/strings/SVGs.dart';

class StringsFR {
  StringsFR._();

  static String categoryMenu ="Catégories";
  static String correct = "Correct";
  static String wrong = "Faux";
  static String next = "Suivant";
  static String result = "Résultat";
  static String answer = "Répondre";
  static String win = "Bon travail tout est correct!";
  static String loose = "Bonne chance la prochaine fois!";
  static String playAgain = "Rejouer";
  static const List<String> animals = [
    'Vache',
    'Chien',
    'Canard',
    'Eléphant',
    'Taureau',
    'Girafe',
    'Lion',
    'Singe',
    'Souris',
    'Tigre'
  ];
  static const List<String> weathers = [
    'Nuage',
    'Nuageux',
    'Foudre',
    'Lune',
    'Pluie',
    'Arc en ciel',
    'Pluvieux',
    'Neige',
    'Neigeux',
    'Soleil'
  ];
  static const List<String> foods = [
    'Pomme',
    'Pain',
    'Fromage',
    'Donut',
    'Oeuf',
    'Frites',
    'Raisins',
    'Champignon',
    'Pizza',
    'Steak'
  ];
  static const List<String> flags = [
    'Belgique',
      'France',
      'Allemagne',
      'Islande',
      'Irlande',
      'Italie',
      'Japon',
      'Pays-Bas',
      'Russie',
      'Suède'
  ];
  static const List<String> transportations = [
    'Avion',
    'Ambulance',
    'Bateau',
    'Voiture',
    'Hélicoptère',
    'Métro',
    'Fusée',
    'Scooter',
    'Navire',
    'Camion'
  ];
  static const List<String> jobs = [
    'Artiste',
    'Astronaute',
    'Cuisinier',
    'Médecin',
    'Fermier',
    'Pompier',
    'Juge',
    'Pilote',
    'Scientifique',
    'Chanteur'
  ];

  static getCategory(String name) {
    Category category;
    List<Quiz> quizs = List<Quiz>();

    switch (name) {
      case 'animal':
        for (var i = 0; i < animals.length; i++) {
          quizs.add(Quiz(animals[i], animals,
              "assets/images/animals/" + animalsSVG[i] + ".svg"));
        }
        category =
            new Category('Animaux', 'Comment s\'appelle cet animal?', quizs);
        return category;
      case 'weather':
        for (var i = 0; i < weathers.length; i++) {
          quizs.add(Quiz(weathers[i], weathers,
              "assets/images/weathers/" + weathersSVG[i] + ".svg"));
        }
        category = new Category('Météo', 'Qu\'est-ce que c\'est ?', quizs);
        return category;
      case 'food':
        for (var i = 0; i < foods.length; i++) {
          quizs.add(Quiz(
              foods[i], foods, "assets/images/foods/" + foodsSVG[i] + ".svg"));
        }
        category = new Category('Nourriture', 'Comment s\'appelle cette nourriture?', quizs);
        return category;
      case 'flag':
        for (var i = 0; i < flags.length; i++) {
          quizs.add(Quiz(
              flags[i], flags, "assets/images/flags/" + flagsSVG[i] + ".svg"));
        }
        category =
            new Category('Pays', 'Quel est ce pays?', quizs);
        return category;
      case 'transportation':
        for (var i = 0; i < transportations.length; i++) {
          quizs.add(Quiz(transportations[i], transportations,
              "assets/images/transportations/" + transportationsSVG[i] + ".svg"));
        }
        category = new Category(
            'Transports', 'Comment s\'appelle ce transport?', quizs);
        return category;
      case 'job':
        for (var i = 0; i < jobs.length; i++) {
          quizs.add(Quiz(
              jobs[i],
              jobs,
              "assets/images/jobs/male/" + jobsSVG[i] + "_male.svg",
              "assets/images/jobs/female/" + jobsSVG[i] + "_female.svg"));
        }
        category = new Category('Métiers', 'Comment s\'appelle ce travail?', quizs);
        return category;
    }
  }
}
