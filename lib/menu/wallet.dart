import 'package:explora/menu/top_up.dart';
import 'package:explora/menu/widget_wallet.dart';
import 'package:flutter/material.dart';
import 'package:explora/classes/Balance.dart';
import 'package:explora/classes/ProfileClass.dart';
import 'package:explora/classes/Transaction.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
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
              'Wallet',
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
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                children: <Widget>[
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            gradient: LinearGradient(
                                colors: [Colors.cyan[200], Colors.cyan[300]],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black54,
                                  offset: Offset(0, 3),
                                  blurRadius: 3)
                            ]),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 40),
                            Text(
                              'Balance',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Rp ${balance.getBalance(personalData)}',
                              style: TextStyle(fontSize: 28),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 130),
                        height: 90,
                        width: 240,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.white,
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
                            Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TopUp()),
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  width: 100,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image(
                                            width: 40,
                                            image: AssetImage(
                                                'assets/images/top_up_balance.png')),
                                        Text('Top up',
                                            style: TextStyle(fontSize: 16))
                                      ]),
                                ),
                              ),
                            ),
                            Container(
                                color: Colors.black, height: 80, width: 2),
                            Container(
                              width: 100,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image(
                                        width: 46,
                                        image: AssetImage(
                                            'assets/images/pay.png')),
                                    Text('Pay', style: TextStyle(fontSize: 16))
                                  ]),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Transaction',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Container(
                      color: Colors.white60,
                      child: ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          itemCount: transaction.n,
                          itemBuilder: (BuildContext context, int index) {
                            return TransactionList(
                                img: transaction.history[index]['img'],
                                type: transaction.history[index]['type'],
                                idBook: transaction.history[index]['idBook'],
                                date: transaction.history[index]['date'],
                                value: transaction.history[index]['value']);
                          }))
                ])));
  }
}
