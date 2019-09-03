class Quiz {
  Quiz(this.correct, List<String> others, this.image, [this.secondImage]) {
    others = List.from(others);
    others.remove(correct);
    others = others.sublist(0, 3);
    others.add(correct);
    others.shuffle();
    others.shuffle();
    candidates = others;
  }

  String correct;
  String image;
  String secondImage;
  List<String> candidates;
}
