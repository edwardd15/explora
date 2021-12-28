import 'package:explora/check_in/flight_facility_details.dart';
import 'package:explora/classes/CheckedIn.dart';
import 'package:explora/classes/Seat.dart';
import 'package:flutter/material.dart';

class ChooseSeat extends StatefulWidget {
  @override
  _ChooseSeatState createState() => _ChooseSeatState();
}

class _ChooseSeatState extends State<ChooseSeat> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.lightBlue[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Row(
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
                SizedBox(width: 15),
                Text(
                  '${checkedIn.ticket[checkedIn.i]['cityfrom']} → ${checkedIn.ticket[checkedIn.i]['cityto']}',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
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
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white),
                          child: Column(children: <Widget>[
                            Text('Your Seat', style: TextStyle(fontSize: 20)),
                            Text(checkedIn.ticket[checkedIn.i]['seat'],
                                style: TextStyle(fontSize: 36)),
                          ]),
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                                color: Colors.white),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                          height: 18,
                                          width: 18,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.green)),
                                      Text('  Your Seat'),
                                      SizedBox(width: 15),
                                      Container(
                                          height: 18,
                                          width: 18,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey[350])),
                                      Text('  Not Available'),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          SeatButton(refresh, 0, 0),
                                          SeatButton(refresh, 0, 1),
                                          SeatButton(refresh, 0, 2),
                                          Container(
                                              width: 20,
                                              child: Text('1',
                                                  style:
                                                      TextStyle(fontSize: 18))),
                                          SeatButton(refresh, 0, 3),
                                          SeatButton(refresh, 0, 4),
                                          SeatButton(refresh, 0, 5),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          SeatButton(refresh, 1, 0),
                                          SeatButton(refresh, 1, 1),
                                          SeatButton(refresh, 1, 2),
                                          Container(
                                              width: 20,
                                              child: Text('2',
                                                  style:
                                                      TextStyle(fontSize: 18))),
                                          SeatButton(refresh, 1, 3),
                                          SeatButton(refresh, 1, 4),
                                          SeatButton(refresh, 1, 5),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          SeatButton(refresh, 2, 0),
                                          SeatButton(refresh, 2, 1),
                                          SeatButton(refresh, 2, 2),
                                          Container(
                                              width: 20,
                                              child: Text('3',
                                                  style:
                                                      TextStyle(fontSize: 18))),
                                          SeatButton(refresh, 2, 3),
                                          SeatButton(refresh, 2, 4),
                                          SeatButton(refresh, 2, 5),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          SeatButton(refresh, 3, 0),
                                          SeatButton(refresh, 3, 1),
                                          SeatButton(refresh, 3, 2),
                                          Container(
                                              width: 20,
                                              child: Text('4',
                                                  style:
                                                      TextStyle(fontSize: 18))),
                                          SeatButton(refresh, 3, 3),
                                          SeatButton(refresh, 3, 4),
                                          SeatButton(refresh, 3, 5),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          SeatButton(refresh, 4, 0),
                                          SeatButton(refresh, 4, 1),
                                          SeatButton(refresh, 4, 2),
                                          Container(
                                              width: 20,
                                              child: Text('5',
                                                  style:
                                                      TextStyle(fontSize: 18))),
                                          SeatButton(refresh, 4, 3),
                                          SeatButton(refresh, 4, 4),
                                          SeatButton(refresh, 4, 5),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          SeatButton(refresh, 5, 0),
                                          SeatButton(refresh, 5, 1),
                                          SeatButton(refresh, 5, 2),
                                          Container(
                                              width: 20,
                                              child: Text('6',
                                                  style:
                                                      TextStyle(fontSize: 18))),
                                          SeatButton(refresh, 5, 3),
                                          SeatButton(refresh, 5, 4),
                                          SeatButton(refresh, 5, 5),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          SeatButton(refresh, 6, 0),
                                          SeatButton(refresh, 6, 1),
                                          SeatButton(refresh, 6, 2),
                                          Container(
                                              width: 20,
                                              child: Text('7',
                                                  style:
                                                      TextStyle(fontSize: 18))),
                                          SeatButton(refresh, 6, 3),
                                          SeatButton(refresh, 6, 4),
                                          SeatButton(refresh, 6, 5),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          SeatButton(refresh, 7, 0),
                                          SeatButton(refresh, 7, 1),
                                          SeatButton(refresh, 7, 2),
                                          Container(
                                              width: 20,
                                              child: Text('8',
                                                  style:
                                                      TextStyle(fontSize: 18))),
                                          SeatButton(refresh, 7, 3),
                                          SeatButton(refresh, 7, 4),
                                          SeatButton(refresh, 7, 5),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          SeatButton(refresh, 8, 0),
                                          SeatButton(refresh, 8, 1),
                                          SeatButton(refresh, 8, 2),
                                          Container(
                                              width: 20,
                                              child: Text('9',
                                                  style:
                                                      TextStyle(fontSize: 18))),
                                          SeatButton(refresh, 8, 3),
                                          SeatButton(refresh, 8, 4),
                                          SeatButton(refresh, 8, 5),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          SeatButton(refresh, 9, 0),
                                          SeatButton(refresh, 9, 1),
                                          SeatButton(refresh, 9, 2),
                                          Container(
                                              width: 20,
                                              child: Text('10',
                                                  style:
                                                      TextStyle(fontSize: 18))),
                                          SeatButton(refresh, 9, 3),
                                          SeatButton(refresh, 9, 4),
                                          SeatButton(refresh, 9, 5),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          SeatButton(refresh, 10, 0),
                                          SeatButton(refresh, 10, 1),
                                          SeatButton(refresh, 10, 2),
                                          Container(
                                              width: 20,
                                              child: Text('11',
                                                  style:
                                                      TextStyle(fontSize: 18))),
                                          SeatButton(refresh, 10, 3),
                                          SeatButton(refresh, 10, 4),
                                          SeatButton(refresh, 10, 5),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          SeatButton(refresh, 11, 0),
                                          SeatButton(refresh, 11, 1),
                                          SeatButton(refresh, 11, 2),
                                          Container(
                                              width: 20,
                                              child: Text('12',
                                                  style:
                                                      TextStyle(fontSize: 18))),
                                          SeatButton(refresh, 11, 3),
                                          SeatButton(refresh, 11, 4),
                                          SeatButton(refresh, 11, 5),
                                        ]),
                                  ),
                                ]),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(20)),
                                color: Colors.grey[350]),
                            child: Row(
                              children: <Widget>[
                                Container(
                                    height: 18,
                                    width: 18,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.deepOrange)),
                                Text('  Hot Seat (Rp10.000)'),
                                SizedBox(width: 15),
                                Container(
                                    height: 18,
                                    width: 18,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.lightBlue[800])),
                                Text('  Standard Seat (Rp4.150)'),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 60)
                    ]),
                BottomCheckout(
                  price: checkedIn
                      .getMoney(checkedIn.ticket[checkedIn.i]['seatprice']),
                  buttonName: 'Select',goTo: FlightFacilityDetails(),
                )
              ],
            )));
  }
}

