import 'package:flutter/material.dart';
import 'package:explora/classes/ProfileClass.dart';

class NotificationRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            automaticallyImplyLeading: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Text(
              'Notification',
              style: TextStyle(
                fontSize: 36,
                fontFamily: 'PlayfairDisplay',
              ),
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
            child: Container(
                margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40)),
                    gradient: LinearGradient(
                        colors: [Colors.white70, Colors.white10],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    children: <Widget>[
                      Center(
                        child: Text('System',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700)),
                      ),
                      Text('\nDear,\n ${personalData.fullname}',
                          style: TextStyle(fontSize: 18)),
                      Text(
                          '\nHello, welcome and thank you for joining Explora. We will always serve you without best services and we also always receive any feedback from you to improve your experience with us.',
                          style: TextStyle(fontSize: 18)),
                      Text('\nRegards, \nExplora',
                          style: TextStyle(fontSize: 18)),
                    ]))));
  }
}
