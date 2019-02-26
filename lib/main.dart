import 'package:flutter/material.dart';
import 'package:mavigation/FirestFragment.dart';
import 'package:mavigation/SecondFragment.dart';
import 'package:mavigation/ThirdFragment.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  NaviState createState() {
    // TODO: implement createState
    return NaviState();
  }
}

class NaviState extends State<MyApp> {
  int currentIndex = 1;
  Widget getCurrentFragment() {
    switch (currentIndex) {
      case 1:
        return FirestFragment();
        break;
      case 2:
        return SecondFragment();
        break;
      case 3:
        return ThirdFragment();
        break;
    }
  }

  setCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
    Navigator.of(context).pop(); //close navigation drawer
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.blue,
              height: 250.0,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.access_alarm,
                      size: 70,
                      color: Colors.white,
                    ),
                    SizedBox(height: 40), //give space
                    Text(
                      "Gowthaman",
                      style: new TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Gowthaman@gmailcom",
                      style: new TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              selected: currentIndex == 1
                  ? true
                  : false, //this used for selected item
              onTap: () {
                setCurrentIndex(1);
              },
              title: Text("Fragment 1"),
              leading: Icon(Icons.access_time),
            ),
            ListTile(
              selected: currentIndex == 2
                  ? true
                  : false, //this used for selected item
              onTap: () {
                setCurrentIndex(2);
              },
              title: Text("Fragment 2"),
              leading: Icon(Icons.accessible),
            ),
            ListTile(
              selected: currentIndex == 3
                  ? true
                  : false, //this used for selected item
              onTap: () {
                setCurrentIndex(3);
              },
              title: Text("Fragment 3"),
              leading: Icon(Icons.add_a_photo),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Navigation Drawer"),
      ),
      body: getCurrentFragment(),
    );
  }
}
