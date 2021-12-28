import 'package:explora/menu/app_settings.dart';
import 'package:explora/menu/help.dart';
import 'package:explora/menu/term_of_use.dart';
import 'package:explora/menu/wallet.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Menu extends StatelessWidget {
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
              'Menu',
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
                fit: BoxFit.fitWidth),
          ),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 36),
            children: <Widget>[
              MenuList(
                imgName: 'wallet',
                title: 'Wallet',
                goTo: Wallet(),
              ),
              MenuList(
                imgName: 'app_settings',
                title: 'App Settings',
                goTo: AppSettings(),
              ),
              MenuList(
                imgName: 'help',
                title: 'Help',
                goTo: Help(),
              ),
              MenuList(
                imgName: 'term_of_use',
                title: 'Term of Use',
                goTo: TermOfUse(),
              ),
              SizedBox(height: 60),
              FlatButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "This is the latest version",
                        toastLength: Toast.LENGTH_SHORT,
                        timeInSecForIosWeb: 1);
                  },
                  child: Text(
                    'Version 1.0',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ))
            ],
          ),
        ));
  }
}

class MenuList extends StatelessWidget {
  MenuList({this.imgName, this.title, this.goTo});
  final String imgName;
  final String title;
  final Widget goTo;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => goTo),
        );
      },
      child: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/$imgName.png'),
                    width: 42,
                  ),
                  SizedBox(width: 10),
                  Text(title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
                ]),
                Icon(Icons.chevron_right, size: 36)
              ]),
          Divider(thickness: 1, color: Colors.black)
        ],
      ),
    );
  }
}
