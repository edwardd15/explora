import 'package:explora/classes/Balance.dart';
import 'package:explora/classes/CheckedIn.dart';
import 'package:explora/classes/ProfileClass.dart';
import 'package:explora/classes/Ticket.dart';
import 'package:explora/flight/payment/e-ticket.dart';
import 'package:explora/menu/top_up.dart';
import 'package:flutter/material.dart';

class CreditDebitImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Image(
        image: AssetImage('assets/images/bank/visa.png'),
        height: 14,
      ),
      SizedBox(width: 8),
      Image(
        image: AssetImage('assets/images/bank/mastercard.png'),
        height: 24,
      ),
      SizedBox(width: 8),
      Image(
        image: AssetImage('assets/images/bank/american_express.png'),
        height: 30,
      )
    ]);
  }
}

class BCAimg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Image(
        image: AssetImage('assets/images/bank/bca.png'),
        height: 30,
      ),
      SizedBox(width: 8),
      Text('BCA Transfer',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
    ]);
  }
}

class UOBimg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Image(
        image: AssetImage('assets/images/bank/uob.png'),
        height: 30,
      ),
      SizedBox(width: 8),
      Text('UOB Transfer',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
    ]);
  }
}

class KDBimg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Image(
        image: AssetImage('assets/images/bank/kdb.png'),
        height: 30,
      ),
      SizedBox(width: 35),
      Text('KDB Transfer',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
    ]);
  }
}

class BCAKlikPayimg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Image(
        image: AssetImage('assets/images/bank/bca_klik_pay.png'),
        height: 18,
      ),
      SizedBox(width: 14),
      Text('BCA Klikpay',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
    ]);
  }
}

class ATMimg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Image(
        image: AssetImage('assets/images/bank/atm_bersama.jpg'),
        height: 24,
      ),
      SizedBox(width: 8),
      Image(
        image: AssetImage('assets/images/bank/prima.png'),
        height: 24,
      ),
      SizedBox(width: 8),
      Image(
        image: AssetImage('assets/images/bank/alto.png'),
        height: 30,
      )
    ]);
  }
}

class Balanceimg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(children: <Widget>[
          Image(
            image: AssetImage('assets/images/balance.png'),
            height: 24,
          ),
          SizedBox(width: 8),
          Text('Wallet',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        ]),
        Text('Rp${balance.getBalance(personalData)}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
      ],
    );
  }
}

class SubtotalPrice extends StatefulWidget {
  @override
  _SubtotalPriceState createState() => _SubtotalPriceState();
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

class _SubtotalPriceState extends State<SubtotalPrice> {
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
                'Rp${ticket.getTotal()}',
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
                      '${ticket.airline} (Adult) x${ticket.adult.toString()}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Rp${ticket.getMoney(ticket.totalticketprice)}',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Baggage Charge',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Rp${ticket.getMoney(ticket.baggageprice)}',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Travel Insurance',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Rp${ticket.getMoney(ticket.insuranceprice)}',
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
                if (balance.isSuciffient(ticket.totalprice)) {
                  balance.deductBalance(ticket.totalprice);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ETicket()));
                  balance.addPoints(ticket.totalpoints);
                } else {
                  showAlertDialog(context);
                }
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ETicket()));
                balance.addPoints(ticket.totalpoints);
                checkedIn.addTicket(ticket);
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

class CreditDebitInstruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      child: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Card Number',
              labelStyle: TextStyle(fontSize: 16, color: Colors.blue),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 150,
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Valid Until (MM/YY)',
                    labelStyle: TextStyle(fontSize: 16, color: Colors.blue),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan)),
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'CVV',
                    labelStyle: TextStyle(fontSize: 16, color: Colors.blue),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan)),
                  ),
                ),
              ),
            ],
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Name On Card',
              labelStyle: TextStyle(fontSize: 16, color: Colors.blue),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan)),
            ),
          ),
        ],
      ),
    );
  }
}

class ATMInstruction extends StatelessWidget {
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
              InstructionList('Insert your ATM card and PIN'),
              InstructionList('Select menu Other Transaction'),
              InstructionList('Select menu Transfer'),
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

class BCAKlikPayInstruction extends StatelessWidget {
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
              InstructionList(
                  'Untuk otorisasi pembayaran dengan BCA KlikPay,\n tekan tombol kirim OTP,'),
              InstructionList(
                  'Anda akan menerima kode OTP (One Time Password)\n yang dikirim melalui SMS ke handphone Anda.'),
              InstructionList(
                  'Masukkan kode OTP tersebut \npada kolom yang tersedia.'),
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

