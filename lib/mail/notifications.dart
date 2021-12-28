import 'package:explora/mail/notification_room.dart';
import 'package:flutter/material.dart';

class NotificationsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.pink[100], Colors.purple[200], Colors.cyan[200]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              repeat: ImageRepeat.repeatY,
              fit: BoxFit.fitWidth),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 2),
                        blurRadius: 5,
                      )
                    ],
                    color: Colors.white),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationRoom()),
                    );
                  },
                  child: ListTile(
                    leading: Image(
                        image: AssetImage('assets/images/message.png'),
                        width: 42),
                    title: Text(
                      'System',
                      style: TextStyle(fontSize: 24),
                    ),
                    trailing: Container(
                      width: 14,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 1),
                            blurRadius: 3,
                          )
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }
}
