import 'package:explora/classes/ProfileClass.dart';
import 'package:explora/menu/menu.dart';
import 'package:explora/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:explora/mail/mail.dart';
import 'package:explora/home/home.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Colors.pink[100], Colors.purple[200], Colors.cyan[200]],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  int _currentIndex = 1;
  final List<Widget> _children = [Mail(), Home(), Menu()];
  String appBarTitle = "Explora";

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Login"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Profile()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Not Logged In"),
      content: Text("Please login first to access this menu"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: _children[_currentIndex],
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              onHomeTabTapped();
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 8, 8, 8),
              child: Image(
                image: AssetImage("assets/images/explora_icon_64px.png"),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/images/mail.png'),
              ),
              title: Text(
                'Mails',
                style: TextStyle(fontSize: 0),
              ),
            ),
            new BottomNavigationBarItem(
              icon: Container(),
              title: Text(''),
            ),
            new BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/images/menu.png'),
              ),
              title: Text(
                'Menu',
                style: TextStyle(fontSize: 0),
              ),
            ),
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      if ((index == 0 || index == 2) && !personalData.loggedin) {
        showAlertDialog(context);
      } else {
        _currentIndex = index;
      }
    });
  }

  void onHomeTabTapped() {
    setState(() {
      _currentIndex = 1;
    });
  }
}
