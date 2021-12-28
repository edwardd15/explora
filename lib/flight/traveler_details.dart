import 'package:explora/classes/ProfileClass.dart';
import 'package:flutter/material.dart';

class TravelerDetails extends StatefulWidget {
  @override
  _TravelerDetailsState createState() => _TravelerDetailsState();
}

class _TravelerDetailsState extends State<TravelerDetails> {
  String _valTitle;
  List _listTitle = ['Mr.', 'Mrs.'];
  String _valNationality = passport.nationality;
  List _listNationality = ['Republic of South Korea', 'Indonesia', 'Singapore', 'Japan'];
  TextEditingController firstnameController =
      new TextEditingController(text: passport.firstname);
  TextEditingController lastnameController =
      new TextEditingController(text: passport.lastname);
      TextEditingController passportController =
      new TextEditingController(text: passport.number);
      TextEditingController authorityController =
      new TextEditingController(text: passport.nationality);

  @override
  void initState() {
    if (personalData.gender == 'Male') {
      _valTitle = 'Mr.';
    }
    else{
      _valTitle = 'Mrs.';
    }

    super.initState();
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
              'Traveler Details',
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
            child: ListView(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                children: <Widget>[
                  DropdownButtonFormField(
                    isDense: true,
                    value: _valTitle,
                    items: _listTitle.map((value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _valTitle = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle:
                          TextStyle(fontSize: 14, color: Colors.blue[700]),
                    ),
                  ),
                  TextField(
                    controller: firstnameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: 'First and Middle Name',
                      labelStyle:
                          TextStyle(fontSize: 18, color: Colors.blue[700]),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan)),
                    ),
                  ),
                  TextField(
                    controller: lastnameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: 'Family / Last Name',
                      labelStyle:
                          TextStyle(fontSize: 18, color: Colors.blue[700]),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan)),
                    ),
                  ),
                   DropdownButtonFormField(
                    isDense: true,
                    value: _valNationality,
                    items: _listNationality.map((value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _valNationality = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Nationality',
                      labelStyle:
                          TextStyle(fontSize: 14, color: Colors.blue[700]),
                    ),
                  ),
                  TextField(
                    controller: passportController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Passport Number',
                      labelStyle:
                          TextStyle(fontSize: 18, color: Colors.blue[700]),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan)),
                    ),
                  ),
                  TextField(
                    controller: authorityController,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      labelText: 'Authority Country',
                      labelStyle:
                          TextStyle(fontSize: 18, color: Colors.blue[700]),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan)),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Date of Expiration',
                      labelStyle:
                          TextStyle(fontSize: 18, color: Colors.blue[700]),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan)),
                    ),
                  ),
                  SizedBox(height:20),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: Colors.deepOrange,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ))
                  
                ])));
  }
}
