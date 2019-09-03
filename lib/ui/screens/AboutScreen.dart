import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "About",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
            color: Colors.white,
            height: size.height,
            width: size.width,
            padding: new EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("The purpose of this app is to help beginners understand basic, somewhat esential words of some languages like French, English, Arabic and Spanish.",
                textAlign : TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,),
                ),
                Divider(
                  indent: size.width * 0.2,
                  endIndent: size.width * 0.2,
                  color: Colors.black,
                  height: size.height * 0.04,
                ),
                Row(
                  children: <Widget>[
                Text("Credits",
                textAlign : TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
                ),Spacer(),
              ],
            ),
            Divider(
              indent: 0,
              endIndent: 0,
              color: Colors.transparent,
              height: size.height * 0.02,
            ),
                Container(
                  padding: new EdgeInsets.all(size.width * 0.02),
                  height: size.height * 0.14,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    boxShadow: [
                      new BoxShadow(
                          color: Colors.grey,
                          offset: new Offset(1.0, 1.0),
                          blurRadius: 4.0,
                          spreadRadius: 0.0)
                    ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.orange,
                          Colors.orangeAccent,
                          Colors.yellow,
                          Colors.yellow[100],
                        ],
                      ),
                    ),
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: size.width * .2,
                          height: size.width * .2,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "https://avatars0.githubusercontent.com/u/44686277")
                          ),
                        ),
                          ),
                          Container(
                              width: size.width * .05,
                              height: size.width * .2,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Skender Lahdhiri',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                          ),
                          Text('For creating the app.',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  launch('https://github.com/skenderl');
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child:
                              SizedBox(
                                width: size.width * 0.05,
                                height: size.width * 0.05,
                                child: SvgPicture.asset('assets/images/github.svg',semanticsLabel: 'Github',color:Colors.black),
                              ),
                            ),Container(
                              width: size.width * .05,
                            ),
                              InkWell(
                                onTap: () {
                                  launch('https://twitter.com/skenderl');
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child:
                              SizedBox(
                                width: size.width * 0.05,
                                height: size.width * 0.05,
                                child: SvgPicture.asset('assets/images/twitter.svg',semanticsLabel: 'Twitter',color:Colors.black),
                              ),
                            ),Container(
                              width: size.width * .05,
                            ),
                              InkWell(
                                onTap: () {
                                  launch('mailto:lahdhiriskender@gmail.com?subject=BSQApp&body=BSQ:');
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child:
                              SizedBox(
                                width: size.width * 0.05,
                                height: size.width * 0.05,
                                child: SvgPicture.asset('assets/images/gmail.svg',semanticsLabel: 'Mail',color:Colors.black),
                              ),
                            ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              Divider(
                indent: size.width * 0.2,
                endIndent: size.width * 0.2,
                color: Colors.grey,
                height: 20,
              ),
              Container(
                padding: new EdgeInsets.all(size.width * 0.02),
                height: size.height * 0.14,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.grey,
                        offset: new Offset(1.0, 1.0),
                        blurRadius: 4.0,
                        spreadRadius: 0.0)
                  ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.indigo,
                        Colors.deepPurple,
                        Colors.purple,
                        Colors.purpleAccent,
                      ],
                    ),
                  ),
                child: Row(
                  children: <Widget>[
                    Container(
                        width: size.width * .2 ,
                        height: size.width * .2,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://media.licdn.com/dms/image/C5603AQEJqj10l_ApIg/profile-displayphoto-shrink_800_800/0?e=1572480000&v=beta&t=CsczP9d_P94Z7tES_YsnJW1TddyE9tnXxe2M8mB2Rj4")
                        )),
                        ),
                        Container(
                            width: size.width * .05,
                            height: size.width * .2,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Youssef Tarzi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                        ),
                        Text('For creating the music.',
                        style: TextStyle(
                          color: Colors.grey[350],
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                launch('https://github.com/syyoussef');
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child:
                            SizedBox(
                              width: size.width * 0.05,
                              height: size.width * 0.05,
                              child: SvgPicture.asset('assets/images/github.svg',semanticsLabel: 'Github'),
                            ),
                          ),Container(
                            width: size.width * .05,
                          ),
                            InkWell(
                              onTap: () {
                                launch('https://twitter.com/Ryoukugyu');
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child:
                            SizedBox(
                              width: size.width * 0.05,
                              height: size.width * 0.05,
                              child: SvgPicture.asset('assets/images/twitter.svg',semanticsLabel: 'Twitter'),
                            ),
                          ),Container(
                            width: size.width * .05,
                          ),
                            InkWell(
                              onTap: () {
                                launch('mailto:youssefterzi@gmail.com?subject=BSQApp&body=BSQ:');
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child:
                            SizedBox(
                              width: size.width * 0.05,
                              height: size.width * 0.05,
                              child: SvgPicture.asset('assets/images/gmail.svg',semanticsLabel: 'Mail'),
                            ),
                          ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ],
          ),
        ),
    );
  }
}
