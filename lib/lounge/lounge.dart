import 'package:flutter/material.dart';
import 'package:explora/lounge/widget_lounge.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Lounge extends StatefulWidget {
  @override
  _LoungeState createState() => _LoungeState();
}

class _LoungeState extends State<Lounge> {
  final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Colors.pink[100], Colors.purple[200], Colors.cyan[200]],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  TextEditingController searchController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(125),
          child: Column(
            children: <Widget>[
              AppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                title: Text(
                  'Lounge',
                  style: TextStyle(
                      foreground: Paint()..shader = linearGradient,
                      fontSize: 36,
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.w700),
                ),
                elevation: 0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0, 3),
                          blurRadius: 3)
                    ]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width - 90,
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.grey[200],
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 2),
                                    blurRadius: 3)
                              ]),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.search, size: 30),
                              SizedBox(width: 5),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 160,
                                child: TextField(
                                  controller: searchController,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                            ],
                          )),
                      Icon(
                        Icons.sort,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
            ],
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
            child: StreamBuilder(
                stream: Firestore.instance.collection('lounges').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot mypost =
                              snapshot.data.documents[index];
                          if (mypost['name'].toLowerCase().contains(
                                  searchController.text.toLowerCase()) ||
                              mypost['airline'].toLowerCase().contains(
                                  searchController.text.toLowerCase())) {
                            return LoungeCard(
                              imageUrl: '${mypost['image']}',
                              lounge: '${mypost['name']}',
                              airlines: '${mypost['airline']}',
                              rating: mypost['rating'].toDouble(),
                            );
                          } else {
                            return null;
                          }
                        });
                  }
                })));
  }
}

// LoungeCard(
//                   imageUrl:
//                       'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20001666-fd4dd39f2a2a9bf2663e19d508dc6a43.png?tr=q-40,c-at_max,w-740,h-500&_src=imagekit',
//                   lounge: 'Changi Lounge - SIN',
//                   airlines: 'All Airlines',
//                   rating: 4,
//                 ),
//                 LoungeCard(
//                   imageUrl:
//                       'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTAQdTdk0bzAoFbRa94cqg4WeYzvSnRZc3WgJjkbcozmW8BgqmT&usqp=CAU',
//                   lounge: 'Garuda Indonesia Lounge - CGK',
//                   airlines: 'Garuda Indonesia',
//                   rating: 4.5,
//                 ),
