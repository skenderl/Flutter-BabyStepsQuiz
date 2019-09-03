import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

import 'package:quiz_app/ui/widgets/chooser/ArcChooser.dart';
import 'package:quiz_app/ui/widgets/chooser/ChooserPainter.dart';
import 'package:quiz_app/ui/widgets/Progress.dart';

import 'package:quiz_app/models/Category.dart';
import 'package:quiz_app/models/Quiz.dart';
import 'package:quiz_app/models/CurrentCategory.dart';

import 'package:quiz_app/strings/StringsLoader.dart';


class CategoryScreen extends StatefulWidget {
  final CurrentCategory category;
  const CategoryScreen({
    Key key,
    this.category,
  }) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with TickerProviderStateMixin {
  final PageController pageControl = new PageController(
    initialPage: 2,
    keepPage: false,
    viewportFraction: 0.2,
  );

  String lang = "";
  SharedPreferences prefs;
  StringsLoader myStrings;

  int slideValue = 200;
  int lastAnimPosition = 2;
  int answer = 2;
  int quizPage;
  Quiz currentQuiz;
  int currentCorrect;
  List<String> currentCandidates;

  AnimationController animation;

  Category category;
  Progress currentProgress;

  Color startColor;
  Color endColor;

  getSecondImage(size){
    if (currentQuiz.secondImage != null){
    return SizedBox(
      width: size.width/2 - size.width * 0.005,
      height: size.height/3,
      child: SvgPicture.asset(
              currentQuiz.secondImage,
              semanticsLabel: currentQuiz.correct,
            ),
    );
    }else{
      return Container();
    }
  }

  getFirstImage(size){
    if (currentQuiz.secondImage != null){
    return Row(
      children: <Widget>[
        SizedBox(
      width: size.width/2 - size.width * 0.005,
      height: size.height/3,
      child: SvgPicture.asset(
              currentQuiz.image,
              semanticsLabel: currentQuiz.correct,
            ),
    ),
    Transform.rotate(
      angle: pi/20,
      child:Container(
      height: size.height/4,
      width: size.width * 0.01,
      color: Colors.white,
      ),
    ),
  ]);
    }else{
      return SvgPicture.asset(
                currentQuiz.image,
                semanticsLabel: currentQuiz.correct,
              );
    }
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
         prefs = sp;
         lang = sp.getString('lang');
         if (lang == null) {
           lang = "";
         }
         setState(() {});
       });
    category = widget.category.category;
    quizPage = widget.category.current;
    currentProgress = widget.category.progress;
    currentProgress.progress[quizPage] = ProgressKind.current;
    currentQuiz = category.quizs[quizPage];
    currentCorrect = (currentQuiz.candidates.indexOf(currentQuiz.correct)+1)==4 ?0:(currentQuiz.candidates.indexOf(currentQuiz.correct)+1);

