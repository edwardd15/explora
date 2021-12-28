import 'package:explora/check_in/check-in1.dart';
import 'package:explora/classes/CheckedIn.dart';
import 'package:flutter/material.dart';

class CheckIn extends StatelessWidget {
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
            title: Text(
              'Check-in',
              style: TextStyle(
                  foreground: Paint()..shader = linearGradient,
                  fontSize: 36,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.w700),
            ),
            elevation: 0,
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
                  fit: BoxFit.fitWidth),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 3),
                            blurRadius: 5)
                      ]),
                ),
                ListView(children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.black38),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            icon: Image(
                              image:
                                  AssetImage('assets/images/family_name.png'),
                              width: 42,
                            ),
                            labelText: 'Family Name',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 18),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan)),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Image(
                              image: AssetImage(
                                  'assets/images/booking_number.png'),
                              width: 42,
                            ),
                            labelText: 'Booking Number',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 18),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan)),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            icon: Image(
                              image:
                                  AssetImage('assets/images/depart_from.png'),
                              width: 42,
                            ),
                            labelText: 'Depart From',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 18),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan)),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 300,
                          child: RaisedButton(
                            onPressed: () {
                              print(checkedIn.ticket);
                            },
                            color: Colors.pink[50],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              'Search',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        FlatButton(
                            child: new Text(
                              "View My Booking",
                              style:
                                  TextStyle(color: Colors.cyan, fontSize: 20),
                            ),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CheckIn1()));
                            },
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                              side: BorderSide(color: Colors.cyan),
                            )),
                      ],
                    ),
                  ),
                ]),
              ],
            )));
  }
}
