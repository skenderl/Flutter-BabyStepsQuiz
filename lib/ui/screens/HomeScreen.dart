import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quiz_app/ui/widgets/EmptyAppBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  AudioPlayer player;
  AudioCache cache;
  String lang = "";
  SharedPreferences prefs;
  Icon _musicIcon = Icon(Icons.volume_up);
  Color _musicColor = Colors.white;
  final PageController viewController =
      PageController(viewportFraction: 0.8, initialPage: 0);

  _setPrefs() async {
    prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('_sound')) {
      prefs.setBool('_sound', true);
    }
    _playerPref();
    if (!prefs.containsKey('lang')) {
      prefs.setString('lang', "");
    }
    lang = prefs.getString('lang');
  }

  _playerPref() {
    if (prefs.getBool('_sound')) {
      cache.loop('audio/background.mp3', volume: 0.4);
      setState(() {
        _musicIcon = Icon(Icons.volume_up);
        _musicColor = Colors.white;
      });
    } else {
      setState(() {
        _musicIcon = Icon(Icons.volume_off);
        _musicColor = Colors.black;
      });
    }
  }

  initState() {
    super.initState();
    player = new AudioPlayer();
    cache = new AudioCache(fixedPlayer: player);
    cache.load('audio/background.mp3');
    _setPrefs();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return WillPopScope(
        onWillPop: () => _exitApp(context),
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
                appBar: EmptyAppBar(),
                body: Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding:
                                const EdgeInsets.only(left: kToolbarHeight / 2),
                            height: size.height * 0.15,
                            child: Column(children: <Widget>[
                              IconButton(
                                padding: const EdgeInsets.only(
                                    top: kToolbarHeight / 2,
                                    bottom: kToolbarHeight / 8),
                                icon: _musicIcon,
                                iconSize: size.width * 0.08,
                                color: _musicColor,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                tooltip: 'Music',
                                onPressed: () {
                                  if (prefs.getBool('_sound')) {
                                    setState(() {
                                      prefs.setBool('_sound', false);
                                      _musicIcon = Icon(Icons.volume_off);
                                      _musicColor = Colors.black;
                                    });
                                    player.stop();
                                  } else {
                                    cache.loop('audio/background.mp3',
                                        volume: 0.4);
                                    setState(() {
                                      prefs.setBool('_sound', true);
                                      _musicIcon = Icon(Icons.volume_up);
                                      _musicColor = Colors.white;
                                    });
                                    player.resume();
                                  }
                                },
                              ),
                              Container(
                                height: 0.5,
                                width: size.width * 0.06,
                                color: _musicColor,
                              ),
                            ]),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.only(left: kToolbarHeight / 2),
                            height: size.height * 0.15,
                            child: Column(children: <Widget>[
                              IconButton(
                                padding: const EdgeInsets.only(
                                    top: kToolbarHeight / 2,
                                    bottom: kToolbarHeight / 8),
                                icon: Icon(Icons.language),
                                iconSize: size.width * 0.08,
                                color: Colors.white,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                tooltip: 'Language',
                                onPressed: () {
                                  showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor:Colors.deepPurpleAccent,
                                            content: Container(
                                              width:size.width/2,
                                              child:
                                              FittedBox(
                                                fit:BoxFit.contain,
                                                child:Column(
                                                children:<Widget>[
                                                Container(
                                                  width:size.width/2,
                                                  child:
                                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[
                                                  Radio(
                                                    value: '',
                                                    groupValue: lang,
                                                    activeColor: Colors.red,
                                                    onChanged: (String value) {
                                                                  prefs.setString('lang', value);
                                                                  setState(() { lang = value; });
                                                                  Navigator.of(context).pop();
                                                                }
                                                  ),
                                                  Spacer(),Text('English',style: TextStyle(
                                                    color: Colors.amberAccent,
                                                    shadows: [
                                                      Shadow(
                                                        color: Colors.blue,
                                                        blurRadius: 10.0,
                                                        offset: Offset(3.0, 3.0),
                                                      ),
                                                      Shadow(
                                                        color: Colors.red,
                                                        blurRadius: 10.0,
                                                        offset: Offset(-2.0, 2.0),
                                                      ),
                                                    ],
                                                  ),),
                                                ],
                                              ),),Container(
                                                width:size.width/2,
                                                height: 1,color:Colors.grey,),
                                              Container(
                                                width:size.width/2,
                                                child:
                                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'FR',
                                                    groupValue: lang,
                                                    activeColor: Colors.red,
                                                    onChanged: (String value) {
                                                      prefs.setString('lang', value);
                                                                  setState(() { lang = value; });
                                                                  Navigator.of(context).pop();
                                                                }
                                                  ),
                                                  Spacer(),Text('Français',style: TextStyle(
                                                    color: Colors.amberAccent,
                                                    shadows: [
                                                      Shadow(
                                                        color: Colors.blue,
                                                        blurRadius: 10.0,
                                                        offset: Offset(3.0, 3.0),
                                                      ),
                                                      Shadow(
                                                        color: Colors.red,
                                                        blurRadius: 10.0,
                                                        offset: Offset(-2.0, 2.0),
                                                      ),
                                                    ],
                                                  ),),
                                                ],
                                              ),),Container(
                                                width:size.width/2,
                                                height: 1,color:Colors.grey,),
                                              Container(
                                                width:size.width/2,
                                                child:
                                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'AR',
                                                    groupValue: lang,
                                                    activeColor: Colors.red,
                                                    onChanged: (String value) {prefs.setString('lang', value);
                                                                  setState(() { lang = value; });
                                                                  Navigator.of(context).pop();
                                                                }
                                                  ),
                                                  Spacer(),Text('العربية',style: TextStyle(
                                                    color: Colors.amberAccent,
                                                    shadows: [
                                                      Shadow(
                                                        color: Colors.blue,
                                                        blurRadius: 10.0,
                                                        offset: Offset(3.0, 3.0),
                                                      ),
                                                      Shadow(
                                                        color: Colors.red,
                                                        blurRadius: 10.0,
                                                        offset: Offset(-2.0, 2.0),
                                                      ),
                                                    ],
                                                  ),),
                                                ],
                                              ),),Container(
                                                width:size.width/2,
                                                height: 1,color:Colors.grey,),
                                              Container(
                                                width:size.width/2,
                                                child:
                                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'ES',
                                                    groupValue: lang,
                                                    activeColor: Colors.red,
                                                    onChanged: (String value) {prefs.setString('lang', value);
                                                                  setState(() { lang = value; });
                                                                  Navigator.of(context).pop();
                                                                }
                                                  ),
                                                  Spacer(),Text('español',style: TextStyle(
                                                    color: Colors.amberAccent,
                                                    shadows: [
                                                      Shadow(
                                                        color: Colors.blue,
                                                        blurRadius: 10.0,
                                                        offset: Offset(3.0, 3.0),
                                                      ),
                                                      Shadow(
                                                        color: Colors.red,
                                                        blurRadius: 10.0,
                                                        offset: Offset(-2.0, 2.0),
                                                      ),
                                                    ],
                                                  ),),
                                                ],
                                              ),),
                                            ],
                                            ),
                                          ),
                                          ),
                                          );
                                        },
                                  );
                                },
                              ),
                              Container(
                                height: 0.5,
                                width: size.width * 0.06,
                                color: Colors.white,
                              ),
                            ]),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.only(left: kToolbarHeight / 2),
                            height: size.height * 0.15,
                            child: Column(children: <Widget>[
                              IconButton(
                                padding: const EdgeInsets.only(
                                    top: kToolbarHeight / 2,
                                    bottom: kToolbarHeight / 8),
                                icon: Icon(Icons.person),
                                iconSize: size.width * 0.08,
                                color: Colors.white,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                tooltip: 'Language',
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/MyProgress');
                                },
                              ),
                              Container(
                                height: 0.5,
                                width: size.width * 0.06,
                                color: Colors.white,
                              ),
                            ]),
                          ),
                          Spacer(),
                          Container(
                            padding: const EdgeInsets.only(
                                right: kToolbarHeight / 2),
                            height: size.height * 0.15,
                            child: Column(children: <Widget>[
                              IconButton(
                                padding: const EdgeInsets.only(
                                    top: kToolbarHeight / 2,
                                    bottom: kToolbarHeight / 2),
                                icon: Icon(Icons.info),
                                iconSize: size.width * 0.08,
                                color: Colors.white,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                tooltip: 'About',
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/About');
                                },
                              ),
                            ]),
                          ),
                        ]),
                    Container(
                      width: size.width * 0.9,
                      height: size.height * 0.1,
                      child:FittedBox(
                        fit:BoxFit.contain,
                        child:Text(
                          "Baby Steps Quiz",
                          style: TextStyle(
                            color: Colors.amberAccent,
                            shadows: [
                              Shadow(
                                color: Colors.blue,
                                blurRadius: 10.0,
                                offset: Offset(3.0, 3.0),
                              ),
                              Shadow(
                                color: Colors.red,
                                blurRadius: 10.0,
                                offset: Offset(-2.0, 2.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/Menu');
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          color: Colors.transparent,
                          height: size.width * 0.8,
                          width: size.width * 0.8,
                              child:
                              FlareActor(
                                "assets/animations/click.flr",
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                animation: "animate",
                              ),
                            ),
                      ),
                    ),Spacer(),
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: kToolbarHeight / 2),
                      color: Colors.transparent,
                      height: size.height * 0.2,
                      width: size.width ,
                      child: FlareActor(
                        "assets/animations/tapp.flr",
                        color: Colors.white,
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        animation: lang == "" ? "animate" : "animate$lang",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused && prefs.getBool('_sound')) {
      player.pause();
    } else if (prefs.getBool('_sound')) {
      player.resume();
    }
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    player.stop();
    viewController.dispose();
    super.dispose();
  }
}

Future<bool> _exitApp(BuildContext context) {
    exit(0);
    return  Future.delayed(Duration(seconds: 0), () => false);
}
