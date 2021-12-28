import 'package:explora/my_booking/tickets.dart';
import 'package:explora/my_booking/history.dart';
import 'package:flutter/material.dart';

class MyBooking extends StatelessWidget {
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              title: Text(
                'My Booking',
                style: TextStyle(
                    foreground: Paint()..shader = linearGradient,
                    fontSize: 36,
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.w700),
              ),
              elevation: 10,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(text: 'Ticket'),
                  Tab(text: 'History'),
                ],
                indicatorColor: Colors.cyan[300],
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.cyan[200],
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(fontSize: 24),
              ),
            ),
          ),
          body: TabBarView(children: <Widget>[TicketList(), HistoryList()])),
    );
  }
}
