import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();
  SharedPreferences prefs;
  Function goToTab;

  @override
  void initState() {
    super.initState();
    //var size = MediaQuery.of(context).size;

    slides.add(
      new Slide(
        title: " 🇬🇧 🇫🇷 🇪🇸 🇹🇳 ",
        description: "Select your language !",
        pathImage: "assets/images/intros/lang.png",
        colorBegin: Color(0xffFFDAB9),
        colorEnd: Color(0xff40E0D0),
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
      ),
    );
    slides.add(
      new Slide(
        title: "Category",
        description: "Select a category !",
        pathImage: "assets/images/intros/categ.png",
        colorBegin: Colors.redAccent,
        colorEnd: Colors.pink,
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
      ),
    );
    slides.add(
      new Slide(
        title: "Win",
        description: "Answer all correct and complete !",
        pathImage: "assets/images/intros/win.png",
        colorBegin: Colors.purpleAccent,
        colorEnd: Colors.red,
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
      ),
    );
    slides.add(
      new Slide(
        title: "Reward Badge",
        description: "Get a reward badge for every category you complete !",
        pathImage: "assets/images/intros/rew.png",
        colorBegin: Colors.deepOrange,
        colorEnd: Colors.amber,
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
      ),
    );
    slides.add(
      new Slide(
        title: "Progress",
        description: "View your progress in every language !",
        pathImage: "assets/images/intros/prog.png",
        colorBegin: Colors.yellow,
        colorEnd: Colors.lightGreen,
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
      ),
    );
  }

  void onDonePress() async {
    prefs = await SharedPreferences.getInstance();
      prefs.setBool('intro', true);
      Navigator.of(context).pushNamed('/Home');

  }

  List<Widget> renderListCustomTabs(Size size) {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: currentSlide.backgroundColor != null
                    ? [currentSlide.backgroundColor, currentSlide.backgroundColor]
                    : [
                        currentSlide.colorBegin ?? Colors.amberAccent,
                        currentSlide.colorEnd ?? Colors.amberAccent
                      ],
                    begin: currentSlide.directionColorBegin ?? Alignment.topLeft,
                    end: currentSlide.directionColorEnd ?? Alignment.bottomRight,
                  ),
                ),
          child: Container(
            margin: EdgeInsets.only(bottom: 60.0),
            child: ListView(
              children: <Widget>[
                Container(
                  // Title
                  child: Text(
                        currentSlide.title ?? "",
                        style: currentSlide.styleTitle ??
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                  margin: EdgeInsets.only(
                          top: 70.0, bottom: 50.0, left: 20.0, right: 20.0),
                ),

                // Image or Center widget
                GestureDetector(
                  child: Image.asset(
                          currentSlide.pathImage,
                          width: size.width * 0.8,
                          height: size.height * 0.6,
                          fit: currentSlide.foregroundImageFit ?? BoxFit.contain,
                        ),
                ),

                // Description
                Container(
                  child: Text(
                        currentSlide.description ?? "",
                        style: currentSlide.styleDescription ??
                            TextStyle(color: Colors.white, fontSize: 18.0),
                        textAlign: TextAlign.center,
                        maxLines: 100,
                        overflow: TextOverflow.ellipsis,
                      ),
                  margin: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
                ),
              ],
            ),
          ),
        )

      );
    }
    return tabs;
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,

      listCustomTabs: this.renderListCustomTabs(size),
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },
    );
  }
}
