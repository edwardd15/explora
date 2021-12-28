import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:explora/protect/widget_protect.dart';

class Protect extends StatelessWidget {
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
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              'Protect',
              style: TextStyle(
                  foreground: Paint()..shader = linearGradient,
                  fontSize: 40,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.w700),
            ),
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
                    fit: BoxFit.fitWidth),),
            child: ListView(
              children: <Widget>[
                Stack(children: <Widget>[
                  Container(
                    height: 210,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 3),
                              blurRadius: 5)
                        ]),
                  ),
                  Column(
                    children: <Widget>[
                      CarouselSlider(
                          enableInfiniteScroll: false,
                          viewportFraction: 0.7,
                          height: 160,
                          items: [
                            CarouselCard(
                                imageUrl:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQZy6FH0yvg36eTWOtY5PdMALVwbq3zvuNmweIkZvEGjQ-5OsCv&usqp=CAU'),
                            CarouselCard(
                                imageUrl:
                                    'https://pilot.ua/usa/allianz_366x280_family.jpg'),
                          ]),
                      DoubleButton(),
                      Need(),
                      Text('Our Partner', style: TextStyle(fontSize: 30)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/images/allianz.png'),
                            width: 60,
                          ),
                          Image(
                            image: AssetImage('assets/images/axa.png'),
                            width: 60,
                          ),
                          Image(
                            image: AssetImage('assets/images/sinarmas.png'),
                            width: 60,
                          ),
                          Image(
                            image: AssetImage('assets/images/zurich.png'),
                            width: 60,
                          ),
                        ],
                      ),
                      SizedBox(height: 15)
                    ],
                  ),
                ])
              ],
            )));
  }
}
