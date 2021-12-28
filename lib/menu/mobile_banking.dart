import 'package:explora/menu/widget_top_up.dart';
import 'package:flutter/material.dart';

class MobileBanking extends StatefulWidget {
  @override
  _MobileBankingState createState() => _MobileBankingState();
}

class _MobileBankingState extends State<MobileBanking> {
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
              'Mobile Banking',
              style: TextStyle(
                  foreground: Paint()..shader = linearGradient,
                  fontSize: 32,
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
              MobileBankingMethod(img: 'bca'),
              MobileBankingMethod(img: 'bri'),
              MobileBankingMethod(img: 'cimb_niaga'),
              MobileBankingMethod(img: 'citybank'),
              MobileBankingMethod(img: 'dbs'),
              MobileBankingMethod(img: 'kdb'),
              MobileBankingMethod(img: 'mandiri'),
              MobileBankingMethod(img: 'uob'),
            ],
          ),
        ));
  }
}

class Instruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              color: Colors.blue[700]),
          child: Text('Instruction',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
              color: Colors.white),
          child: Column(
            children: <Widget>[
              InstructionList('Login to your m-BCA account'),
              InstructionList('Select menu m-Transfer'),
              InstructionList('Select BCA Virtual Account'),
              InstructionList(
                  'Insert 39358 + your phone number: \n 39358 08xx-xxxx-xxxx'),
              InstructionList('Insert Nominal Top Up'),
              InstructionList(
                  'Follow the instruction to finish the transaction')
            ],
          ),
        ),
      ],
    );
  }
}

class InstructionList extends StatelessWidget {
  final String title;
  InstructionList(this.title);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.brightness_1, color: Colors.blue[700], size: 12),
          SizedBox(width: 5),
          Text(title),
        ],
      ),
    );
  }
}

class MobileBankingMethod extends StatefulWidget {
  final String img;
  MobileBankingMethod({this.img});

  @override
  _MobileBankingMethodState createState() => _MobileBankingMethodState();
}

class _MobileBankingMethodState extends State<MobileBankingMethod> {
  IconData _icon = Icons.add;
  bool showInstruction = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Material(
            color: Colors.transparent,
                      child: InkWell(
              onTap: () {
                setState(() {
                  if (showInstruction){
                    _icon = Icons.add;
                    showInstruction = false;
                  }
                  else {
                    _icon = Icons.remove;
                    showInstruction = true;
                  }
                });
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Icon(
                          _icon,
                          color: Colors.blue,
                        )),
                    SizedBox(width: 20),
                    Image(
                      image: AssetImage('assets/images/bank/${widget.img}.png'),
                      height: 50,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                  ]),
            ),
          ),
          (showInstruction ? Instruction() : Container()),
          Divider(
            color: Colors.black54,
            thickness: 1,
          ),
          
        ],
      ),
    );
  }
}
