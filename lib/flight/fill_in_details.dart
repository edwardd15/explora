import 'package:explora/classes/Ticket.dart';
import 'package:explora/flight/add_contact_details.dart';
import 'package:explora/flight/fill_in_details1.dart';
import 'package:explora/flight/traveler_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:explora/flight/widget_checkout.dart';

class FillInDetails extends StatefulWidget {
  @override
  _FillInDetailsState createState() => _FillInDetailsState();
}

class _FillInDetailsState extends State<FillInDetails> {
  final oCcy = new NumberFormat("#,###", "en_US");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.lightBlue[900],
            centerTitle: true,
            title: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Fill In Details',
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
                            color: Colors.white54,
                          ),
                          Icon(
                            Icons.looks_two,
                            size: 16,
                            color: Colors.white54,
                          ),
                          SizedBox(width: 3),
                          Text('Pay',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white54,
                              )),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            height: 1.5,
                            width: 30,
                            color: Colors.white54,
                          ),
                          Icon(
                            Icons.looks_3,
                            size: 16,
                            color: Colors.white54,
                          ),
                          SizedBox(width: 3),
                          Text(
                            'E-Ticket',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white54,
                            ),
                          ),
                        ])
                  ],
                ),
              ],
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
                  fit: BoxFit.fitWidth),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[900],
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 3),
                            blurRadius: 3)
                      ]),
                ),
                ListView(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    children: <Widget>[
                      FlightCard1(),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Contact Details (for E-ticket/Voucher)'),
                      SizedBox(
                        height: 10,
                      ),
                      Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddContactDetails()));
                          },
                          child: ListTile(
                            leading: Image(
                                image: AssetImage('assets/images/contact.png'),
                                height: 32),
                            title: Row(children: <Widget>[
                              Text('Add Contact Details'),
                              Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              )
                            ]),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Traveler Details'),
                      SizedBox(
                        height: 10,
                      ),
                      Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TravelerDetails()));
                          },
                          child: ListTile(
                            leading: Image(
                                image: AssetImage('assets/images/traveler.png'),
                                height: 32),
                            title: Row(children: <Widget>[
                              Text('Adult ${ticket.adult.toString()}'),
                              Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              )
                            ]),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      )
                    ]),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          color: Colors.lightBlue[800],
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FillInDetails1()));
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              Text('Continue',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20))
                            ],
                          )),
                    ))
              ],
            )));
  }
}
