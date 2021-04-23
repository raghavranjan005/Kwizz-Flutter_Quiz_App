import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwizz/QuizScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List of Images
  List<String> image = [
    "images/py.png",
    "images/java.png",
    "images/js.png",
    "images/cpp.png",
    "images/GS.png",
  ];

  //Topic Descriptions

  List<String> description = [
    "Python is one of the most popular and fastest programming language since half a decade.\nIf You think you have learnt it.. \nJust test yourself !!",
    "Java has always been one of the best choices for Enterprise World. If you think you have learn the Language...\nJust Test Yourself !!",
    "Javascript is one of the most Popular programming language supporting the Web.\nIt has a wide range of Libraries making it Very Powerful !",
    "C++, being a statically typed programming language is very powerful and Fast.\nit's DMA feature makes it more useful. !",
    "General Science",
  ];

  //CustomCard Widget

  Widget customcard(String topicName, String img, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => getjson(topicName),
          ));
        },
        child: Material(
          color: Colors.deepPurple,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(60.0),
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            img,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    topicName,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Main

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return WillPopScope(
        onWillPop: () {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(
                      "Kwizz",
                    ),
                    content: Text("You can'yt go back at this stage"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Ok",
                        ),
                      )
                    ],
                  ));
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text(
              "Kwizz",
              style: TextStyle(
                fontFamily: "Quando",
              ),
            ),
          ),
          body: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              customcard("Python", image[0], description[0]),
              customcard("Java", image[1], description[1]),
              customcard("Javascript", image[2], description[2]),
              customcard("C++", image[3], description[3]),
              customcard("General Science", image[4], description[3]),
            ],
          ),
        ));
  }
}
