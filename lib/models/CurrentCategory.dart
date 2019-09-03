import 'package:quiz_app/models/Category.dart';
import 'package:quiz_app/ui/widgets/Progress.dart';

class CurrentCategory{
  CurrentCategory(this.category, this.current, this.progress);

  final int current;
  final Category category;
  final Progress progress;
}
