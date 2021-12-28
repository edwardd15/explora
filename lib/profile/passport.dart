import 'package:explora/profile/profile_widget.dart';
import 'package:explora/profile/update_passport.dart';
import 'package:explora/classes/ProfileClass.dart';
import 'package:flutter/material.dart';

class Passport extends StatefulWidget {
  @override
  _PassportState createState() => _PassportState();
}

class _PassportState extends State<Passport> {
  final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Colors.pink[100], Colors.purple[200], Colors.cyan[200]],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Text(
              'Passport',
              style: TextStyle(
                  foreground: Paint()..shader = linearGradient,
                  fontSize: 36,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.w700),
            ),
            elevation: 10,
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.pink[100],
              Colors.purple[200],
              Colors.cyan[200]
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                image: DecorationImage(
                    image: AssetImage('assets/images/pattern.png'),
                    repeat: ImageRepeat.repeatY,
                    fit: BoxFit.fitWidth),),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              children: <Widget>[
                Container(
                  child: Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Passport Information',
                          style: TextStyle(fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdatePassport()),
                            );
                          },
                          child: Text(
                            'UPDATE',
                            style: TextStyle(
                                fontSize: 18, color: Colors.blue[600], fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    PassportInformation(
                      firstName: passport.firstname,
                      lastName: passport.lastname,
                      passportNumber: passport.number,
                      nationality: passport.nationality,
                    )
                  ]),
                ),
              ],
            )));
  }
}
