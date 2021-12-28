import 'package:flutter/material.dart';

class TermOfUse extends StatelessWidget {
  final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Colors.pink[100], Colors.purple[200], Colors.cyan[200]],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Text(
              'Term of Use',
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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(children: <Widget>[
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(children: <Widget>[
                          Image(
                            image: AssetImage(
                                'assets/images/explora_icon_64px.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Explora',
                            style: TextStyle(
                                foreground: Paint()..shader = linearGradient,
                                fontSize: 32,
                                fontFamily: 'PlayfairDisplay',
                                fontWeight: FontWeight.w700),
                          ),
                        ])),
                    TermText(
                        'THESE TERMS OF USE MUST BE READ BEFORE USING THE SITE. THE USAGE OF ANY PART OF THE SITE INDICATES ACCEPTANCE OF THESE TERMS OF USE.'),
                    Divider(color: Colors.black54, thickness: 1),
                    TermText(
                        'The www.explora.com site and the app ("Site") is managed by explora Group of Companies including its subsidiaries and affiliated companies ("we", "us", "our" or “explora”). By accessing and/or using any part of the Site, you acknowledge that you have read and understood, and agree to the Terms of Use (“Terms”) and other terms and conditions in relation to the Site as referred to in these Terms. If you do not agree to be bound by these Terms, you may not access or use any part of the Site. These Terms constitute a binding legal agreement between you as an individual user (“you” or “your”) and explora. You must be at least eighteen (18) years old to use the Site.'),
                    TermText(
                        'Please note that we may change, modify, add and delete these Terms at any time where this is necessary to comply with any law or regulation binding on us or to reflect a change to our operational practices, provided that we will use reasonable endeavours to provide notice of material changes on the Site. Every time you use the Site, please check these Terms to ensure that you have reviewed the current version. By continuing to use any part of the Site after such changes to these Terms, you agree and consent to the changes.'),
                    TermText(
                        'If you use any of our other services, then your usage is based on the submission to and acceptance of the terms and conditions applicable to such services, which will be made available to you when you use those other services. SCOPE OF OUR SERVICES Through the Site, explora provides an online platform where you can browse different types of airlines, train and other transportation services, temporary accommodation and lodging.'),
                  ]),
                )
              ]),
        ));
  }
}

class TermText extends StatelessWidget {
  final String text;
  TermText(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
        maxLines: 10,
      ),
    );
  }
}