    currentCandidates = currentQuiz.candidates;

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
            endColor = Color.lerp(Color(0xFFfeae96), Color(0xfff39f86), ratio);
          } else if (slideValue <= 200) {
            ratio = (animation.value - 100) / 100;
            startColor =
                Color.lerp(Color(0xFFF9D976), Color(0xFF21e1fa), ratio);
            endColor = Color.lerp(Color(0xfff39f86), Color(0xff3bb8fd), ratio);
          } else if (slideValue <= 300) {
            ratio = (animation.value - 200) / 100;
            startColor =
                Color.lerp(Color(0xFF21e1fa), Color(0xFF3ee98a), ratio);
            endColor = Color.lerp(Color(0xff3bb8fd), Color(0xFF41f7c7), ratio);
          } else if (slideValue <= 400) {
            ratio = (animation.value - 300) / 100;
            startColor =
                Color.lerp(Color(0xFF3ee98a), Color(0xFFfe0944), ratio);
            endColor = Color.lerp(Color(0xFF41f7c7), Color(0xFFfeae96), ratio);
          }
        });
      });

    animation.animateTo(slideValue.toDouble());
  }

  categoryCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(category.name, true);
  }

  @override
  Widget build(BuildContext context) {
    myStrings = new StringsLoader(lang);
    var size = MediaQuery.of(context).size;
    String ans = myStrings.loadAnswer();

    return WillPopScope(
        onWillPop: () async => false,
        child: Center(
        child: Stack(children: <Widget>[
      Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.deepPurpleAccent, Colors.redAccent]),
        ),
        child: FlareActor(
          "assets/animations/background_animation.flr",
          alignment: Alignment.center,
          fit: BoxFit.cover,
          animation: "animate",
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            category.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: Column(children: <Widget>[
                    Container(
                      color: Colors.white,
                      height: size.height * 0.05,
                      width: size.width,
                      child: currentProgress,
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      color: Colors.black,
                      height: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                    Container(
                      color: Colors.transparent,
                      height: size.height * 0.04,
                      width: size.width * 0.9,
                      child: FittedBox(
                        fit:BoxFit.contain,
                        child:Text(
                        category.question,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ),
                  ),Spacer(),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: size.width,
                      minWidth: size.width,
                      maxHeight: size.height / 3,
                      minHeight: size.height / 4,
                    ),
                    child: FittedBox(
                      fit:BoxFit.contain,
                      child:
                    Row(
                      children: <Widget>[
                        getFirstImage(size),
                        getSecondImage(size),
                      ],
                    ),),),

                    Spacer(),
                    Container(
                      color: Colors.transparent,
                      width: size.width,
                      child:
                    Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.transparent,
                          width: size.width,
                          child: ArcChooser()
                            ..arcNames = currentCandidates
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
                        ),
                        Positioned(
                          bottom: 0,
                          left: (size.width - size.width / 2) / 2,
                          child: InkWell(
                            onTap: () {
                              if(currentCorrect == answer){
                                  currentProgress.progress[quizPage] = ProgressKind.correct;
                              }else{
                                currentProgress.progress[quizPage] = ProgressKind.incorrect;
                              }
                              String res = currentCorrect == answer ? myStrings.loadResult(true) : myStrings.loadResult(false);
                              String nx = quizPage != currentProgress.progress.length-1 ? myStrings.loadNext(true) : myStrings.loadNext(false);
                              var anim = currentCorrect == answer ? 'success' : 'fail';
                              showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: WillPopScope(
                                            onWillPop: () async => false,
                                            child:Container(
                                          height: size.height/3,
                                          child:
                                          FittedBox(
                                            fit:BoxFit.contain,
                                            child:Column(
                                            children:<Widget>[
                                          Container(
                                            width:size.height/5,
                                            height:size.height/5,
                                            child:
                                            FlareActor(
                                              "assets/animations/$anim.flr",
                                              alignment: Alignment.center,
                                              fit: BoxFit.cover,
                                              animation: "animate",
                                            ),
                                          ),
                                          Container(
                                            color: Colors.black,
                                            height: 1,
                                            width: size.height/5,
                                          ),
                                          Text(
                                        '$res',
                                        style: TextStyle(color: Colors.black,fontSize: 30),
                                      ),
                                      Container(
                                        color: Colors.black,
                                        height: 1,
                                        width: size.height/10,
                                      ),
                                      FlatButton(
                                        color: Colors.transparent,
                                        textColor: Colors.orange,
                                        padding: EdgeInsets.all(8.0),
                                        splashColor: Colors.transparent,
                                        onPressed: () {
                                              if(quizPage != currentProgress.progress.length-1){
                                                Navigator.of(context).pushNamed(
                                                  '/Category',
                                                  arguments: CurrentCategory(category,quizPage+1,currentProgress),
                                                );
                                              }else{
                                                int corNum = currentProgress.progress.where((cor) => cor == ProgressKind.correct).length;
                                                if (corNum == 10) {
                                                  categoryCompleted();
                                                }
                                                Navigator.of(context).pushNamed(
                                                  '/Result',
                                                  arguments: corNum,
                                                );
                                            }
                                        },
                                        child: Text('$nx',
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 22,),
                                              ),


                                      ),
                                        ]
                                        ),
                                      ),
                                      ),
                                    ),
                                      );
                                    },
                              );
                          },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                                width: size.width / 2,
                                height: size.height * 0.135,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      new BoxShadow(
                                          color: Colors.grey,
                                          offset: new Offset(0.0, 0.0),
                                          blurRadius: 160.0,
                                          spreadRadius: 20.0)
                                    ],
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(99)),
                                child: Center(
                                  child: Text("$ans",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 38,
                                        shadows: [
                                              Shadow( // bottomLeft
                                        	offset: Offset(-1.5, -1.5),
                                        	color: Colors.black
                                              ),
                                              Shadow( // bottomRight
                                        	offset: Offset(1.5, -1.5),
                                        	color: Colors.black
                                              ),
                                              Shadow( // topRight
                                        	offset: Offset(1.5, 1.5),
                                        	color: Colors.black
                                              ),
                                              Shadow( // topLeft
                                        	offset: Offset(-1.5, 1.5),
                                        	color: Colors.black
                                              ),
                                        ],
                                        fontWeight: FontWeight.bold,
                                      )),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
),
);
  }
}
