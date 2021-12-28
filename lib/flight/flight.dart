import 'package:explora/flight/one_way.dart';
import 'package:flutter/material.dart';

class Flight extends StatefulWidget {
  @override
  _FlightState createState() => _FlightState();
}

class _FlightState extends State<Flight> {
  final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Colors.pink[100], Colors.purple[200], Colors.cyan[200]],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.pink[100],
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Text(
                'Flight',
                style: TextStyle(
                    foreground: Paint()..shader = linearGradient,
                    fontSize: 36,
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.w700),
              ),
              elevation: 0,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(text: 'One-way'),
                  Tab(text: 'Multi City'),
                ],
                indicatorColor: Colors.cyan[300],
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.cyan[200],
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(fontSize: 24),
              ),
            ),
          ),
          body: TabBarView(children: <Widget>[OneWay(), OneWay()])),
    );
  }
}
