import 'package:flutter/material.dart';

class TravelInsurance extends StatefulWidget {
  @override
  _TravelInsuranceState createState() => _TravelInsuranceState();
}

class _TravelInsuranceState extends State<TravelInsurance> {
  bool singletriptap = true;
  bool annualtriptap = false;
  bool internationaltap = true;
  bool domestictap = false;
  switcharea() {
    internationaltap = !internationaltap;
    domestictap = !domestictap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.lightBlue[900],
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Text(
              'Travel Insurance',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
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
            child: ListView(children: <Widget>[
              Stack(
                children: <Widget>[
                  Image(image: AssetImage('assets/images/banner_travel.jpg')),
                  Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.white38,
                            Colors.white24,
                            Colors.transparent
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter))),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Travel Insurance',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          Text('Relieve your travel incovenience'),
                          Text('by a proper compensation'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Select Coverage Type',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              singletriptap = !singletriptap;
                              annualtriptap = !annualtriptap;
                            });
                          },
                          child: Container(
                              width: 160,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 14),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  color: singletriptap
                                      ? Colors.blue
                                      : Colors.white),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage(
                                          'assets/images/start_date.png'),
                                      height: 36,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Single Trip',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ])),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              annualtriptap = !annualtriptap;
                              singletriptap = !singletriptap;
                            });
                          },
                          child: Container(
                              width: 160,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 14),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  color: annualtriptap
                                      ? Colors.blue
                                      : Colors.white),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage(
                                          'assets/images/annual_trip.png'),
                                      height: 36,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Annual Trip',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ])),
                        ),
                      ],
                    ),
                    singletriptap
                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Select Coverage Area',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        switcharea();
                                      });
                                    },
                                    child: Container(
                                        width: 150,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 14),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16)),
                                            border: Border.all(
                                                color: internationaltap
                                                    ? Colors.blue
                                                    : Colors.white,
                                                width: 2),
                                            color: Colors.white),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Image(
                                                image: AssetImage(
                                                    'assets/images/international.png'),
                                                height: 36,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                'International',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ])),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        switcharea();
                                      });
                                    },
                                    child: Container(
                                        width: 150,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 14),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16)),
                                            border: Border.all(
                                                color: domestictap
                                                    ? Colors.blue
                                                    : Colors.white,
                                                width: 2),
                                            color: Colors.white),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Image(
                                                image: AssetImage(
                                                    'assets/images/indonesia.png'),
                                                height: 36,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                'Domestic',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ])),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Worldwide(),
                    singletriptap
                        ? (internationaltap
                            ? OriginDestination()
                            : IndonesiaArea())
                        : Container(),
                    SizedBox(height: 10),
                    TextFieldInsurance(),
                    SizedBox(height: 15),
                    Center(
                      child: FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          color: Colors.deepOrange,
                          onPressed: () {},
                          child: Text(
                            'Search Plan',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ])));
  }
}

class IndonesiaArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.fromLTRB(18, 14, 18, 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image(image: AssetImage('assets/images/map.png'), height: 36),
              SizedBox(width: 10),
              Text(
                'Indonesia Area Only',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(height: 5),
          Text(
              'This travel insurance is only valid for domestic within Indonesia')
        ],
      ),
    );
  }
}

class Worldwide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.fromLTRB(18, 14, 18, 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image(image: AssetImage('assets/images/map.png'), height: 36),
              SizedBox(width: 10),
              Text(
                'Worldwide (Including Indonesia)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(height: 5),
          Text(
              'Max. 30 days/trip for unlimited number of trips within policy year.')
        ],
      ),
    );
  }
}

class OriginDestination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              'Origin Country',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 5),
            DropDownOrigin(),
            SizedBox(height: 10),
            Text(
              'Destination Country',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 5),
            DropDownDestination(),
          ]),
    );
  }
}

class DropDownOrigin extends StatefulWidget {
  DropDownOrigin({Key key}) : super(key: key);

  @override
  _DropDownOriginState createState() => _DropDownOriginState();
}

class _DropDownOriginState extends State<DropDownOrigin> {
  String dropdownValue = 'Indonesia';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: DropdownButton<String>(
        isDense: true,
        value: dropdownValue,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.grey,
        ),
        iconSize: 24,
        elevation: 16,
        focusColor: Colors.white,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>[
          'Indonesia',
          'South Korean',
          'Singapore',
          'Malaysia',
          'Japan'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class DropDownDestination extends StatefulWidget {
  DropDownDestination({Key key}) : super(key: key);

  @override
  _DropDownDestinationState createState() => _DropDownDestinationState();
}

class _DropDownDestinationState extends State<DropDownDestination> {
  String dropdownValue = 'Indonesia';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: DropdownButton<String>(
        isDense: true,
        value: dropdownValue,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.grey,
        ),
        iconSize: 24,
        elevation: 16,
        focusColor: Colors.white,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>[
          'Indonesia',
          'South Korean',
          'Singapore',
          'Malaysia',
          'Japan'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class TextFieldInsurance extends StatefulWidget {
  @override
  _TextFieldInsuranceState createState() => _TextFieldInsuranceState();
}

class _TextFieldInsuranceState extends State<TextFieldInsurance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(18, 8, 18, 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white),
      child: Column(children: <Widget>[
        TextField(
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            icon: Image(
              image: AssetImage('assets/images/start_date.png'),
              width: 28,
            ),
            hintText: 'Coverage Start Date',
          ),
        ),
        TextField(
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            icon: Image(
              image: AssetImage('assets/images/end_date.png'),
              width: 28,
            ),
            hintText: 'Coverage End Date',
          ),
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: Image(
              image: AssetImage('assets/images/traveler.png'),
              width: 28,
            ),
            hintText: 'Travelers',
          ),
        ),
      ]),
    );
  }
}
