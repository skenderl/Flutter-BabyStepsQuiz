import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quiz_app/strings/StringsLoader.dart';

class ResultScreen extends StatefulWidget {
  final int correct;
  const ResultScreen({
    Key key,
    this.correct,
  }) : super(key: key);
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

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
         }
         setState(() {});
       });
  }

  @override
  Widget build(BuildContext context) {
    myStrings = new StringsLoader(lang);
    var size = MediaQuery.of(context).size;
    String correct = widget.correct.toString();
    String incorrect = (10 - widget.correct).toString();
    String anim = widget.correct == 10 ? 'troph' : 'loss';
    String res = widget.correct == 10 ? myStrings.loadWinLoose(true) : myStrings.loadWinLoose(false);
    Color resColor = widget.correct == 10 ? Colors.amber : Colors.green;

    return WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Stack(
            children: <Widget>[
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
                    '${myStrings.loadNext(false)}',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                ),
                body: Column(
                  children: <Widget>[
                    Container(
                      width:size.width * 2/3,
                      height:size.height / 3,
                      child:
                      FlareActor(
                        "assets/animations/$anim.flr",
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        animation: "animate",
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      height: size.height * 0.08,
                      width: size.width* 0.9 ,
                      child: FittedBox(
                        fit:BoxFit.contain,
                        child:
                    Center(
                      child: Text(
                        '$res',
                        style: TextStyle(
                          color: resColor,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),),),
                    Divider(
                      indent: size.width / 10,
                      endIndent: size.width / 10,
                      color: Colors.yellowAccent,
                      height: size.height * .08,
                    ),
                    Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.white,
                                offset: new Offset(0.0, 0.0),
                                blurRadius: 160.0,
                                spreadRadius: 20.0)
                          ],
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(99)),
                      child: Center(
                        child: Text(
                          '${myStrings.loadResult(true)}: ⭕️️ $correct',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      indent: size.width / 4,
                      endIndent: size.width / 4,
                      color: Colors.black,
                      height: size.height * .08,
                    ),
                    Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.white,
                                offset: new Offset(0.0, 0.0),
                                blurRadius: 160.0,
                                spreadRadius: 20.0)
                          ],
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(99)),
                      child: Center(
                        child: Text(
                          '${myStrings.loadResult(false)}: ❌ $incorrect',
                          style: TextStyle(
                            color: Colors.redAccent[700],
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Spacer(),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil('/Home', (Route<dynamic> route) => false);
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                            width: size.width * 0.8,
                            height: size.width /5,
                            decoration:
                            BoxDecoration(
                              color: Colors.amberAccent,
                              border: Border.all(
                                width: 1.0
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8.0) //                 <--- border radius here
                              ),
                            ),
                            child: Center(
                              child: Text("${myStrings.loadPlayAgain()}",
                              style: TextStyle(
                                color: Colors.indigo[900],
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ),
                          ),
                      ),
                    ),Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
