import 'package:explora/check_in/choose_seat.dart';
import 'package:explora/classes/CheckedIn.dart';
import 'package:explora/check_in/payment_check_in.dart';
import 'package:flutter/material.dart';

class FlightFacilityDetails extends StatefulWidget {
  @override
  _FlightFacilityDetailsState createState() => _FlightFacilityDetailsState();
}

class _FlightFacilityDetailsState extends State<FlightFacilityDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.lightBlue[900],
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Text(
              'Flight Facility Details',
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
            child: Stack(
              children: <Widget>[
                ListView(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    children: <Widget>[
                      Text(
                        'Baggage',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 5),
                      Column(children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15)),
                              color: Colors.white),
                          child: Row(children: <Widget>[
                            Image(
                              image: AssetImage('assets/images/baggage1.png'),
                              height: 36,
                            ),
                            SizedBox(width: 15),
                            Text('Baggage that has been added'),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          padding:
                              EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(15)),
                              color: Colors.deepOrange),
                          child: Text(
                            '${checkedIn.ticket[checkedIn.i]['cityfrom1']} → ${checkedIn.ticket[checkedIn.i]['cityto1']}   ${checkedIn.ticket[checkedIn.i]['kg'].toString()} kg',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ]),
                      SizedBox(height: 10),
                      Text(
                        'Seat',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseSeat()));
                        },
                        child: Column(children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15)),
                                color: Colors.white),
                            child: Row(children: <Widget>[
                              Image(
                                image: AssetImage('assets/images/seat.png'),
                                height: 36,
                              ),
                              SizedBox(width: 15),
                              Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text('Choose your seat'),
                                      Text(
                                        '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '*randomly assigned',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(15)),
                                color: Colors.grey[300]),
                            child: Text(
                              '${checkedIn.ticket[checkedIn.i]['cityfrom1']} → ${checkedIn.ticket[checkedIn.i]['cityto1']}   ${checkedIn.ticket[checkedIn.i]['seat']}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ]),
                      )
                    ]),
                BottomCheckout(
                  price: checkedIn
                      .getMoney(checkedIn.ticket[checkedIn.i]['seatprice']),
                  buttonName: 'Continue',
                  goTo: PaymentCheckIn(),
                )
              ],
            )));
  }
}

class BottomCheckout extends StatelessWidget {
  final String price;
  final String buttonName;
  final Widget goTo;
  BottomCheckout({this.price, this.buttonName, this.goTo});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: 60,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Subtotal',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Rp$price',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Colors.deepOrange,
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => goTo));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      buttonName,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ))
            ],
          )),
    );
  }
}
