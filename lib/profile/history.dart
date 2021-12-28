import 'package:flutter/material.dart';

class History extends StatelessWidget {
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
              'History',
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
                    fit: BoxFit.fitWidth),),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              color: Colors.deepPurple[100],
                              border:
                                  Border.all(color: Colors.deepPurple[300])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.flight, size: 24),
                              SizedBox(width: 10),
                              Text(
                                'Dubai',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.arrow_forward, size: 24),
                              SizedBox(width: 10),
                              Text('Switzerland',
                                  style: TextStyle(fontSize: 18))
                            ],
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(10)),
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.deepPurple[300])),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text('Booking ID 374829487',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blue)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text('Sat, 2 May 2020',
                                    style: TextStyle(fontSize: 18)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                    'Dubai - Dubai International Airport',
                                    style: TextStyle(fontSize: 18)),
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Purchase Successful',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.greenAccent[400])),
                                    Icon(Icons.remove)
                                  ],
                                ),
                              )
                            ],
                          ))
                    ]),
              ],
            )));
  }
}
