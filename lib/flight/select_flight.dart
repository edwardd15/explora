import 'package:explora/classes/Ticket.dart';
import 'package:explora/flight/select_flight1.dart';
import 'package:explora/flight/widget_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:explora/flight/widget_flight.dart';

class SelectFlight extends StatefulWidget {
  @override
  _SelectFlightState createState() => _SelectFlightState();
}

class _SelectFlightState extends State<SelectFlight> {
  String selectedClass = 'x';
  changeSelected(val) {
    setState(() {
      selectedClass = val;
    });
  }

  void _chooseSort() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: ((BuildContext context,
              StateSetter setModalState /*You can rename this!*/) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.pink[100],
                    Colors.purple[100],
                    Colors.cyan[100]
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Sort',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                    Divider(thickness: 1, color: Colors.black54),
                    RadioListTile(
                      value: 'Lowest Price',
                      groupValue: selectedClass,
                      onChanged: (val) {
                        setModalState(() => changeSelected(val));
                      },
                      title: Text('Lowest Price'),
                      activeColor: Colors.blue,
                    ),
                    RadioListTile(
                      value: 'Earliest Departure',
                      groupValue: selectedClass,
                      onChanged: (val) {
                        setModalState(() => changeSelected(val));
                      },
                      title: Text('Earliest Departure'),
                      activeColor: Colors.blue,
                    ),
                    RadioListTile(
                      value: 'Latest Departure',
                      groupValue: selectedClass,
                      onChanged: (val) {
                        setModalState(() => changeSelected(val));
                      },
                      title: Text('Latest Departure'),
                      activeColor: Colors.blue,
                    ),
                    RadioListTile(
                      value: 'Earliest Arival',
                      groupValue: selectedClass,
                      onChanged: (val) {
                        setModalState(() => changeSelected(val));
                      },
                      title: Text('Earliest Arival'),
                      activeColor: Colors.blue,
                    ),
                    RadioListTile(
                      value: 'Latest Arival',
                      groupValue: selectedClass,
                      onChanged: (val) {
                        setModalState(() => changeSelected(val));
                      },
                      title: Text('Latest Arival'),
                      activeColor: Colors.blue,
                    ),
                    BottomSheetButton(
                      title: 'Done',
                      buttonColor: Colors.blue[700],
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ]),
            );
          }));
        });
  }

  void _chooseFilter() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: ((BuildContext context,
              StateSetter setModalState /*You can rename this!*/) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.pink[100],
                    Colors.purple[100],
                    Colors.cyan[100]
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(
                      child: Text('Filter',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700)),
                    ),
                    Divider(thickness: 1, color: Colors.black54),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Transit      :  ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            DropDownButtonTransit()
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Departure Time :  ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            DropDownButtonDepartureTime()
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Arrival Time   :  ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            DropDownButtonArrivalTime()
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Airlines       :  ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            DropDownButtonAirlines()
                          ]),
                    ),
                    SliderPrice(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text(
                        'Facilities      :  ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                    FacilitiesRadio(),
                    Center(
                      child: BottomSheetButton(
                        title: 'Done',
                        buttonColor: Colors.blue[700],
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ]),
            );
          }));
        });
  }

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
                  '${ticket.cityfrom} → ${ticket.cityto}',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '${ticket.getFullDate()}/${ticket.adult.toString()}pax/${ticket.seatclass}',
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
                StreamBuilder(
                    stream:
                        Firestore.instance.collection('flights').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 20),
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot mypost =
                                  snapshot.data.documents[index];
                              return FlightCard(
                                airline: '${mypost['airline']}',
                                duration: '${mypost['duration']}',
                                image: '${mypost['image']}',
                                landing: '${mypost['landing']}',
                                points: mypost['points'],
                                price: mypost['price'],
                                takeoff: '${mypost['takeoff']}',
                                transit: '${mypost['transit']}',
                              );
                            });
                      }
                    }),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: 180,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _chooseSort();
                            },
                            child: Text('Sort',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 22)),
                          ),
                          Container(
                            height: double.infinity,
                            color: Colors.black54,
                            width: 1,
                          ),
                          GestureDetector(
                            onTap: () {
                              _chooseFilter();
                            },
                            child: Text('Filter',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 22)),
                          )
                        ]),
                  ),
                )
              ],
            )));
  }
}

class FlightCard extends StatelessWidget {
  final String airline;
  final String duration;
  final String image;
  final String landing;
  final int points;
  final int price;
  final String takeoff;
  final String transit;
  FlightCard(
      {this.airline,
      this.duration,
      this.image,
      this.landing,
      this.points,
      this.price,
      this.takeoff,
      this.transit});
  final oCcy = new NumberFormat("#,###", "en_US");
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SelectFlight1()));
        ticket.setTicket(
            timefrom: takeoff,
            timeto: landing,
            duration: duration,
            transit: transit,
            airlineimg: image,
            airline: airline,
            cityfrom1: 'SIN',
            cityto1: 'ICN',
            ticketprice: price.toDouble(),
            points: points);
      },
      child: Container(
        height: 160,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            takeoff,
                            style: TextStyle(fontSize: 22),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10)),
                            child: Text('SIN'),
                          )
                        ],
                      ),
                      SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(duration,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey)),
                          SizedBox(height: 1),
                          Container(width: 40, height: 1, color: Colors.grey),
                          SizedBox(height: 1),
                          Text(transit,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey))
                        ],
                      ),
                      SizedBox(width: 8),
                      Column(
                        children: <Widget>[
                          Text(
                            landing,
                            style: TextStyle(fontSize: 22),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10)),
                            child: Text('ICN'),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Rp' + oCcy.format(price),
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                        Text(
                          ' / pax',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(children: <Widget>[
                      Image(
                          image: AssetImage('assets/images/points.png'),
                          height: 14),
                      Text(
                        ' earn ${points.toString()} points',
                        style: TextStyle(color: Colors.black54),
                      )
                    ])
                  ])
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Image(image: NetworkImage(image), height: 36),
                  ),
                  SizedBox(width: 5),
                  Text(
                    airline,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                          border: Border.all(color: Colors.blue)),
                      child: Row(children: <Widget>[
                        Image(
                            image: AssetImage('assets/images/baggage.png'),
                            height: 16),
                        Image(
                            image: AssetImage('assets/images/meal.png'),
                            height: 16),
                      ]),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.grey[300]),
                      child: Icon(Icons.expand_more),
                    )
                  ])
            ]),
      ),
    );
  }
}
