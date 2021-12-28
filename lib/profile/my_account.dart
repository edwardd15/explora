import 'package:explora/profile/add_phone.dart';
import 'package:explora/profile/personal_data.dart';
import 'package:explora/classes/ProfileClass.dart';
import 'package:explora/profile/profile_widget.dart';
import 'package:explora/profile/add_email.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Colors.pink[100], Colors.purple[200], Colors.cyan[200]],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  refresh() {
    setState(() {});
  }

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
              'My Account',
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
                  fit: BoxFit.fitWidth),
            ),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              children: <Widget>[
                Container(
                  child: Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Private Information',
                          style: TextStyle(fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PersonalData()),
                            );
                          },
                          child: Text(
                            'UPDATE',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue[600],
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    PrivateInformation(
                        fullName: personalData.fullname,
                        gender: personalData.gender,
                        birthdate: personalData.birthdate,
                        city: personalData.city)
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    'Email',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: email.n,
                            itemBuilder: (BuildContext context, int index) {
                              return EmailList(
                                emailAddress: email.address[index],
                                notifyParent: refresh,
                              );
                            }),
                        SizedBox(
                          width: double.infinity,
                          child: FlatButton(
                              child: new Text(
                                "Add Email",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue[600],
                                ),
                              ),
                              color: Colors.grey[300],
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddEmail()),
                                );
                              },
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              )),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: phone.n,
                            itemBuilder: (BuildContext context, int index) {
                              return PhoneNumberList(
                                phoneNumber: phone.number[index],
                                notifyParent: refresh,
                              );
                            }),
                        SizedBox(
                          width: double.infinity,
                          child: FlatButton(
                              child: new Text(
                                "Add Phone Number",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue[600],
                                ),
                              ),
                              color: Colors.grey[300],
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddPhone()),
                                );
                              },
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              )),
                        ),
                      ]),
                )
              ],
            )));
  }
}
