import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quiz_app/models/Category.dart';
import 'package:quiz_app/models/CurrentCategory.dart';
import 'package:quiz_app/models/Categories.dart';
import 'package:quiz_app/strings/StringsLoader.dart';
import 'package:quiz_app/ui/widgets/Progress.dart';

class CategoryMenuScreen extends StatefulWidget {
  @override
  _CategoryMenuScreenState createState() => _CategoryMenuScreenState();
}

class _CategoryMenuScreenState extends State<CategoryMenuScreen> {
  final PageController viewController =
      PageController(viewportFraction: 0.8, initialPage: 0);

String lang = "";
SharedPreferences prefs;
StringsLoader myStrings;

initState() {
  super.initState();
  SharedPreferences.getInstance().then((SharedPreferences sp) {
       prefs = sp;
       lang = sp.getString('lang');
       if (lang == null) {
         lang = "";
         persistLang(lang);
       }
       setState(() {});
     });
}

void persistLang(String value) {
setState(() {
  lang = value;
});
prefs?.setString('lang', value);
}

  @override
  Widget build(BuildContext context) {
    myStrings = new StringsLoader(lang);
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) - 220;

    return Center(
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
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "${myStrings.loadCategoryMenu()}",
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
              Container(
                color: Colors.transparent,
                height: size.height * 0.04,
              ),
              Expanded(
                child: Container(
                  height: itemHeight,
                  child: PageView(
                    controller: viewController,
                    children: [
                      CategoryCard(Categories.Animal,myStrings),
                      CategoryCard(Categories.Job,myStrings),
                      CategoryCard(Categories.Weather,myStrings),
                      CategoryCard(Categories.Food,myStrings),
                      CategoryCard(Categories.Transportation,myStrings),
                      CategoryCard(Categories.Flag,myStrings),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: size.height * 0.04,
              ),
            ],
          ),
        ),
      ),
    ]));
  }

  void dispose() {
    super.dispose();
    viewController.dispose();
  }
}

class CategoryCard extends StatefulWidget {
  Categories category;
  String categoryName;
  String animationPath;
  StringsLoader myStrings;

  CategoryCard(this.category,this.myStrings) {
    switch (category) {
      case Categories.Animal:
        categoryName = myStrings.loadCategories("animal").name;
        animationPath = "assets/animations/animal_animation.flr";
        break;
      case Categories.Food:
        categoryName = myStrings.loadCategories("food").name;
        animationPath = "assets/animations/food_animation.flr";
        break;
      case Categories.Transportation:
        categoryName = myStrings.loadCategories("transportation").name;
        animationPath = "assets/animations/transportation_animation.flr";
        break;
      case Categories.Flag:
        categoryName = myStrings.loadCategories("flag").name;
        animationPath = "assets/animations/flag_animation.flr";
        break;
      case Categories.Job:
        categoryName = myStrings.loadCategories("job").name;
        animationPath = "assets/animations/job_animation.flr";
        break;
      case Categories.Weather:
        categoryName = myStrings.loadCategories("weather").name;
        animationPath = "assets/animations/weather_animation.flr";
        break;
    }
  }

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  SharedPreferences prefs;
  bool _award = true;

  initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
         prefs = sp;
         _award = sp.containsKey(widget.categoryName);
         if (_award == null) {
           _award = false;
           persist(_award);
         }
         setState(() {});
       });
  }
  void persist(bool value) {
    setState(() {
      _award = value;
    });
    prefs?.setBool(widget.categoryName, value);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 8.0,
        color: Colors.purple,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 8, color: Colors.white),
          ),
          child: InkWell(
            onTap: () {
              Category category;
              List<ProgressKind> prog = new List<ProgressKind>.filled(10,ProgressKind.notYet);
              if (widget.category == Categories.Animal) {
                category = widget.myStrings.loadCategories('animal');
                Navigator.of(context).pushNamed(
                  '/Category',
                  arguments: CurrentCategory(category,0,Progress(progress: prog)),
                );
              } else if (widget.category == Categories.Food) {
                category = widget.myStrings.loadCategories('food');
                Navigator.of(context).pushNamed(
                  '/Category',
                  arguments: CurrentCategory(category,0,Progress(progress: prog)),
                );
              } else if (widget.category == Categories.Transportation) {
                category = widget.myStrings.loadCategories('transportation');
                Navigator.of(context).pushNamed(
                  '/Category',
                  arguments: CurrentCategory(category,0,Progress(progress: prog)),
                );
              } else if (widget.category == Categories.Flag) {
                category = widget.myStrings.loadCategories('flag');
                Navigator.of(context).pushNamed(
                  '/Category',
                  arguments: CurrentCategory(category,0,Progress(progress: prog)),
                );
              } else if (widget.category == Categories.Job) {
                category = widget.myStrings.loadCategories('job');
                Navigator.of(context).pushNamed(
                  '/Category',
                  arguments: CurrentCategory(category,0,Progress(progress: prog)),
                );
              } else {
                category = widget.myStrings.loadCategories('weather');
                Navigator.of(context).pushNamed(
                  '/Category',
                  arguments: CurrentCategory(category,0,Progress(progress: prog)),
                );
              }
            },
            splashColor: Colors.indigo,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    widget.categoryName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.07,
                    ),
                  ),
                  _award
                  ? Container(
                    height:size.height * 0.1,
                    child:SvgPicture.asset('assets/images/award.svg'),
                  ) : SizedBox(),
                  Container(
                    height: 300,
                    child: FlareActor(
                      widget.animationPath,
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: "animate",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
