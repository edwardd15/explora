import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LoungeCard extends StatelessWidget {
  LoungeCard({this.imageUrl, this.lounge, this.airlines, this.rating});
  final String imageUrl;
  final String lounge;
  final String airlines;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: <Widget>[
          Container(
            height: 270,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover)),
          ),
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 227,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            lounge,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Text(airlines, style: TextStyle(fontSize: 18))
                        ]),
                  ),
                  Container(
                    width: 100,
                    child: RatingBar(
                      allowHalfRating: true,
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                      initialRating: rating,
                      itemSize: 20,
                      ignoreGestures: true,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                ]),
          ),
          SizedBox(
            width: double.infinity,
            child: FlatButton(
                child: new Text(
                  "Reserve",
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.cyan[300],
                onPressed: () {},
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.cyan),
                )),
          ),
        ],
      ),
    );
  }
}
