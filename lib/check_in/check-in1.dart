import 'package:explora/check_in/flight_ticket.dart';
import 'package:explora/check_in/passport_detail.dart';
import 'package:explora/classes/CheckedIn.dart';
import 'package:explora/classes/ProfileClass.dart';
import 'package:flutter/material.dart';

class CheckIn1 extends StatefulWidget {
  @override
  _CheckIn1State createState() => _CheckIn1State();
}

class _CheckIn1State extends State<CheckIn1> {
  final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Colors.pink[100], Colors.purple[200], Colors.cyan[200]],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            title: Text(
              'Check-in',
              style: TextStyle(
                  foreground: Paint()..shader = linearGradient,
                  fontSize: 36,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.w700),
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
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  child: Text(
                    'Online Check-in',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      itemCount: checkedIn.n,
                      itemBuilder: (BuildContext context, int index) {
                        if (checkedIn.n == 0) {
                          return Center(child: Text('No Check-in available'));
                        } else {
                          if (checkedIn.ticket[index]['ispaid']) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FlightTicket()));
                              },
                              child: Stack(
                                children: <Widget>[
                                  CheckInCard(
                                      cityfrom: checkedIn.ticket[index]
                                          ['cityfrom'],
                                      cityfrom1: checkedIn.ticket[index]
                                          ['cityfrom1'],
                                      cityto: checkedIn.ticket[index]['cityto'],
                                      cityto1: checkedIn.ticket[index]
                                          ['cityto1'],
                                      date: checkedIn.getShortDate(index),
                                      time: checkedIn.ticket[index]['timefrom'],
                                      transit: checkedIn.ticket[index]
                                          ['transit']),
                                  Container(
                                    width: double.infinity,
                                    height: 170,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      gradient: RadialGradient(
                                        colors: [
                                          Colors.black12,
                                          Colors.black26,
                                        ],
                                        radius: 1,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 20, right: 20),
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(' PAID ',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white70,
                                                decoration:
                                                    TextDecoration.combine([
                                                  TextDecoration.overline,
                                                  TextDecoration.underline
                                                ]))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {
                                checkedIn.i = index;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PassportDetail()));
                              },
                              child: CheckInCard(
                                  cityfrom: checkedIn.ticket[index]['cityfrom'],
                                  cityfrom1: checkedIn.ticket[index]
                                      ['cityfrom1'],
                                  cityto: checkedIn.ticket[index]['cityto'],
                                  cityto1: checkedIn.ticket[index]['cityto1'],
                                  date: checkedIn.getShortDate(index),
                                  time: checkedIn.ticket[index]['timefrom'],
                                  transit: checkedIn.ticket[index]['transit']),
                            );
                          }
                        }
                      }),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 24),
                //   child: SizedBox(
                //     width: double.infinity,
                //     child: FlatButton(
                //         shape: RoundedRectangleBorder(
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(10))),
                //         color: Colors.deepOrange,
                //         onPressed: () {},
                //         child: Text(
                //           'Continue',
                //           style: TextStyle(
                //               fontSize: 20,
                //               fontWeight: FontWeight.w600,
                //               color: Colors.white),
                //         )),
                //   ),
                // ),
                // SizedBox(height: 20),
              ],
            )));
  }
}

class CheckInCard extends StatelessWidget {
  final String cityfrom;
  final String cityto;
  final String cityfrom1;
  final String cityto1;
  final String date;
  final String time;
  final String transit;
  CheckInCard(
      {this.cityfrom,
      this.cityto,
      this.cityfrom1,
      this.cityto1,
      this.date,
      this.transit,
      this.time});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white),
            child: Column(
              children: <Widget>[
                Text(
                  '$cityfrom ($cityfrom1) → $cityto ($cityto1)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  '$date | $time',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                Text(
                  transit,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
                color: Colors.lightBlue[900]),
            child: Text(
              personalData.getName1(),
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
