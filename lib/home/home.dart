import 'package:explora/check_in/check_in.dart';
import 'package:explora/home/widget_home.dart';
import 'package:explora/home/scan_qr.dart';
import 'package:explora/deals/deals.dart';
import 'package:explora/lounge/lounge.dart';
import 'package:explora/my_booking/my_booking.dart';
import 'package:explora/profile/profile.dart';
import 'package:explora/protect/protect.dart';
import 'package:explora/flight/flight.dart';
import 'package:flutter/material.dart';
import 'package:explora/classes/ProfileClass.dart';

import 'package:explora/classes/Balance.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: Row(
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/explora_icon_64px.png"),
                width: 54,
              ),
              SizedBox(width: 20),
              Text(
                'Explora',
                style: TextStyle(
                    foreground: Paint()..shader = linearGradient,
                    fontSize: 36,
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          elevation: 10,
        ),
      ),
      endDrawer: Drawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.pink[100], Colors.purple[200], Colors.cyan[200]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              repeat: ImageRepeat.repeatY,
              fit: BoxFit.fitWidth),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.cyan,
                  width: 2,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.blueGrey,
                    offset: Offset(6, 8),
                    blurRadius: 0,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          customBorder: CircleBorder(),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()),
                            );
                          },
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: (personalData.profPic != null)
                                ? FileImage(personalData.profPic)
                                : AssetImage(
                                    'assets/images/default_profile.png'),
                            //NetworkImage(
                            //    'https://www.dreamers.id/img_artikel/45kim-da-mi-itaewon-class.jpg'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Text(personalData.getName(),
                            style: TextStyle(fontSize: 20, fontFamily: 'PlayfairDisplay'),
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.fade),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScanScreen()),
                              );
                            },
                            child: Image(
                                image:
                                    AssetImage('assets/images/qr_code.png'))),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 3),
                                  blurRadius: 1,
                                )
                              ],
                              color: Colors.pink[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Row(children: <Widget>[
                            Image(
                              image: AssetImage('assets/images/points.png'),
                              width: 22,
                            ),
                            SizedBox(width: 3),
                            Text('${balance.getPoints(personalData)} points')
                          ]),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 3),
                                  blurRadius: 1,
                                )
                              ],
                              color: Colors.pink[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Row(children: <Widget>[
                            Image(
                                image: AssetImage('assets/images/balance.png'),
                                width: 22),
                            SizedBox(width: 3),
                            Text('Rp${balance.getBalance(personalData)}')
                          ]),
                        ),
                      ]),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        MenuButton(
                          imageName: 'flight',
                          caption: 'Flight',
                          goTo: Flight(),
                        ),
                        MenuButton(
                          imageName: 'check_in',
                          caption: 'Check-in',
                          goTo: CheckIn(),
                        ),
                        MenuButton(
                          imageName: 'protect',
                          caption: 'Protect',
                          goTo: Protect(),
                        ),
                      ]),
                  SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        MenuButton(
                          imageName: 'lounge',
                          caption: 'Lounge',
                          goTo: Lounge(),
                        ),
                        MenuButton(
                          imageName: 'deals',
                          caption: 'Deals',
                          goTo: Deals(),
                        ),
                        MenuButton(
                          imageName: 'my_booking',
                          caption: 'My Booking',
                          goTo: MyBooking(),
                        ),
                      ]),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Column(
                  children: <Widget>[
                    Text('What To Explore',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationThickness: 3,
                        )),
                    WhatToExplore(
                      placeName: 'Malaysia',
                      imageUrl:
                          'https://specials-images.forbesimg.com/imageserve/5e5de9e944b78400068bdc42/960x0.jpg?fit=scale',
                    ),
                    WhatToExplore(
                      placeName: 'Seoul',
                      imageUrl:
                          'https://qtxasset.com/styles/breakpoint_sm_default_480px_w/s3/Luxury%20Travel%20Advisor-1507819377/SeoulSouthKoreaReabirdnaiStockGettyImagesPlusGettyImages.jpg?LZFFFuLhkDPTph7nNzlrkwuDP9JLLswh&itok=yDeTrDz1',
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
