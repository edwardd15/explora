import 'dart:io';
import 'package:explora/classes/ProfileClass.dart';
import 'package:explora/classes/Balance.dart';
import 'package:explora/profile/history.dart';
import 'package:explora/profile/passport.dart';
import 'package:flutter/material.dart';
import 'package:explora/profile/my_account.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Colors.pink[100], Colors.purple[200], Colors.cyan[200]],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  File _image;
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
        personalData.profPic = image;
        print('Image Path $image');
      });
    }

    // Future getPhoto() async {
    //   var photo = await ImagePicker.pickImage(source: ImageSource.camera);
    //   setState(() {
    //     _image = photo;
    //     personalData.profPic = photo;
    //     print('Image Path $photo');
    //   });
    // }

    Future uploadPic(BuildContext context) async {
      String filName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(filName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        print("Profile Picture uploaded");
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Profile Picture Uploaded'),
        ));
      });
    }

    void _onButtonPressed() {
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                BottomSheetButton(
                  title: 'Upload from Camera',
                  buttonColor: Colors.blue[700],
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                    //getPhoto();
                    uploadPic(context);
                  },
                ),
                BottomSheetButton(
                  title: 'Upload from Gallery',
                  buttonColor: Colors.blue[700],
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                    getImage();
                    uploadPic(context);
                  },
                ),
                Divider(color: Colors.grey, thickness: 1),
                BottomSheetButton(
                  title: 'Cancel',
                  buttonColor: Colors.grey[350],
                  textColor: Colors.blue[700],
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]),
            );
          });
    }

    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              'Profile',
              style: TextStyle(
                  foreground: Paint()..shader = linearGradient,
                  fontSize: 40,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.w700),
            ),
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
            child: Stack(children: <Widget>[
              Container(
                height: 60,
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
              ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: <Widget>[
                    Builder(
                      builder: (context) => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.cyan[200],
                                  Colors.deepOrange[100]
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 3),
                                  blurRadius: 3)
                            ]),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              (personalData.loggedin
                                  ? Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          _onButtonPressed();
                                        },
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/edit.png'),
                                          width: 20,
                                        ),
                                      ))
                                  : Container()),
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: (personalData.profPic != null)
                                    ? FileImage(personalData.profPic)
                                    : AssetImage(
                                        'assets/images/default_profile.png'),
                                backgroundColor: Colors.transparent,
                              ),
                              Text(
                                personalData.getName(),
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'PlayfairDisplay'),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      Image(
                                        image: AssetImage(
                                            'assets/images/points.png'),
                                        width: 22,
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                          '${balance.getPoints(personalData)} points')
                                    ]),
                                    Container(
                                      color: Colors.black,
                                      width: 1,
                                      height: 40,
                                    ),
                                    Row(children: <Widget>[
                                      Image(
                                        image: AssetImage(
                                            'assets/images/balance.png'),
                                        width: 22,
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                          'Rp${balance.getBalance(personalData)}')
                                    ])
                                  ])
                            ]),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                        height: 400,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                          gradient: LinearGradient(
                              colors: [Colors.white70, Colors.white10],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                        child: (personalData.loggedin
                            ? LoginMenu()
                            : LoginButton()))
                  ])
            ])));
  }
}

class LoginMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ProfileList(
        imgName: 'my_account',
        title: 'My Account',
        goTo: MyAccount(),
      ),
      ProfileList(
        imgName: 'passport',
        title: 'Passport',
        goTo: Passport(),
      ),
      ProfileList(
        imgName: 'history1',
        title: 'History',
        goTo: History(),
      ),
      SizedBox(height: 30),
      GestureDetector(
        onTap: () {
          personalData.logout();
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                  colors: [Colors.deepOrange[100], Colors.purple[200]],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, offset: Offset(0, 3), blurRadius: 3)
              ]),
          child: Text(
            'Logout',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'PlayfairDisplay',
            ),
          ),
        ),
      )
    ]);
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          personalData.login();
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: "Welcome ${personalData.fullname}",
              textColor: Colors.white,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.black87,
              timeInSecForIosWeb: 1);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                  colors: [Colors.deepOrange[100], Colors.purple[200]],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, offset: Offset(0, 3), blurRadius: 3)
              ]),
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'PlayfairDisplay',
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileList extends StatelessWidget {
  ProfileList({this.imgName, this.title, this.goTo});
  final String imgName;
  final String title;
  final Widget goTo;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => goTo),
        );
      },
      child: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/$imgName.png'),
                    width: 42,
                  ),
                  SizedBox(width: 10),
                  Text(title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
                ]),
                Icon(Icons.chevron_right, size: 36)
              ]),
          Divider(thickness: 1, color: Colors.black)
        ],
      ),
    );
  }
}

class BottomSheetButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color buttonColor;
  final Color textColor;
  BottomSheetButton(
      {this.title, this.buttonColor, this.onPressed, this.textColor});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: FlatButton(
          child: new Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: textColor,
            ),
          ),
          color: buttonColor,
          onPressed: onPressed,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          )),
    );
  }
}
