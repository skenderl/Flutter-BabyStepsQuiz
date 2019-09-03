import 'package:quiz_app/models/Category.dart';
import 'package:quiz_app/models/Quiz.dart';
import 'package:quiz_app/strings/SVGs.dart';

class StringsES {
  StringsES._();

  static String categoryMenu ="Categorías";
  static String correct = "Correcto";
  static String wrong = "Incorrecto";
  static String next = "Siguiente";
  static String result = "Resultado";
  static String answer = "Responder";
  static String win = "Buen trabajo todo correcto!";
  static String loose = "Buena suerte la próxima vez !";
  static String playAgain = "Juega de nuevo";
  static const List<String> animals = [
    'Vaca',
    'Perro',
    'Pato',
    'Elefante',
    'Toro',
    'Jirafa',
    'León',
    'Mono',
    'Ratón',
    'Tigre'
  ];
  static const List<String> weathers = [
    'Nube',
    'Nublado',
    'Relámpago',
    'Luna',
    'Lluvia',
    'Arco iris',
    'Lluvioso',
    'Nieve',
    'Nevado',
    'Dom'
  ];
  static const List<String> foods = [
    'Manzana',
    'Un pan',
    'Queso',
    'Rosquilla',
    'Huevo',
    'Papas fritas',
    'Uvas',
    'Seta',
    'Pizza',
    'Filete'
  ];
  static const List<String> flags = [
    'Bélgica',
    'Francia',
    'Alemania',
    'Islandia',
    'Irlanda',
    'Italia',
    'Japón',
    'Países Bajos',
    'Rusia',
    'Suecia'
  ];
  static const List<String> transportations = [
    'Avión',
    'Ambulancia',
    'Bote',
    'Coche',
    'Helicóptero',
    'Metro',
    'Cohete',
    'Scooter',
    'Enviar',
    'Camión'
  ];
  static const List<String> jobs = [
    'Artista',
    'Astronauta',
    'Cocinar',
    'Médico',
    'Granjero',
    'Bombero',
    'Juez',
    'Piloto',
    'Científico',
    'Cantante'
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
            new Category('Animales', '¿Cómo se llama este animal?', quizs);
        return category;
      case 'weather':
        for (var i = 0; i < weathers.length; i++) {
          quizs.add(Quiz(weathers[i], weathers,
              "assets/images/weathers/" + weathersSVG[i] + ".svg"));
        }
        category = new Category('Climas', '¿Como se llama esto ?', quizs);
        return category;
      case 'food':
        for (var i = 0; i < foods.length; i++) {
          quizs.add(Quiz(
              foods[i], foods, "assets/images/foods/" + foodsSVG[i] + ".svg"));
        }
        category = new Category('Alimentos', '¿Cómo se llama esta comida?', quizs);
        return category;
      case 'flag':
        for (var i = 0; i < flags.length; i++) {
          quizs.add(Quiz(
              flags[i], flags, "assets/images/flags/" + flagsSVG[i] + ".svg"));
        }
        category =
            new Category('Países', '¿Cómo se llama este país?', quizs);
        return category;
      case 'transportation':
        for (var i = 0; i < transportations.length; i++) {
          quizs.add(Quiz(transportations[i], transportations,
              "assets/images/transportations/" + transportationsSVG[i] + ".svg"));
        }
        category = new Category(
            'Transportes', '¿Cómo se llama este transporte?', quizs);
        return category;
      case 'job':
        for (var i = 0; i < jobs.length; i++) {
          quizs.add(Quiz(
              jobs[i],
              jobs,
              "assets/images/jobs/male/" + jobsSVG[i] + "_male.svg",
              "assets/images/jobs/female/" + jobsSVG[i] + "_female.svg"));
        }
        category = new Category('Trabajos', '¿Cómo se llama este trabajo?', quizs);
        return category;
    }
  }
}
