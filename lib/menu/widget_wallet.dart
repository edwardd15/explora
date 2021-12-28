import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final String img;
  final String type;
  final String idBook;
  final String date;
  final String value;

  TransactionList({this.img, this.type, this.idBook, this.date, this.value});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: Image(
              image: AssetImage('assets/images/$img.png'),
            ),
            title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        type,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(value,
                          style: TextStyle(
                              color: ((img == 'payment')
                                  ? Colors.red
                                  : Colors.green),
                              fontSize: 16))
                    ],
                  ),
                  (img != 'top_up')
                      ? Text(
                          'ID Book $idBook',
                          style: TextStyle(fontSize: 16),
                        )
                      : Container(),
                  Text(
                    date,
                    style: TextStyle(fontSize: 16),
                  )
                ]),
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.black38,
        )
      ],
    );
  }
}
