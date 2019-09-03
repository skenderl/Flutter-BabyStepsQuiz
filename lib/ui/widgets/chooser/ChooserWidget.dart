import 'package:flutter/material.dart';
import 'package:quiz_app/ui/widgets/chooser/ArcChooser.dart';
import 'package:quiz_app/ui/widgets/chooser/ChooserPainter.dart';


class ChooserWidget extends StatefulWidget {
  List<String> arcNames;

  @override
  State<StatefulWidget> createState() {
    return _ChooserWidgetState(arcNames);
  }
}

class _ChooserWidgetState extends State<ChooserWidget>
    with TickerProviderStateMixin {
  final PageController pageControl = new PageController(
    initialPage: 2,
    keepPage: false,
    viewportFraction: 0.2,
  );

  _ChooserWidgetState(List<String> arcNames) {
    this.arcNames = arcNames;
  }

  int slideValue = 200;
  int lastAnimPosition = 2;
  int answer = 2;

  AnimationController animation;

  List<String> arcNames;


  Color startColor;
  Color endColor;

  @override
  void initState() {
    super.initState();


    startColor = Color(0xFF21e1fa);
    endColor = Color(0xff3bb8fd);

    animation = new AnimationController(
      value: 0.0,
      lowerBound: 0.0,
      upperBound: 400.0,
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..addListener(() {
        setState(() {
          slideValue = animation.value.toInt();
          double ratio;

          if (slideValue <= 100) {
            ratio = animation.value / 100;
            startColor =
                Color.lerp(Color(0xFFfe0944), Color(0xFFF9D976), ratio);
            endColor =
                Color.lerp(Color(0xFFfeae96), Color(0xfff39f86), ratio);
          } else if (slideValue <= 200) {
            ratio = (animation.value - 100) / 100;
            startColor =
                Color.lerp(Color(0xFFF9D976), Color(0xFF21e1fa), ratio);
            endColor =
                Color.lerp(Color(0xfff39f86), Color(0xff3bb8fd), ratio);
          } else if (slideValue <= 300) {
            ratio = (animation.value - 200) / 100;
            startColor =
                Color.lerp(Color(0xFF21e1fa), Color(0xFF3ee98a), ratio);
            endColor =
                Color.lerp(Color(0xff3bb8fd), Color(0xFF41f7c7), ratio);
          } else if (slideValue <= 400) {
            ratio = (animation.value - 300) / 100;
            startColor =
                Color.lerp(Color(0xFF3ee98a), Color(0xFFfe0944), ratio);
            endColor =
                Color.lerp(Color(0xFF41f7c7), Color(0xFFfeae96), ratio);
          }
        });
      });

    animation.animateTo(slideValue.toDouble());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
                                  color: Colors.red,
                                  width: size.width,
                                  child:ArcChooser()
                                    ..arcNames = arcNames
                                    ..arcSelectedCallback = (int pos, ArcItem item) {
                                      int animPosition = pos - 2;
                                      if (animPosition > 3) {
                                        animPosition = animPosition - 4;
                                      }

                                      if (animPosition < 0) {
                                        animPosition = 4 + animPosition;
                                      }

                                      if (lastAnimPosition == 3 && animPosition == 0) {
                                        animation.animateTo(4 * 100.0);
                                      } else if (lastAnimPosition == 0 && animPosition == 3) {
                                        animation.forward(from: 4 * 100.0);
                                        animation.animateTo(animPosition * 100.0);
                                      } else if (lastAnimPosition == 0 && animPosition == 1) {
                                        animation.forward(from: 0.0);
                                        animation.animateTo(animPosition * 100.0);
                                      } else {
                                        animation.animateTo(animPosition * 100.0);
                                      }

                                      lastAnimPosition = animPosition;
                                      setState(() {
                                        answer = lastAnimPosition;
                                      });
                                    },
                                );

  }
}
