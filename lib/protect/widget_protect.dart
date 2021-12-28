import 'package:explora/protect/travel_insurance.dart';
import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  CarouselCard({this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        height: 150,
        width: 240,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.fill),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black54,
                offset: Offset(1, 5),
                blurRadius: 5,
              )
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
    ]);
  }
}

class DoubleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10),
      height: 90,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.pink[100],
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0, 2),
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 100,
            child: Column(children: <Widget>[
              Image(width: 50, image: AssetImage('assets/images/shield.png')),
              Text('My Insurance', style: TextStyle(fontSize: 16))
            ]),
          ),
          Container(color: Colors.white, height: 80, width: 2),
          Container(
            width: 100,
            child: Column(children: <Widget>[
              Image(width: 50, image: AssetImage('assets/images/history.png')),
              Text('History', style: TextStyle(fontSize: 16))
            ]),
          ),
        ],
      ),
    );
  }
}

class Need extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(children: <Widget>[
        Text(
          'What Will You Need',
          style: TextStyle(fontSize: 28),
        ),
        NeedButton(
          content: 'Travel Insurance',
          iconName: 'travel_insurance',
          buttonColor: Colors.pink[100],
          goTo: TravelInsurance(),
        ),
        NeedButton(
          content: 'On-time Protection',
          iconName: 'on_time',
          buttonColor: Colors.purple[200],
          goTo: TravelInsurance(),
        ),
        NeedButton(
          content: 'Life Insurance',
          iconName: 'life_insurance',
          buttonColor: Colors.cyan[200],
          goTo: TravelInsurance(),
        ),
      ]),
    );
  }
}

class NeedButton extends StatelessWidget {
  NeedButton({this.content, this.buttonColor, this.iconName, this.goTo});
  final String content;
  final Color buttonColor;
  final String iconName;
  final Widget goTo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 3),
      child: SizedBox(
        width: double.infinity,
        child: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage('assets/images/$iconName.png')),
                SizedBox(width: 10),
                new Text(
                  content,
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 6),
            color: buttonColor,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => goTo));
            },
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            )),
      ),
    );
  }
}
