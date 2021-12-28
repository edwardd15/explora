import 'package:flutter/material.dart';
import 'package:explora/classes/Balance.dart';
import 'package:explora/classes/ProfileClass.dart';

class CurrentBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          gradient: LinearGradient(
              colors: [Colors.cyan[300], Colors.cyan[400]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          boxShadow: [
            BoxShadow(
                color: Colors.black54, offset: Offset(0, 3), blurRadius: 3)
          ]),
      child: Column(
        children: <Widget>[
          Text(
            'Current Balance',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            'Rp${balance.getBalance(personalData)}',
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}