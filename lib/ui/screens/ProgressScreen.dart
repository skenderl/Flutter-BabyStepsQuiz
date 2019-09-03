import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressScreen extends StatefulWidget {
  ProgressScreen({Key key}) : super(key: key);

  @override
  ProgressScreenState createState() => new ProgressScreenState();
}

class ProgressScreenState extends State<ProgressScreen> {

  Container noTrophy = new Container(
    padding:
        const EdgeInsets.only(left: 10, top: 10),
    color:Colors.white,
    height:60,
    width: 200,
    child: Icon(Icons.more_horiz),
    );

  Future<List<Widget>> getAllPrefs(String lang) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Widget> items;
    Iterable<String> itemsSet;
    itemsSet = prefs
        .getKeys()
        .where((String key) => key != "_sound" && key != "lang" && key != "intro");
    switch (lang) {
      case "":
        itemsSet = itemsSet
          .where((String key) => key == "Animals" || key == "Weathers" || key == "Foods" || key == "Countries" || key == "Transportations" || key == "Jobs");
        break;
      case "fr":
        itemsSet = itemsSet
          .where((String key) => key == "Animaux" || key == "Météo" || key == "Nourriture" || key == "Pays" || key == "Transports" || key == "Métiers");
        break;
      case "es":
        itemsSet = itemsSet
          .where((String key) => key == "Animales" || key == "Climas" || key == "Alimentos" || key == "Países" || key == "Transportes" || key == "Trabajos");
        break;
      case "ar":
        itemsSet = itemsSet
          .where((String key) => key == "الحيوانات" || key == "طقس" || key == "طعام" || key == "بلدان" || key == "نقل" || key == "وظائف");
        break;
    }
    items = itemsSet
        .map<Widget>((key) =>
        ListTile(
          title: Text(key,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,),),
          leading: Text("🏅",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,),),
        )
        )
        .toList(growable: false);
    if (items.length != 0){
      return items;
    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          "🏆🏆🏆🏆",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body:
  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // ---------------- english
          Container(
            padding:
                const EdgeInsets.only(left: 10, top: 10),
            color:Colors.white,
            height:60,
            width: size.width,
            child:
            Text("English 🇬🇧 ",
            textAlign : TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,),
            ),
          ),
          FutureBuilder<List<Widget>>(
          future: getAllPrefs(""),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return noTrophy;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: snapshot.data,
            );
          }),
          Divider(
            indent: size.width * 0.02,
            endIndent: size.width * 0.02,
            color: Colors.black,
            height: size.height * 0.04,
          ),
            // ---------------- french
          Container(
            padding:
                const EdgeInsets.only(left: 10, top: 10),
            color:Colors.white,
            height:60,
            width: size.width,
            child:
            Text("Français 🇫🇷 ",
            textAlign : TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,),
            ),
          ),
          FutureBuilder<List<Widget>>(
          future: getAllPrefs("fr"),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return noTrophy;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: snapshot.data,
            );
          }),
          Divider(
            indent: size.width * 0.02,
            endIndent: size.width * 0.02,
            color: Colors.black,
            height: size.height * 0.04,
          ),
            // ---------------- spanish
          Container(
            padding:
                const EdgeInsets.only(left: 10, top: 10),
            color:Colors.white,
            height:60,
            width: size.width,
            child:
            Text("español 🇪🇸 ",
            textAlign : TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,),
            ),
          ),
          FutureBuilder<List<Widget>>(
          future: getAllPrefs("es"),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return noTrophy;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: snapshot.data,
            );
          }),
          Divider(
            indent: size.width * 0.02,
            endIndent: size.width * 0.02,
            color: Colors.black,
            height: size.height * 0.04,
          ),
            // ---------------- arabic
          Container(
            padding:
                const EdgeInsets.only(right: 10, top: 10),
            color:Colors.white,
            height:60,
            width: size.width,
            child:
            Text(" 🇹🇳 العربية",
            textAlign : TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,),
            ),
          ),
          FutureBuilder<List<Widget>>(
          future: getAllPrefs("ar"),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return noTrophy;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: snapshot.data,
            );
          }),
          Divider(
            indent: size.width * 0.02,
            endIndent: size.width * 0.02,
            color: Colors.black,
            height: size.height * 0.04,
          ),
        ],
      ),
  ),
);
}
}
