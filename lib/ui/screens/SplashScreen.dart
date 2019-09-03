import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;
  SharedPreferences prefs;

  startTime() async {
    var _duration = new Duration(seconds: 6);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async{
    prefs = await SharedPreferences.getInstance();
      if(prefs.containsKey('intro')){
        Navigator.of(context).pushNamedAndRemoveUntil('/Home',(Route<dynamic> route) => false);
      }else{
        Navigator.of(context).pushNamedAndRemoveUntil('/Intro',(Route<dynamic> route) => false);
      }
  
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 4),
    );
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child:Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Text(
                  "all copyrights reserved ©",
                  style: TextStyle(
                    color: Colors.amberAccent,
                    shadows: [
                      Shadow(
                        color: Colors.yellowAccent,
                        blurRadius: 10.0,
                        offset: Offset(3.0, 3.0),
                      ),
                      Shadow(
                        color: Colors.pink[300],
                        blurRadius: 10.0,
                        offset: Offset(-2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                "assets/images/dev_icon.png",
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    ),
  );
  }
}
