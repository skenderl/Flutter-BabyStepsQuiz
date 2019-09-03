import 'package:quiz_app/models/Quiz.dart';

class Category {
  Category(this.name, this.question, List<Quiz> others) {
    others.shuffle();
    quizs = others;
  }
  String question;
  String name;
  List<Quiz> quizs;
}
