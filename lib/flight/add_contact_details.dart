import 'package:explora/classes/ProfileClass.dart';
import 'package:flutter/material.dart';

class AddContactDetails extends StatefulWidget {
  @override
  _AddContactDetailsState createState() => _AddContactDetailsState();
}

class _AddContactDetailsState extends State<AddContactDetails> {
  String _valCountry;
  List _listCountry = ['62', '63', '64', '65'];
  TextEditingController nameController =
      new TextEditingController(text: personalData.fullname);
  TextEditingController numberController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  @override
  void initState() {
    if (phone.number[0] != null) {
      _valCountry = phone.number[0].substring(0, 2);
      numberController.text = phone.number[0].substring(2);
    }
    if (email.address[0] != null) {
      emailController.text = email.address[0];
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
              'Contact Details',
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
                  TextField(
                    controller: nameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle:
                          TextStyle(fontSize: 18, color: Colors.blue[700]),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 100,
                        child: DropdownButtonFormField(
                          isDense: true,
                          value: _valCountry,
                          items: _listCountry.map((value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _valCountry = value;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Country Code',
                            labelStyle: TextStyle(
                                fontSize: 14, color: Colors.blue[700]),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 180,
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: numberController,
                          decoration: InputDecoration(
                            labelText: 'Mobile Phone',
                            labelStyle: TextStyle(
                                fontSize: 18, color: Colors.blue[700]),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(fontSize: 18, color: Colors.blue[700]),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan)),
                    ),
                  ),
                  SizedBox(height: 20),
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
