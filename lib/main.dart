import 'package:flutter/material.dart';

import 'main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'Cabin',
            primaryColor: Colors.blue,
            accentColor: Colors.blue,
            appBarTheme: AppBarTheme(color: Colors.white),
            buttonColor: Colors.cyan[300],
            buttonTheme: ButtonThemeData(buttonColor: Colors.cyan[300])),
        debugShowCheckedModeBanner: false,
        home: MainPage());
  }
}
