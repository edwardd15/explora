import 'package:flutter/material.dart';
import 'package:explora/classes/ProfileClass.dart';

class AddEmail extends StatefulWidget {
  @override
  _AddEmailState createState() => _AddEmailState();
}

class _AddEmailState extends State<AddEmail> {
  final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Colors.pink[100], Colors.purple[200], Colors.cyan[200]],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  bool subscription = false;

  TextEditingController addressController = TextEditingController();

  void saveData(){
    if (addressController.text.contains('@')){email.addAddress(addressController.text);}
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
              'Add Email',
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
                    fit: BoxFit.fitWidth),),
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle:
                        TextStyle(fontSize: 18, color: Colors.blue[700]),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan)),
                  ),
                ),
                SizedBox(height: 10),
                CheckboxListTile(
                    value: subscription,
                    onChanged: (bool newValue) {
                      setState(() {
                        subscription = !subscription;
                      });
                    },
                    checkColor: Colors.cyan[300],
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      'Send me infos about promotion and Explora\'s exclusive discount',
                    )),
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
