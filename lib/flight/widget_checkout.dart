import 'package:flutter/material.dart';
import 'package:explora/classes/Ticket.dart';

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
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Rp$price',
                    style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                  ),
                  Text(
                    ' / pax',
                    style: TextStyle(fontSize: 20),
                  )
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

class FlightCard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              color: Colors.grey[350]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${ticket.cityfrom} → ${ticket.cityto}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                ticket.duration,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
              color: Colors.white),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <
              Widget>[
            Container(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        ticket.timefrom,
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        ticket.getShortDate(),
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                  Text(
                    ticket.duration,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        ticket.timeto,
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        ticket.getShortDate(),
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.flight_takeoff,
                    size: 20,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 1,
                    color: Colors.blue,
                    height: 260,
                  ),
                  Icon(
                    Icons.flight_land,
                    size: 20,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Container(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${ticket.cityfrom} (${ticket.cityfrom1})',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          ticket.airportfrom,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Container(
                        height: 180,
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Colors.grey[350]),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Image(
                                    image: NetworkImage(
                                        ticket.airlineimg),
                                    height: 32,
                                  ),
                                  Text(
                                    ticket.airline,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Text(
                                'KE464/${ticket.seatclass}',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black54),
                              ),
                              Row(children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/baggage.png'),height: 24
                                  ),
                                ),
                                Text(
                                  'Baggage 1x23 kg\nCabin Baggage 12 kg',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                )
                              ]),
                              Row(children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Image(
                                    image: AssetImage('assets/images/meal.png'),height: 24
                                  ),
                                ),
                                Text(
                                  'In-flight Meals',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                )
                              ]),
                              Row(children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Image(
                                    image: AssetImage('assets/images/entertainment.png'),height: 24,
                                  ),
                                ),
                                Text(
                                  'In-flight Entertainment',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                )
                              ])
                            ])),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${ticket.cityto} (${ticket.cityto1})',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          ticket.airportto,
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ],
                ))
          ]),
        )
      ],
    );
  }
}

// class FlightCard1 extends StatelessWidget {
//   final String airline;
//   final String duration;
//   final String image;
//   final String landing;
//   final String points;
//   final String price;
//   final String takeoff;
//   final String transit;
//   FlightCard1(
//       {this.airline,
//       this.duration,
//       this.image,
//       this.landing,
//       this.points,
//       this.price,
//       this.takeoff,
//       this.transit});
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//               color: Colors.grey[350]),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 'Singapore → Seoul',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//               ),
//               Text(
//                 duration,
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
//               color: Colors.white),
//           child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <
//               Widget>[
//             Container(
//               height: 300,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: <Widget>[
//                       Text(
//                         takeoff,
//                         style: TextStyle(fontSize: 22),
//                       ),
//                       Text(
//                         '3 June',
//                         style: TextStyle(fontSize: 14, color: Colors.black54),
//                       ),
//                     ],
//                   ),
//                   Text(
//                     duration,
//                     style: TextStyle(fontSize: 14, color: Colors.black54),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: <Widget>[
//                       Text(
//                         landing,
//                         style: TextStyle(fontSize: 22),
//                       ),
//                       Text(
//                         '3 June',
//                         style: TextStyle(fontSize: 14, color: Colors.black54),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8),
//               child: Column(
//                 children: <Widget>[
//                   Icon(
//                     Icons.flight_takeoff,
//                     size: 20,
//                     color: Colors.blue,
//                   ),
//                   Container(
//                     width: 1,
//                     color: Colors.blue,
//                     height: 260,
//                   ),
//                   Icon(
//                     Icons.flight_land,
//                     size: 20,
//                     color: Colors.blue,
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//                 height: 300,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           'Singapore (CIN)',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         Text(
//                           'Changi intl',
//                           style: TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                     Container(
//                         height: 180,
//                         padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(12)),
//                             color: Colors.grey[350]),
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Row(
//                                 children: <Widget>[
//                                   Image(
//                                     image: NetworkImage(
//                                         'https://media-exp1.licdn.com/dms/image/C4E0BAQGZ7io5l9mCPA/company-logo_200_200/0?e=2159024400&v=beta&t=ftI_hjUdoCFG8uR2Yo8hH2EXwgSVOFBB9Fo_5gi52Cg'),
//                                     height: 32,
//                                   ),
//                                   Text(
//                                     airline,
//                                     style: TextStyle(fontSize: 16),
//                                   ),
//                                 ],
//                               ),
//                               Text(
//                                 'KE464/Economy',
//                                 style: TextStyle(
//                                     fontSize: 14, color: Colors.black54),
//                               ),
//                               Row(children: <Widget>[
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 8),
//                                   child: Image(
//                                     image:
//                                         AssetImage('assets/images/baggage.png'),height: 24
//                                   ),
//                                 ),
//                                 Text(
//                                   'Baggage 1x23 kg\nCabin Baggage 12 kg',
//                                   style: TextStyle(
//                                       fontSize: 14, color: Colors.black54),
//                                 )
//                               ]),
//                               Row(children: <Widget>[
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 8),
//                                   child: Image(
//                                     image: AssetImage('assets/images/meal.png'),height: 24
//                                   ),
//                                 ),
//                                 Text(
//                                   'In-flight Meals',
//                                   style: TextStyle(
//                                       fontSize: 14, color: Colors.black54),
//                                 )
//                               ]),
//                               Row(children: <Widget>[
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 8),
//                                   child: Image(
//                                     image: AssetImage('assets/images/entertainment.png'),height: 24,
//                                   ),
//                                 ),
//                                 Text(
//                                   'In-flight Entertainment',
//                                   style: TextStyle(
//                                       fontSize: 14, color: Colors.black54),
//                                 )
//                               ])
//                             ])),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           'Singapore (CIN)',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         Text(
//                           'Changi intl',
//                           style: TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ))
//           ]),
//         )
//       ],
//     );
//   }
// }