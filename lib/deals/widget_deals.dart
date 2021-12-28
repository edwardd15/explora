import 'package:flutter/material.dart';

class DealsCard extends StatelessWidget {
  DealsCard({this.imageUrl, this.title, this.offers, this.validityDays, this.price});
  final String imageUrl;
  final String title;
  final String offers;
  final String validityDays;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 15),
        height: 290,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: Colors.white),
        child: Column(
          children: <Widget>[
            Container(
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(
                        imageUrl),
                    fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 3),
                    blurRadius: 3,
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            color: Colors.white54),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '$offers Offers',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'Validity $validityDays Days',
                      style: TextStyle(fontSize: 18, color: Colors.black45),
                    )
                  ]),
              Text(
                'IDR $price',
                style: TextStyle(fontSize: 24),
              )
            ]),
      ),
    ]);
  }
}
