import 'package:explora/classes/Ticket.dart';
import 'package:explora/flight/baggage.dart';
import 'package:explora/flight/payment/payment.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class ETicket extends StatefulWidget {
  @override
  _ETicketState createState() => _ETicketState();
}

class _ETicketState extends State<ETicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(74),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.lightBlue[900],
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'E-Ticket',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.looks_one, size: 16),
                      SizedBox(width: 3),
                      Text(
                        'Book',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        height: 1.5,
                        width: 30,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.looks_two,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(width: 3),
                      Text('Pay',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          )),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        height: 1.5,
                        width: 30,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.looks_3,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(width: 3),
                      Text(
                        'E-Ticket',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ])
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
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image(
                                  image: AssetImage('assets/images/tick.png'),
                                  height: 40),
                              Text('   Transaction Successful',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                          SizedBox(height: 8),
                          Text('Your ticket has been sent via connected email',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          Text('Thank you for trusting Explora',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue))
                        ]),
                  ),
                  SizedBox(height:15),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: Colors.deepOrange,
                      onPressed: () {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      child: Text(
                        'Back To Home',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ))
                ])));
  }
}
