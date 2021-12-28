import 'package:explora/menu/atm.dart';
import 'package:explora/menu/debit_card.dart';
import 'package:explora/menu/mobile_banking.dart';
import 'package:explora/menu/widget_top_up.dart';
import 'package:flutter/material.dart';

class TopUp extends StatefulWidget {
  @override
  _TopUpState createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
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
              'Top Up',
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
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            children: <Widget>[
              CurrentBalance(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Top Up Method',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              TopUpMethod(
                img: 'debit_card',
                title: 'Debit Card',
                goTo: DebitCard(),
              ),
              SizedBox(
                height: 10,
              ),
              TopUpMethod(
                img: 'atm',
                title: 'ATM',
                goTo: ATM(),
              ),
              SizedBox(
                height: 10,
              ),
              TopUpMethod(
                img: 'mobile_banking',
                title: 'Mobile Banking',
                goTo: MobileBanking(),
              )
            ],
          ),
        ));
  }
}

class TopUpMethod extends StatelessWidget {
  final String img;
  final String title;
  final Widget goTo;
  TopUpMethod({this.img, this.title, this.goTo});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => goTo),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/$img.png'),
                    width: 30,
                  ),
                  SizedBox(width: 10),
                  Text(title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                ]),
                Icon(Icons.chevron_right, size: 36)
              ]),
        ),
      ),
    );
  }
}
