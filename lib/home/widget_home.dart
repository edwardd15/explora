import 'package:explora/classes/ProfileClass.dart';
import 'package:explora/profile/profile.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  MenuButton({this.imageName, this.caption, this.goTo});
  final String imageName;
  final String caption;
  final Widget goTo;
  @override
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

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 3),
                  blurRadius: 5,
                )
              ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(45)),
              onTap: () {
                if (personalData.loggedin){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => goTo),
                );
                }
                else {
                  showAlertDialog(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image(
                  image: AssetImage('assets/images/$imageName.png'),
                ),
              ),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.5),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(caption))
      ],
    );
  }
}

class WhatToExplore extends StatelessWidget {
  WhatToExplore({this.placeName, this.imageUrl});
  final String placeName;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Stack(children: <Widget>[
        Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover),
            )),
        Container(
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                gradient: RadialGradient(
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 0.3),
                  ],
                  radius: 1.5,
                ),
                color: Colors.grey)),
        Container(
            height: 120,
            child: Center(
              child: Text(placeName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.w700,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  )),
            )),
      ]),
    );
  }
}
