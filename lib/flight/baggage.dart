import 'package:explora/classes/Ticket.dart';
import 'package:flutter/material.dart';
import 'package:explora/classes/ProfileClass.dart';
import 'package:intl/intl.dart';

class Baggage extends StatefulWidget {
  @override
  _BaggageState createState() => _BaggageState();
}

class _BaggageState extends State<Baggage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.lightBlue[900],
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Text(
              'Baggage',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
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
                padding: EdgeInsets.symmetric(vertical: 10),
                children: <Widget>[
                  Center(
                      child: Text(
                    'Departure Flight',
                    style: TextStyle(fontSize: 18),
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  SelectBaggage()
                ])));
  }
}

class SelectBaggage extends StatefulWidget {
  @override
  _SelectBaggageState createState() => _SelectBaggageState();
}

class _SelectBaggageState extends State<SelectBaggage> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Image(
                  image: NetworkImage(ticket.airlineimg),
                  height: 32,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  ticket.cityfrom1,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Icon(Icons.arrow_forward),
                Text(
                  ticket.cityto1,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          color: Colors.grey[300],
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  personalData.getName1(),
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                Text(
                  '${ticket.kg} kg',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  BaggageButton(
                    kg: 10,
                    price: 35500,
                    notifyParent: refresh,
                  ),
                  BaggageButton1(
                    kg: 15,
                    price: 0,
                    notifyParent: refresh,
                  ),
                  BaggageButton(
                    kg: 20,
                    price: 70000,
                    notifyParent: refresh,
                  ),
                  BaggageButton(
                    kg: 25,
                    price: 95500,
                    notifyParent: refresh,
                  ),
                ])
          ]),
        )
      ],
    );
  }
}

class BaggageButton extends StatefulWidget {
  final int kg;
  final double price;
  final Function notifyParent;
  BaggageButton({this.kg, this.price, this.notifyParent});
  @override
  _BaggageButtonState createState() => _BaggageButtonState();
}

class _BaggageButtonState extends State<BaggageButton> {
  final oCcy = new NumberFormat("#,###", "en_US");
  bool selected = false;
  Color fontColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selected) {
            ticket.deductKg(widget.kg);
            ticket.deductBaggagePrice(widget.price);
          } else {
            ticket.addKg(widget.kg);
            ticket.addBaggagePrice(widget.price);
          }
          selected = !selected;
        });
        widget.notifyParent();
      },
      child: Container(
        width: 80,
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: (selected
                ? Border.all(color: Colors.blue[700])
                : Border.all(color: Colors.white)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38, offset: Offset(0, 3), blurRadius: 3)
            ]),
        child: Column(children: <Widget>[
          Text(
            widget.kg.toString() + ' kg',
            style: TextStyle(
                fontSize: 16, color: (selected ? Colors.blue : Colors.black)),
          ),
          Text(
            'Rp' + oCcy.format(widget.price),
            style: TextStyle(
                fontSize: 12,
                color: (selected ? Colors.blue[200] : Colors.black54)),
          )
        ]),
      ),
    );
  }
}

class BaggageButton1 extends StatefulWidget {
  final int kg;
  final double price;
  final Function notifyParent;
  BaggageButton1({this.kg, this.price, this.notifyParent});
  @override
  _BaggageButton1State createState() => _BaggageButton1State();
}

class _BaggageButton1State extends State<BaggageButton1> {
  final oCcy = new NumberFormat("#,###", "en_US");
  bool selected = true;
  Color fontColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: (selected
              ? Border.all(color: Colors.blue[700])
              : Border.all(color: Colors.white)),
          boxShadow: [
            BoxShadow(
                color: Colors.black38, offset: Offset(0, 3), blurRadius: 3)
          ]),
      child: Column(children: <Widget>[
        Text(
          widget.kg.toString() + ' kg',
          style: TextStyle(
              fontSize: 16, color: (selected ? Colors.blue : Colors.black)),
        ),
        Text(
          'Rp' + oCcy.format(widget.price),
          style: TextStyle(
              fontSize: 12,
              color: (selected ? Colors.blue[200] : Colors.black54)),
        )
      ]),
    );
  }
}
