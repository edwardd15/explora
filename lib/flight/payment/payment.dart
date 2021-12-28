import 'package:explora/classes/Ticket.dart';
import 'package:explora/flight/payment/payment_method.dart';
import 'package:explora/flight/payment/widget_payment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final oCcy = new NumberFormat("#,###", "en_US");
  Widget showMethod() {
    if (ticket.paymentmethod == 'Credit / Debit Card') {
      return CreditDebitImg();
    }
    else if (ticket.paymentmethod == 'Wallet') {
      return Balanceimg();
    }
    else if (ticket.paymentmethod == 'BCA Transfer') {
      return BCAimg();
    }
    else if (ticket.paymentmethod == 'UOB Transfer') {
      return UOBimg();
    }
    else if (ticket.paymentmethod == 'KDB Transfer') {
      return KDBimg();
    }
    else if (ticket.paymentmethod == 'ATM') {
      return ATMimg();
    }
    else if (ticket.paymentmethod == 'BCA Klikpay') {
      return BCAKlikPayimg();
    }
    else {
      return Balanceimg();
    }
  }

  Widget showInstruction() {
    if (ticket.paymentmethod == 'Credit / Debit Card') {
      return CreditDebitInstruction();
    }
    else if (ticket.paymentmethod == 'Wallet') {
      return Container();
    }
    else if (ticket.paymentmethod == 'BCA Transfer') {
      return ATMInstruction();
    }
    else if (ticket.paymentmethod == 'UOB Transfer') {
      return ATMInstruction();
    }
    else if (ticket.paymentmethod == 'KDB Transfer') {
      return ATMInstruction();
    }
    else if (ticket.paymentmethod == 'ATM') {
      return ATMInstruction();
    }
    else if (ticket.paymentmethod == 'BCA Klikpay') {
      return BCAKlikPayInstruction();
    }
    else {
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
            automaticallyImplyLeading: false,
            backgroundColor: Colors.lightBlue[900],
            centerTitle: true,
            title: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Payment',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.looks_one, size: 16),
                          SizedBox(width: 3),
                          Text(
                            'Book',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            height: 1.5,
                            width: 30,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.looks_two,
                            size: 16,
                            color: Colors.white,
                          ),
                          SizedBox(width: 3),
                          Text('Pay',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              )),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            height: 1.5,
                            width: 30,
                            color: Colors.white54,
                          ),
                          Icon(
                            Icons.looks_3,
                            size: 16,
                            color: Colors.white54,
                          ),
                          SizedBox(width: 3),
                          Text(
                            'E-Ticket',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white54,
                            ),
                          ),
                        ])
                  ],
                ),
              ],
            ),
            elevation: 0,
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
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[900],
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 3),
                            blurRadius: 3)
                      ]),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                          colors: [
                            Colors.pink[100],
                            Colors.cyan[100],
                            Colors.cyan[100]
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '${ticket.cityfrom1} → ${ticket.cityto1}',
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            ticket.getShortDate(),
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                color: Colors.white),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Complete your payment within 2h 5m',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.access_time,
                                      size: 16, color: Colors.black54)
                                ],
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
                Expanded(
                  child: ListView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      children: <Widget>[
                        Text(
                          'Payment Method',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                        SubtotalPrice()
                      ]),
                ),
              ],
            )));
  }
}
