import 'package:explora/classes/Balance.dart';
import 'package:explora/classes/ProfileClass.dart';
import 'package:explora/classes/Ticket.dart';
import 'package:flutter/material.dart';
import 'package:explora/flight/payment/widget_payment.dart';

class PaymentCheckInMethod extends StatefulWidget {
  @override
  _PaymentCheckInMethodState createState() => _PaymentCheckInMethodState();
}

class _PaymentCheckInMethodState extends State<PaymentCheckInMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.lightBlue[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Row(
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
                SizedBox(width: 16),
                Text(
                  'Payment Method',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ],
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
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                children: <Widget>[
                  Text(
                    'Wallet',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      ticket.paymentmethod = 'Wallet';
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white),
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/images/balance.png'),
                            height: 36,
                          ),
                          SizedBox(width: 10),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Wallet Balance',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54)),
                                SizedBox(height: 5),
                                Text('Rp${balance.getBalance(personalData)}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                              ])
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Credit / Debit Card',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      ticket.paymentmethod = 'Credit / Debit Card';
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text('Credit / Debit Card',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700)),
                          ),
                          Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.black38),
                          Padding(
                              padding: const EdgeInsets.all(12),
                              child: CreditDebitImg())
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Bank Transfer',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(onTap: () {
                      ticket.paymentmethod = 'BCA Transfer';
                      Navigator.pop(context);
                    },
                                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white),
                        child: BCAimg()),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(onTap: () {
                      ticket.paymentmethod = 'KDB Transfer';
                      Navigator.pop(context);
                    },
                                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white),
                        child: KDBimg()),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(onTap: () {
                      ticket.paymentmethod = 'UOB Transfer';
                      Navigator.pop(context);
                    },
                                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white),
                        child: UOBimg()),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(onTap: () {
                      ticket.paymentmethod = 'ATM';
                      Navigator.pop(context);
                    },
                                      child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text('ATM',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700)),
                          ),
                          Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.black38),
                          Padding(
                              padding: const EdgeInsets.all(12), child: ATMimg())
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Internet Banking',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(onTap: () {
                      ticket.paymentmethod = 'BCA Klikpay';
                      Navigator.pop(context);
                    },
                                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white),
                        child: BCAKlikPayimg()),
                  ),
                ])));
  }
}
