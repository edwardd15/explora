import 'package:flutter/material.dart';

class TicketList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.pink[100],
          Colors.purple[200],
          Colors.cyan[200]
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                image: DecorationImage(
                    image: AssetImage('assets/images/pattern.png'),
                    repeat: ImageRepeat.repeatY,
                    fit: BoxFit.fitWidth),),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Ongoing Purchases', style: TextStyle(fontSize: 26)),
                      Icon(
                        Icons.chevron_right,
                        size: 40,
                      )
                    ])),
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 8, top: 8),
                    width: 0.92 * MediaQuery.of(context).size.width,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.cyan[100],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    height: 130,
                    width: 0.91 * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(2, 3),
                              blurRadius: 3)
                        ]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Booking ID 178249653',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'IDR 11.383.720',
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple[100],
                                  border: Border.all(
                                      color: Colors.deepPurple[300])),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.flight, size: 24),
                                  SizedBox(width: 10),
                                  Text(
                                    'Bangkok',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(Icons.arrow_forward, size: 24),
                                  SizedBox(width: 10),
                                  Text('Dubai', style: TextStyle(fontSize: 18))
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.symmetric(vertical:8, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.pink[100],
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 3),
                                      blurRadius: 3)
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Text(
                              'Waiting for Payment - 01:34:09',
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Purchased', style: TextStyle(fontSize: 26)),
                      Icon(
                        Icons.chevron_right,
                        size: 40,
                      )
                    ])),
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 8, top: 8),
                    width: 0.92 * MediaQuery.of(context).size.width,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.cyan[100],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom:10),
                    height: 140,
                    width: 0.91 * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(2, 3),
                              blurRadius: 3)
                        ]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                  color: Colors.deepPurple[100],
                                  border: Border.all(
                                      color: Colors.deepPurple[300])),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.flight, size: 24),
                                  SizedBox(width: 10),
                                  Text(
                                    'Bangkok',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(Icons.arrow_forward, size: 24),
                                  SizedBox(width: 10),
                                  Text('Dubai', style: TextStyle(fontSize: 18))
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text('Sat, 2 May 2020',
                                style: TextStyle(fontSize: 18)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text('Dubai - International Airport',
                                style: TextStyle(fontSize: 18)),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.symmetric(vertical:8, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.cyan[100],
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 3),
                                      blurRadius: 3)
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Text(
                              'Ticket Issued',
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
