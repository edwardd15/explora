import 'package:explora/flight/select_flight.dart';
import 'package:flutter/material.dart';
import 'package:explora/flight/widget_flight.dart';
import 'package:explora/flight/select_return_date.dart';
import 'package:explora/flight/select_date.dart';
import 'package:explora/flight/select_origin.dart';
import 'package:explora/flight/select_destination.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:explora/classes/Ticket.dart';

TextEditingController departureDateController = new TextEditingController();
TextEditingController returnDateController = new TextEditingController();
TextEditingController originController = new TextEditingController();
TextEditingController destinationController = new TextEditingController();
TextEditingController seatClassController = new TextEditingController();
TextEditingController passengersController = new TextEditingController();

class OneWay extends StatefulWidget {
  @override
  _OneWayState createState() => _OneWayState();
}

class _OneWayState extends State<OneWay> {
  final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Colors.pink[100], Colors.purple[200], Colors.cyan[200]],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  bool isSwitched = false;
  bool flexTix = false;

  void swapText() {
    var temp = originController.text;
    setState(() {
      originController.text = destinationController.text;
      destinationController.text = temp;
    });
  }

  String selectedClass = 'x';
  changeSelected(val) {
    setState(() {
      selectedClass = val;
      seatClassController.text = val;
      ticket.seatclass = val;
    });
  }

  void _chooseSeatClass() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: ((BuildContext context,
              StateSetter setModalState /*You can rename this!*/) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.pink[100],
                    Colors.purple[100],
                    Colors.cyan[100]
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Choose Your Seat Class',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                    Divider(thickness: 1, color: Colors.black54),
                    RadioListTile(
                      value: 'Economy',
                      groupValue: selectedClass,
                      onChanged: (val) {
                        setModalState(() => changeSelected(val));
                      },
                      title: Text('Economy'),
                      activeColor: Colors.blue,
                    ),
                    RadioListTile(
                      value: 'Business',
                      groupValue: selectedClass,
                      onChanged: (val) {
                        setModalState(() => changeSelected(val));
                      },
                      title: Text('Business'),
                      activeColor: Colors.blue,
                    ),
                    RadioListTile(
                      value: 'First Class',
                      groupValue: selectedClass,
                      onChanged: (val) {
                        setModalState(() => changeSelected(val));
                      },
                      title: Text('First Class'),
                      activeColor: Colors.blue,
                    ),
                    RadioListTile(
                      value: 'Premion Economy',
                      groupValue: selectedClass,
                      onChanged: (val) {
                        setModalState(() => changeSelected(val));
                      },
                      title: Text('Premion Economy'),
                      activeColor: Colors.blue,
                    ),
                    BottomSheetButton(
                      title: 'Done',
                      buttonColor: Colors.blue[700],
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ]),
            );
          }));
        });
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Missing some fields"),
      content: Text("Please fill all fields"),
      actions: [
        okButton,
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

  showPickerNumber(BuildContext context) {
    Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(
            begin: 0,
            end: 10,
          ),
          NumberPickerColumn(
            begin: 0,
            end: 10,
          ),
          NumberPickerColumn(
            begin: 0,
            end: 10,
          ),
        ]),
        // delimiter: [
        //   PickerDelimiter(child: Container(
        //     width: 30.0,
        //     alignment: Alignment.center,
        //     child: Icon(Icons.more_vert),
        //   ))
        // ],
        hideHeader: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: Column(
            children: <Widget>[
              Text("Number of Passengers"),
              Divider(
                color: Colors.black54,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Adult',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text('Age 12+', style: TextStyle(fontSize: 12))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Child',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text('Age 2-11', style: TextStyle(fontSize: 12))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Infant',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text('Below age 2', style: TextStyle(fontSize: 12))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        cancelTextStyle: TextStyle(color: Colors.blue),
        confirmTextStyle: TextStyle(color: Colors.blue),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
          ticket.adult = value[0];
          passengersController.text = value[0].toString() +
              ' Adult, ' +
              value[1].toString() +
              ' Child, ' +
              value[2].toString() +
              ' Infant';
        }).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.pink[100], Colors.purple[200], Colors.cyan[200]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              repeat: ImageRepeat.repeatY,
              fit: BoxFit.fitWidth),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 3),
                        blurRadius: 5)
                  ]),
            ),
            ListView(children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                    border: Border.all(color: Colors.cyan[300], width: 2),
                    boxShadow: [
                      BoxShadow(color: Colors.blueGrey, offset: Offset(10, 10))
                    ]),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                TextField(
                                  textCapitalization: TextCapitalization.words,
                                  controller: originController,
                                  decoration: InputDecoration(
                                    icon: Image(
                                      image: AssetImage(
                                          'assets/images/origin.png'),
                                      width: 42,
                                    ),
                                    labelText: 'Origin',
                                    labelStyle: TextStyle(fontSize: 18),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.cyan)),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SelectOrigin()));
                                    },
                                    child: Container(
                                        color: Colors.transparent, height: 60)),
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                TextField(
                                  textCapitalization: TextCapitalization.words,
                                  controller: destinationController,
                                  decoration: InputDecoration(
                                    icon: Image(
                                      image: AssetImage(
                                          'assets/images/destination.png'),
                                      width: 42,
                                    ),
                                    labelText: 'Destination',
                                    labelStyle: TextStyle(fontSize: 18),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.cyan)),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SelectDestination()));
                                    },
                                    child: Container(
                                        color: Colors.transparent, height: 60)),
                              ],
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              swapText();
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.cyan[200],
                                    Colors.purple[200],
                                    Colors.pink[100],
                                  ],
                                ),
                              ),
                              child: Icon(Icons.swap_vert, size: 30),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Stack(
                      children: <Widget>[
                        TextField(
                          controller: departureDateController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            icon: Image(
                              image: AssetImage(
                                  'assets/images/departure_date.png'),
                              width: 42,
                            ),
                            labelText: 'Departure Date',
                            labelStyle: TextStyle(fontSize: 18),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan)),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SelectDate()));
                            },
                            child: Container(
                                color: Colors.transparent, height: 60)),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);
                              });
                            },
                            activeTrackColor: Colors.purple[200],
                            activeColor: Colors.cyan[200],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    (isSwitched
                        ? Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Stack(
                              children: <Widget>[
                                TextField(
                                  controller: returnDateController,
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    icon: Image(
                                      image: AssetImage(
                                          'assets/images/departure_date.png'),
                                      width: 42,
                                    ),
                                    labelText: 'Return Date',
                                    labelStyle: TextStyle(fontSize: 18),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.cyan)),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SelectReturnDate()));
                                    },
                                    child: Container(
                                        color: Colors.transparent, height: 60))
                              ],
                            ),
                          )
                        : Container()),
                    Stack(
                      children: <Widget>[
                        TextField(
                          controller: passengersController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Image(
                              image: AssetImage('assets/images/passengers.png'),
                              width: 42,
                            ),
                            labelText: 'Passengers',
                            labelStyle: TextStyle(fontSize: 18),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan)),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              showPickerNumber(context);
                            },
                            child: Container(
                                color: Colors.transparent, height: 60))
                      ],
                    ),
                    SizedBox(height: 10),
                    Stack(
                      children: <Widget>[
                        TextField(
                          controller: seatClassController,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            icon: Image(
                              image: AssetImage('assets/images/seat_class.png'),
                              width: 42,
                            ),
                            labelText: 'Seat Class',
                            labelStyle: TextStyle(fontSize: 18),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan)),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              _chooseSeatClass();
                            },
                            child: Container(
                                color: Colors.transparent, height: 60))
                      ],
                    ),
                    CheckboxListTile(
                        value: flexTix,
                        onChanged: (bool newValue) {
                          setState(() {
                            flexTix = !flexTix;
                          });
                        },
                        checkColor: Colors.cyan[300],
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          'Include Flexible Ticket',
                        )),
                    SizedBox(
                      width: 300,
                      child: RaisedButton(
                        onPressed: () {
                          if (originController.text == '' ||
                              destinationController.text == '' ||
                              departureDateController.text == '' ||
                              passengersController.text == '' ||
                              seatClassController.text == '') {
                            showAlertDialog(context);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectFlight()));
                          }
                        },
                        color: Colors.pink[50],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          'Search',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'PlayfairDisplay'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(children: <Widget>[
                  Text(
                    'On Deals',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'PlayfairDisplay',
                        decoration: TextDecoration.underline,
                        decorationThickness: 3),
                  ),
                  OnDealsRow(
                    imgUrl1:
                        'https://www.static-src.com/siva/asset//02_2020/1200x460_Microsite_Desktop_Flight-Maret.jpg',
                    imgUrl2:
                        'https://travelspromo.com/wp-content/uploads/2018/03/Promo-Tiket-Pesawat.jpg',
                  ),
                  OnDealsRow(
                    imgUrl1:
                        'https://www.pegipegi.com/flight/src/landing_area/img/ogp/JT.jpg',
                    imgUrl2:
                        'https://www.airasia.com/cdn/aa-images/id-ID/promotion-banner/kursi-gratis-akhir-tahun-nov-2018.png?sfvrsn=0',
                  )
                ]),
              )
            ]),
          ],
        ));
  }
}
