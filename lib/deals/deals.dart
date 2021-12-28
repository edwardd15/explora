import 'package:explora/deals/widget_deals.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Deals extends StatefulWidget {
  @override
  _DealsState createState() => _DealsState();
}

class _DealsState extends State<Deals> {
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
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Text(
              'Deals',
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
            child: StreamBuilder(
                stream: Firestore.instance.collection('deals').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot mypost =
                              snapshot.data.documents[index];
                          if (index == 0) {
                            return Column(
                              children: <Widget>[
                                Text(
                                  'Vacation Bundle Deals',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'PlayfairDisplay',
                                  ),
                                ),
                                DealsCard(
                                  imageUrl: '${mypost['image']}',
                                  title: '${mypost['title']}',
                                  validityDays: '${mypost['days']}',
                                  offers: '${mypost['offers']}',
                                  price: '${mypost['price']}',
                                ),
                              ],
                            );
                          } else {
                            return DealsCard(
                              imageUrl: '${mypost['image']}',
                              title: '${mypost['title']}',
                              validityDays: '${mypost['days']}',
                              offers: '${mypost['offers']}',
                              price: '${mypost['price']}',
                            );
                          }
                        });
                  }
                })));
  }
}

//  DealsCard(
//                   imageUrl:
//                       'https://images.yuktravel.com/images/upload/tours/images/Kuala-Lumpur-Feb-WEB-Mobile-480x320.jpg',
//                   title: 'Malaysia Bundle',
//                   offers: '58',
//                   validityDays: '90',
//                   price: '349.000',
//                 ),
//                 DealsCard(
//                   imageUrl:
//                       'https://payload.cargocollective.com/1/14/469802/11600348/singaporelanding_1000.jpg',
//                   title: 'Singapore Bundle',
//                   offers: '20',
//                   validityDays: '27',
//                   price: '400.000',
//                 )
