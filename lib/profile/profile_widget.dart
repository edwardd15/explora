import 'package:flutter/material.dart';
import 'package:explora/classes/ProfileClass.dart';

class PrivateInformation extends StatelessWidget {
  PrivateInformation({this.fullName, this.gender, this.birthdate, this.city});
  final String fullName;
  final String gender;
  final String birthdate;
  final String city;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 160,
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.grey)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Full Name',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(
                  fullName,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  overflow: TextOverflow.fade,
                )
              ]),
          Divider(
            thickness: 1,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Gender',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(gender, style: TextStyle(fontSize: 16, color: Colors.grey))
              ]),
          Divider(
            thickness: 1,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Birthdate',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(birthdate,
                    style: TextStyle(fontSize: 16, color: Colors.grey))
              ]),
          Divider(
            thickness: 1,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'City of Residence',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(city, style: TextStyle(fontSize: 16, color: Colors.grey))
              ]),
        ],
      ),
    );
  }
}

class PhoneNumberList extends StatelessWidget {
  final String phoneNumber;
  final Function notifyParent;
  PhoneNumberList({this.phoneNumber, @required this.notifyParent});
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {
        phone.deleteNumber(phoneNumber);
        notifyParent();
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Phone Number"),
      content: Text("Are you sure want to delete this phone number?"),
      actions: [
        cancelButton,
        continueButton,
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    phoneNumber,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  Text('Verified',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    showAlertDialog(context);
                  },
                  child: Icon(Icons.close))
            ]),
        Divider(thickness: 1),
      ],
    );
  }
}

class PassportInformation extends StatelessWidget {
  PassportInformation(
      {this.firstName, this.lastName, this.passportNumber, this.nationality});
  final String firstName;
  final String lastName;
  final String passportNumber;
  final String nationality;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 160,
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.grey)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'First Name',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(firstName,
                    style: TextStyle(fontSize: 16, color: Colors.grey))
              ]),
          Divider(
            thickness: 1,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Last Name',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(lastName,
                    style: TextStyle(fontSize: 16, color: Colors.grey))
              ]),
          Divider(
            thickness: 1,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Passport Number',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(passportNumber,
                    style: TextStyle(fontSize: 16, color: Colors.grey))
              ]),
          Divider(
            thickness: 1,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Nationality',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(nationality,
                    style: TextStyle(fontSize: 16, color: Colors.grey))
              ]),
        ],
      ),
    );
  }
}

class EmailList extends StatelessWidget {
  final String emailAddress;
  final Function notifyParent;
  EmailList({this.emailAddress, @required this.notifyParent});
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {
        email.deleteAddress(emailAddress);
        notifyParent();
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Email Address"),
      content: Text("Are you sure want to delete this email address?"),
      actions: [
        cancelButton,
        continueButton,
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    emailAddress,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  Text('Verified',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    showAlertDialog(context);
                  },
                  child: Icon(Icons.close))
            ]),
        Divider(thickness: 1),
      ],
    );
  }
}
