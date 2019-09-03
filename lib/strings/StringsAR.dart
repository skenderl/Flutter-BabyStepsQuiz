import 'package:quiz_app/models/Category.dart';
import 'package:quiz_app/models/Quiz.dart';
import 'package:quiz_app/strings/SVGs.dart';

class StringsAR {
  StringsAR._();

  static String categoryMenu ="فئاة";
  static String correct = "صحيح";
  static String wrong = "خاطئ";
  static String next = "التالي";
  static String result = "نتيجة";
  static String answer = "أجب";
  static String win = "! عمل الجيد الكل صحيح";
  static String loose = "! حظ سعيد في المرة القادمة";
  static String playAgain = "العب مرة أخرى";
  static const List<String> animals = [
    'بقرة',
    'كلب',
    'بطة',
    'فيل',
    'ثور',
    'زرافة',
    'أسد',
    'قرد',
    'فأر',
    'نمر'
  ];
  static const List<String> weathers = [
    'غيم',
    'غائم',
    'برق',
    'القمر',
    'تمطر',
    'قوس قزح',
    'مطر',
    'ثلج',
    'مثلج',
    'شمس'
  ];
  static const List<String> foods = [
    'تفاحة',
    'خبز',
    'جبن',
    'كعكة',
    'بيضة',
    'بطاطا',
    'عنب',
    'فطر',
    'بيتزا',
    'لحم'
  ];
  static const List<String> flags = [
    'بلجيكا',
    'فرنسا',
    'ألمانيا',
    'أيسلندا',
    "أيرلندا",
    'إيطاليا',
    'اليابان',
    'هولندا',
    'روسيا',
    'السويد'
  ];
  static const List<String> transportations = [
    'طائرة',
    'سياره اسعاف',
    'قارب',
    'سيارة',
    'طائرة عامودية',
    'قطار',
    'صاروخ',
    'دراجة بخارية ',
    'سفينة',
    'شاحنة'
  ];
  static const List<String> jobs = [
    'فنان',
    'رائد فضاء',
    'طباخ',
    'طبيب',
    'فلاح',
    'إطفائي',
    'قاضي',
    'قائد الطائرة',
    'عالم',
    'مغني'
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
            new Category('الحيوانات', 'ماذا يسمى هذا الحيوان؟', quizs);
        return category;
      case 'weather':
        for (var i = 0; i < weathers.length; i++) {
          quizs.add(Quiz(weathers[i], weathers,
              "assets/images/weathers/" + weathersSVG[i] + ".svg"));
        }
        category = new Category('طقس', 'ماذا يدعى ؟', quizs);
        return category;
      case 'food':
        for (var i = 0; i < foods.length; i++) {
          quizs.add(Quiz(
              foods[i], foods, "assets/images/foods/" + foodsSVG[i] + ".svg"));
        }
        category = new Category('طعام', 'ماذا يسمى هذا الطعام؟', quizs);
        return category;
      case 'flag':
        for (var i = 0; i < flags.length; i++) {
          quizs.add(Quiz(
              flags[i], flags, "assets/images/flags/" + flagsSVG[i] + ".svg"));
        }
        category =
            new Category('بلدان', 'ما اسم هذا البلد؟', quizs);
        return category;
      case 'transportation':
        for (var i = 0; i < transportations.length; i++) {
          quizs.add(Quiz(transportations[i], transportations,
              "assets/images/transportations/" + transportationsSVG[i] + ".svg"));
        }
        category = new Category(
            'نقل', 'ماذا يسمى هذا النقل؟', quizs);
        return category;
      case 'job':
        for (var i = 0; i < jobs.length; i++) {
          quizs.add(Quiz(
              jobs[i],
              jobs,
              "assets/images/jobs/male/" + jobsSVG[i] + "_male.svg",
              "assets/images/jobs/female/" + jobsSVG[i] + "_female.svg"));
        }
        category = new Category('وظائف', 'ماذا يسمى هذا العمل؟', quizs);
        return category;
    }
  }
}
