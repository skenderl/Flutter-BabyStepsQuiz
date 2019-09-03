import 'package:quiz_app/models/Category.dart';
import 'package:quiz_app/models/Quiz.dart';

class Strings {
  Strings._();

  static String categoryMenu ="Categories";
  static String correct = "Correct";
  static String wrong = "Wrong";
  static String next = "Next";
  static String result = "Result";
  static String answer = "Answer";
  static String win = "Good Job all correct !";
  static String loose = "Good luck next time !";
  static String playAgain = "Play Again";
  static const List<String> animals = [
    'Cow',
    'Dog',
    'Duck',
    'Elephant',
    'Bull',
    'Giraffe',
    'Lion',
    'Monkey',
    'Mouse',
    'Tiger'
  ];
  static const List<String> weathers = [
    'Cloud',
    'Cloudy',
    'Lightning',
    'Moon',
    'Rain',
    'Rainbow',
    'Rainy',
    'Snow',
    'Snowy',
    'Sun'
  ];
  static const List<String> foods = [
    'Apple',
    'Bread',
    'Cheese',
    'Donut',
    'Egg',
    'Fries',
    'Grapes',
    'Mushroom',
    'Pizza',
    'Steak'
  ];
  static const List<String> flags = [
    'Belgium',
    'France',
    'Germany',
    'Iceland',
    'Ireland',
    'Italy',
    'Japan',
    'Netherlands',
    'Russia',
    'Sweden'
  ];
  static const List<String> transportations = [
    'Airplane',
    'Ambulance',
    'Boat',
    'Car',
    'Helicopter',
    'Metro',
    'Rocket',
    'Scooter',
    'Ship',
    'Truck'
  ];
  static const List<String> jobs = [
    'Artist',
    'Astronaut',
    'Cook',
    'Doctor',
    'Farmer',
    'Firefighter',
    'Judge',
    'Pilot',
    'Scientist',
    'Singer'
  ];

  static getCategory(String name) {
    Category category;
    List<Quiz> quizs = List<Quiz>();

    switch (name) {
      case 'animal':
        for (var i = 0; i < animals.length; i++) {
          quizs.add(Quiz(animals[i], animals,
              "assets/images/animals/" + animals[i] + ".svg"));
        }
        category =
            new Category('Animals', 'What is this animal called ?', quizs);
        return category;
      case 'weather':
        for (var i = 0; i < weathers.length; i++) {
          quizs.add(Quiz(weathers[i], weathers,
              "assets/images/weathers/" + weathers[i] + ".svg"));
        }
        category = new Category('Weathers', 'What is this called ?', quizs);
        return category;
      case 'food':
        for (var i = 0; i < foods.length; i++) {
          quizs.add(Quiz(
              foods[i], foods, "assets/images/foods/" + foods[i] + ".svg"));
        }
        category = new Category('Foods', 'What is this food called ?', quizs);
        return category;
      case 'flag':
        for (var i = 0; i < flags.length; i++) {
          quizs.add(Quiz(
              flags[i], flags, "assets/images/flags/" + flags[i] + ".svg"));
        }
        category =
            new Category('Countries', 'What is this country Named ?', quizs);
        return category;
      case 'transportation':
        for (var i = 0; i < transportations.length; i++) {
          quizs.add(Quiz(transportations[i], transportations,
              "assets/images/transportations/" + transportations[i] + ".svg"));
        }
        category = new Category(
            'Transportations', 'What is this transportation called ?', quizs);
        return category;
      case 'job':
        for (var i = 0; i < jobs.length; i++) {
          quizs.add(Quiz(
              jobs[i],
              jobs,
              "assets/images/jobs/male/" + jobs[i] + "_male.svg",
              "assets/images/jobs/female/" + jobs[i] + "_female.svg"));
        }
        category = new Category('Jobs', 'What is this job called ?', quizs);
        return category;
    }
  }
}
