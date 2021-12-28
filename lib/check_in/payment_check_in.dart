import 'package:explora/check_in/flight_ticket.dart';
import 'package:explora/classes/Balance.dart';
import 'package:explora/classes/CheckedIn.dart';
import 'package:explora/classes/Ticket.dart';
import 'package:explora/flight/payment/payment_method.dart';
import 'package:explora/flight/payment/widget_payment.dart';
import 'package:explora/menu/top_up.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentCheckIn extends StatefulWidget {
  @override
  _PaymentCheckInState createState() => _PaymentCheckInState();
}

class _PaymentCheckInState extends State<PaymentCheckIn> {
  final oCcy = new NumberFormat("#,###", "en_US");
  Widget showMethod() {
    if (ticket.paymentmethod == 'Credit / Debit Card') {
      return CreditDebitImg();
    } else if (ticket.paymentmethod == 'Wallet') {
      return Balanceimg();
    } else if (ticket.paymentmethod == 'BCA Transfer') {
      return BCAimg();
    } else if (ticket.paymentmethod == 'UOB Transfer') {
      return UOBimg();
    } else if (ticket.paymentmethod == 'KDB Transfer') {
      return KDBimg();
    } else if (ticket.paymentmethod == 'ATM') {
      return ATMimg();
    } else if (ticket.paymentmethod == 'BCA Klikpay') {
      return BCAKlikPayimg();
    } else {
      return Balanceimg();
    }
  }

  Widget showInstruction() {
    if (ticket.paymentmethod == 'Credit / Debit Card') {
      return CreditDebitInstruction();
    } else if (ticket.paymentmethod == 'Wallet') {
      return Container();
    } else if (ticket.paymentmethod == 'BCA Transfer') {
      return ATMInstruction();
    } else if (ticket.paymentmethod == 'UOB Transfer') {
      return ATMInstruction();
    } else if (ticket.paymentmethod == 'KDB Transfer') {
      return ATMInstruction();
    } else if (ticket.paymentmethod == 'ATM') {
      return ATMInstruction();
    } else if (ticket.paymentmethod == 'BCA Klikpay') {
      return BCAKlikPayInstruction();
    } else {
      return Balanceimg();
    }
  }

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
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            title: Text(
              'Payment',
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
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                children: <Widget>[
                  Text(
                    'Payment Method',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(ticket.paymentmethod,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PaymentMethod()));
                                  },
                                  child: Text('Change',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blue)),
                                )
                              ]),
                        ),
                        Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.black38),
                        Padding(
                            padding: const EdgeInsets.all(12),
                            child: showMethod())
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  showInstruction(),
                  SizedBox(height: 15),
                  SubtotalPriceCheckIn()
                ])));
  }
}

class SubtotalPriceCheckIn extends StatefulWidget {
  @override
  _SubtotalPriceCheckInState createState() => _SubtotalPriceCheckInState();
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Close"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget topupButton = FlatButton(
    child: Text("Top Up"),
    onPressed: () {
      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) => TopUp()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Insufficient Balance"),
    content: Text("Please change your payment or top up your wallet"),
    actions: [
      cancelButton,
      topupButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class _SubtotalPriceCheckInState extends State<SubtotalPriceCheckIn> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              expand = !expand;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon((expand ? Icons.expand_less : Icons.expand_more)),
                  SizedBox(width: 5),
                  Text(
                    'Subtotal Price',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              Text(
                'Rp${checkedIn.getCheckinPrice(checkedIn.i)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        ((expand
            ? Column(children: <Widget>[
                Divider(color: Colors.black45, thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Seat Charge',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Rp${checkedIn.getMoney(checkedIn.ticket[checkedIn.i]['seatprice'])}',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Service Fee',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Rp${ticket.getMoney(ticket.serviceprice)}',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ])
            : Container())),
        Divider(color: Colors.black45, thickness: 1),
        FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            color: Colors.deepOrange,
            onPressed: () {
              if (ticket.paymentmethod == 'Wallet') {
                if (balance.isSuciffient(
                    checkedIn.ticket[checkedIn.i]['checkinprice'])) {
                  balance.deductBalance1(
                      checkedIn.ticket[checkedIn.i]['checkinprice']);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FlightTicket()));
                  checkedIn.ticket[checkedIn.i]['ispaid'] = true;
                } else {
                  showAlertDialog(context);
                }
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FlightTicket()));
                checkedIn.ticket[checkedIn.i]['ispaid'] = true;
              }
            },
            child: Text(
              'Pay with ${ticket.paymentmethod}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ))
      ]),
    );
  }
}
