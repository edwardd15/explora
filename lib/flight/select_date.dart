import 'package:flutter/material.dart';
import 'package:explora/flight/widget_flight.dart';
import 'package:explora/flight/one_way.dart';
import 'package:intl/intl.dart';
import 'package:explora/classes/Ticket.dart';

class SelectDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.lightBlue[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Select Date',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
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
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 36),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal:10,vertical:10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey[200]),
                  child: Column(
                    children: <Widget>[
                      HolidayDate(date:'1 June', holiday: 'Pancasila Day',),
                      HolidayDate(date:'31 July', holiday:'Eid al-Adha'),
                      HolidayDate(date:'17 August', holiday: 'Indonesian Independence',),
                      HolidayDate(date:'20 August', holiday: 'Muharram / Islamic New Year'),
                      HolidayDate(date:'21 August', holiday: 'Muharram / Islamic New Year'),
                    ],
                  ),
                ),
                BottomSheetButton(
                  title: 'Pick Date',
                  buttonColor: Colors.blue[700],
                  textColor: Colors.white,
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      initialDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    ).then((date){
                      departureDateController.text = DateFormat.yMMMMd('en_US').format(date).toString();
                      ticket.datefrom = date;
                    });
                  },
                ),
              ]),
        ));
  }
}

class HolidayDate extends StatelessWidget {
  final String date;
  final String holiday;
  HolidayDate({this.date, this.holiday});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            date,
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
          Text(
            holiday,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
