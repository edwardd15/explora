import 'package:explora/classes/Ticket.dart';
import 'package:explora/flight/fill_in_details.dart';
import 'package:explora/flight/widget_checkout.dart';
import 'package:flutter/material.dart';

class SelectFlight1 extends StatefulWidget {
  @override
  _SelectFlight1State createState() => _SelectFlight1State();
}

class _SelectFlight1State extends State<SelectFlight1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.lightBlue[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${ticket.airline}',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '${ticket.cityfrom1} - ${ticket.cityto1} / ${ticket.duration} / ${ticket.transit}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
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
            child: Stack(
              children: <Widget>[
                ListView(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                    children: <Widget>[
                      FlightCard1(
                        // airline: 'Korean Air',
                        // duration: '6h25m',
                        // image:
                        //     'https://media-exp1.licdn.com/dms/image/C4E0BAQGZ7io5l9mCPA/company-logo_200_200/0?e=2159024400&v=beta&t=ftI_hjUdoCFG8uR2Yo8hH2EXwgSVOFBB9Fo_5gi52Cg',
                        // landing: '09:32',
                        // points: '120',
                        // price: '328.090',
                        // takeoff: '04:20',
                        // transit: 'direct',
                      )
                    ]),
                BottomCheckout(
                    price: ticket.getMoney(ticket.ticketprice),
                    buttonName: 'Select',
                    goTo: FillInDetails())
              ],
            )));
  }
}


