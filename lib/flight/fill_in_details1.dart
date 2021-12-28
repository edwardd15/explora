import 'package:explora/classes/Ticket.dart';
import 'package:explora/flight/baggage.dart';
import 'package:explora/flight/payment/payment.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class FillInDetails1 extends StatefulWidget {
  @override
  _FillInDetails1State createState() => _FillInDetails1State();
}

class _FillInDetails1State extends State<FillInDetails1> {
  final oCcy = new NumberFormat("#,###", "en_US");
  bool travelInsuranceVal = false;
  bool delayInsuranceVal = false;
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
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                children: <Widget>[
                  Text('Flight Facilities'),
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Baggage()));
                      },
                      child: ListTile(
                        leading: Image(
                            image: AssetImage('assets/images/baggage1.png'),
                            height: 32),
                        title: Text('Baggage (${ticket.kg.toString()} kg)'),
                        subtitle: Text(
                            'Add your baggage now before cram look after you'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('In-flight Meal'),
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: Image(
                            image: AssetImage('assets/images/meal.png'),
                            height: 32),
                        title: Row(children: <Widget>[
                          Text('Reserved'),
                          Icon(Icons.check, color: Colors.lightBlue)
                        ]),
                        subtitle: Text('Now you can enjoy your meal abroad'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Frequently Added Booking'),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(children: <Widget>[
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: travelInsuranceVal,
                            onChanged: (bool newValue) {
                              setState(() {
                                if(newValue){
                                  ticket.addInsurancePrice(3000);
                                }
                                else{
                                  ticket.addInsurancePrice(-3000);
                                }
                                travelInsuranceVal = newValue;
                              });
                            },
                            activeColor: Colors.blue,
                            checkColor: Colors.white,
                          ),
                          Text('Travel Insurance',
                              style: TextStyle(fontSize: 16))
                        ],
                      ),
                      Text(
                        'With CHUBB Travel Insurance, get up to ₩ 50 mio coverage for accidents, up to ₩ 30 mio for trip cancellations, and up to ₩ 5 mio for missed travel connection. By purchasing this insurance, you agree to all of conditions specified by CHUBB',
                        style: TextStyle(color: Colors.black54),
                        maxLines: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Rp3.000',
                            style: TextStyle(
                                fontSize: 14, color: Colors.deepOrange),
                          ),
                          Text(
                            ' / pax',
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(children: <Widget>[
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: delayInsuranceVal,
                            onChanged: (bool newValue) {
                              
                              setState(() {
                                if(newValue){
                                  ticket.addInsurancePrice(5500);
                                }
                                else{
                                  ticket.addInsurancePrice(-5500);
                                }
                                delayInsuranceVal = newValue;
                              });
                            },
                            activeColor: Colors.blue,
                            checkColor: Colors.white,
                          ),
                          Text('Flight Delay Insurance',
                              style: TextStyle(fontSize: 16))
                        ],
                      ),
                      Text(
                        'Get ₩ 50.000 if your flight is delayed longer than 90minutes for any reason ! \n\nNo claim hassles with instant notifications sent via SMSor email. \n\nBy Purcahsing this insurance, you agree to all of the conditions specified by Simas Insurtech',
                        style: TextStyle(color: Colors.black54),
                        maxLines: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Rp5.500',
                            style: TextStyle(
                                fontSize: 14, color: Colors.deepOrange),
                          ),
                          Text(
                            ' / pax',
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PriceYouPay(),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: Colors.deepOrange,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Payment()));
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ))
                ])));
  }
}

class PriceYouPay extends StatefulWidget {
  @override
  _PriceYouPayState createState() => _PriceYouPayState();
}

class _PriceYouPayState extends State<PriceYouPay> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              expand = !expand;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon((expand ? Icons.expand_less : Icons.expand_more)),
                  SizedBox(width: 5),
                  Text(
                    'Price You Pay',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              Text(
                'Rp${ticket.getTotal()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        ((expand
            ? Column(children: <Widget>[
                Divider(color: Colors.black45, thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${ticket.airline} (Adult) x${ticket.adult.toString()}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Rp${ticket.getMoney(ticket.totalticketprice)}',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Baggage Charge',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Rp${ticket.getMoney(ticket.baggageprice)}',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Travel Insurance',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Rp${ticket.getMoney(ticket.insuranceprice)}',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Service Fee',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Rp${ticket.getMoney(ticket.serviceprice)}',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ])
            : Container()))
      ]),
    );
  }
}
