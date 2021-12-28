import 'package:flutter/material.dart';
import 'package:explora/classes/ProfileClass.dart';

class AppSettings extends StatelessWidget {
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
              'App Settings',
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
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
            child: ListView(children: <Widget>[
              Text(
                'Account',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              AccountMenu(),
              SizedBox(height: 20),
              Text(
                'Preferences',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              PreferenceMenu(),
              SizedBox(height: 20),
              PreferenceMenu2(),
              SizedBox(height:20),
              Logout()
            ])));
  }
}

class AccountMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(children: <Widget>[
        AppSettingsList(
          title: 'My Account',
        ),
        Container(height: 1, color: Colors.black38),
        AppSettingsList(title: 'Passport')
      ]),
    );
  }
}

class PreferenceMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(children: <Widget>[
        AppSettingsList2(
          title: 'My Account',
          subtitle: passport.nationality,
        ),
        Container(height: 1, color: Colors.black38),
        AppSettingsList2(title: 'Currency', subtitle: 'KRW'),
        Container(height: 1, color: Colors.black38),
        AppSettingsList2(title: 'Language', subtitle: 'English')
      ]),
    );
  }
}

class PreferenceMenu2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('App Version',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                Text('1.0',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
              ]),
        ),
        Container(height: 1, color: Colors.black38),
        AppSettingsList(
          title: 'Term & Condition',
        ),
        Container(height: 1, color: Colors.black38),
        AppSettingsList(title: 'Privacy Policy')
      ]),
    );
  }
}

class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(children: <Widget>[
        AppSettingsList(title: 'Log Out')
      ]),
    );
  }
}

class AppSettingsList extends StatelessWidget {
  AppSettingsList({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            Icon(Icons.chevron_right, size: 30)
          ]),
    );
  }
}

class AppSettingsList2 extends StatelessWidget {
  AppSettingsList2({this.title, this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            Row(
              children: <Widget>[
                Text(subtitle,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                Icon(Icons.chevron_right, size: 30),
              ],
            )
          ]),
    );
  }
}
