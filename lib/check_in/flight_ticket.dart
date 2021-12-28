import 'package:explora/classes/ProfileClass.dart';
import 'package:flutter/material.dart';

class FlightTicket extends StatefulWidget {
  @override
  _FlightTicketState createState() => _FlightTicketState();
}

class _FlightTicketState extends State<FlightTicket> {
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Text(
              'Flight Ticket',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
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
                              SizedBox(width: 10),
                              Text(
                                  'You have successfully checked in\n${personalData.getName1()}',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ))
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                              'You will need to print your boarding pass at least 1 hour before your scheduled time of departure or may be denied boarding',
                              style: TextStyle(fontSize: 16)),
                          Divider(
                            color: Colors.black38,
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.print,
                                color: Colors.black45,
                                size: 20,
                              ),
                              SizedBox(width:8),
                              Text(
                                'Print Boarding Pass',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Colors.black45),
                              ),
                            ],
                          )
                        ]),
                  ),
                  SizedBox(height: 15),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: Colors.deepOrange,
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
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
