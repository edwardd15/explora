import 'package:flutter/material.dart';
import 'package:explora/classes/ProfileClass.dart';

class AddPhone extends StatefulWidget {
  @override
  _AddPhoneState createState() => _AddPhoneState();
}

class _AddPhoneState extends State<AddPhone> {
  final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Colors.pink[100], Colors.purple[200], Colors.cyan[200]],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  String _valCountry;
  List _listCountry = ['62', '63', '64', '65'];
  TextEditingController numberController = TextEditingController();

  void saveData() {
    if (numberController.text != '' && _valCountry != null) {
      phone.addNumber(_valCountry + numberController.text);
    }
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
              'Add Phone',
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
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
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
            child: Column(
              children: <Widget>[
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
                          labelStyle:
                              TextStyle(fontSize: 14, color: Colors.blue[700]),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 180,
                      child: TextField(
                        controller: numberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Mobile Phone',
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.blue[700]),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
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
