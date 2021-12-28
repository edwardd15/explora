import 'package:explora/mail/emily.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatelessWidget {
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
              'Messages',
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
                    fit: BoxFit.fitWidth),),
            child: Container(
                margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40)),
                    gradient: LinearGradient(
                        colors: [Colors.white70, Colors.white10],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Emily())));
  }
}
