import 'package:explora/mail/chat_room.dart';
import 'package:flutter/material.dart';

class MessagesMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatRoom()),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 5,
                        )
                      ],
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/emily.jpg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Emily Xanders', style: TextStyle(fontSize: 24))
                    ]),
                  )),
            )
          ],
        ));
  }
}
