import 'package:flutter/material.dart';

class OnDealsRow extends StatelessWidget {
  OnDealsRow({this.imgUrl1, this.imgUrl2});
  final String imgUrl1;
  final String imgUrl2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 170,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(
                          imgUrl1),
                      fit: BoxFit.fill),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(2, 2),
                        blurRadius: 3)
                  ]),
            ),
            Container(
              width: 170,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(
                          imgUrl2),
                      fit: BoxFit.fill),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(2, 2),
                        blurRadius: 3)
                  ]),
            )
          ]),
    );
  }
}

class BottomSheetButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color buttonColor;
  final Color textColor;
  BottomSheetButton(
      {this.title, this.buttonColor, this.onPressed, this.textColor});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: FlatButton(
          child: new Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: textColor,
            ),
          ),
          color: buttonColor,
          onPressed: onPressed,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          )),
    );
  }
}