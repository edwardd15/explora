import 'package:flutter/material.dart';
import 'package:explora/classes/ProfileClass.dart';

class PersonalData extends StatefulWidget {
  @override
  _PersonalDataState createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Colors.pink[100], Colors.purple[200], Colors.cyan[200]],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  String _valGender = personalData.gender;

  List _listGender = ["Male", "Female"];

  TextEditingController fullnameController = new TextEditingController(text: personalData.fullname);
  TextEditingController birthdateController = new TextEditingController(text: personalData.birthdate);
  TextEditingController cityController = new TextEditingController(text: personalData.city);


  void saveData(){
    if (fullnameController.text != null) {personalData.fullname = fullnameController.text;}
    if (_valGender != null) {personalData.gender = _valGender;}
    if (birthdateController.text != null) {personalData.birthdate = birthdateController.text;}
    if (cityController.text != null) {personalData.city = cityController.text;}
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
              'Update Personal Data',
              style: TextStyle(
                  foreground: Paint()..shader = linearGradient,
                  fontSize: 24,
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
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
              children: <Widget>[
                TextField(
                  controller: fullnameController,
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
                        value: _valGender,
                        items: _listGender.map((value) {
                          return DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _valGender = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Gender',
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.blue[700]),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 200,
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        textCapitalization: TextCapitalization.words,
                        controller: birthdateController,
                        decoration: InputDecoration(
                          labelText: 'Birthdate',
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.blue[700]),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan)),
                        ),
                      ),
                    ),
                  ],
                ),
                TextField(
                  textCapitalization: TextCapitalization.words,
                  controller: cityController,
                  decoration: InputDecoration(
                    labelText: 'City of Residence',
                    labelStyle:
                        TextStyle(fontSize: 18, color: Colors.blue[700]),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan)),
                  ),
                ),
                SizedBox(height: 300),
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                      child: new Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.blue[600],
                      onPressed: () {
                        saveData();
                        Navigator.of(context).pop();
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      )),
                ),
              ],
            )));
  }
}