class SeatButton extends StatefulWidget {
  final Function notifyParent;
  final int i;
  final int j;
  SeatButton(this.notifyParent, this.i, this.j);
  @override
  _SeatButtonState createState() => _SeatButtonState();
}

class _SeatButtonState extends State<SeatButton> {
  Color getColor() {
    switch (seat.status[widget.i][widget.j]) {
      case 0:
        return Colors.grey[350];
        break;
      case 1:
        return Colors.lightBlue[800];
        break;
      case 2:
        return Colors.deepOrange;
        break;
      default:
        return Colors.green;
    }
  }

  bool selected = false;
  int tempStatus;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (seat.status[widget.i][widget.j] != 0) {
            selected = true;
            checkedIn.ticket[checkedIn.i]['seat'] =
                seat.number[widget.i][widget.j];
            if (seat.status[widget.i][widget.j] == 1) {
              checkedIn.ticket[checkedIn.i]['seatprice'] = 4150;
            } else if (seat.status[widget.i][widget.j] == 2) {
              checkedIn.ticket[checkedIn.i]['seatprice'] = 10000;
            }
            seat.selectSeat(widget.i, widget.j);
          }
          widget.notifyParent();
        });
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(shape: BoxShape.circle, color: getColor()),
        child: Center(
            child: Text(
          seat.number[widget.i][widget.j],
          style: TextStyle(fontSize: 14),
        )),
      ),
    );
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
