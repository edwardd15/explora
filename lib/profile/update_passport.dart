import 'package:flutter/material.dart';
import 'package:explora/classes/ProfileClass.dart';
class UpdatePassport extends StatefulWidget {
  @override
  _UpdatePassportState createState() => _UpdatePassportState();
}

class _UpdatePassportState extends State<UpdatePassport> {
  final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Colors.pink[100], Colors.purple[200], Colors.cyan[200]],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  TextEditingController firstnameController = TextEditingController(text:passport.firstname);
  TextEditingController lastnameController = TextEditingController(text:passport.lastname);
  TextEditingController numberController = TextEditingController(text:passport.number);
  TextEditingController nationalityController = TextEditingController(text:passport.nationality);

  void saveData(){
    if (firstnameController != null){passport.firstname = firstnameController.text;}
    if (lastnameController != null){passport.lastname = lastnameController.text;}
    if (numberController != null){passport.number = numberController.text;}
    if (nationalityController != null){passport.nationality = nationalityController.text;}
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
              'Update Passport Data',
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
                  controller: firstnameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
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
                    labelText: 'Last Name',
                    labelStyle:
                        TextStyle(fontSize: 18, color: Colors.blue[700]),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan)),
                  ),
                ),
                TextField(
                  controller: numberController,
                  keyboardType: TextInputType.visiblePassword,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    labelText: 'Passport Number',
                    labelStyle:
                        TextStyle(fontSize: 18, color: Colors.blue[700]),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan)),
                  ),
                ),
                TextField(
                  controller: nationalityController,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    labelText: 'Nationality',
                    labelStyle:
                        TextStyle(fontSize: 18, color: Colors.blue[700]),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan)),
                  ),
                ),
                SizedBox(height: 250),
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
