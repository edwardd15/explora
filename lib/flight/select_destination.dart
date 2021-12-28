import 'package:explora/classes/Ticket.dart';
import 'package:flutter/material.dart';
import 'package:explora/flight/one_way.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SelectDestination extends StatefulWidget {
  @override
  _SelectDestinationState createState() => _SelectDestinationState();
}

class _SelectDestinationState extends State<SelectDestination> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.lightBlue[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 30,
                    width: MediaQuery.of(context).size.width - 90,
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
                        Icon(Icons.search, size: 18, color: Colors.black,),
                        SizedBox(width: 5),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 130,
                          child: TextField(
                            controller: searchController,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
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
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 36),
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 3, 0, 3),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10)),
                          color: Colors.grey[300]),
                      child: Text('Your Frequent Search',
                          style: TextStyle(fontSize: 20)),
                    ),
                    StreamBuilder(
                        stream: Firestore.instance
                            .collection('freqsearches')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot mypost =
                                      snapshot.data.documents[index];
                                  if (mypost['city'].toLowerCase().contains(
                                          searchController.text
                                              .toLowerCase()) ||
                                      mypost['airport'].toLowerCase().contains(
                                          searchController.text
                                              .toLowerCase())) {
                                    return City(
                                        city: '${mypost['city']}',
                                        airport: '${mypost['airport']}',
                                        ct: '${mypost['ct']}');
                                  } else {
                                    return null;
                                  }
                                });
                          }
                        }),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 3, 0, 3),
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: Text('Popular Cities or Airports',
                          style: TextStyle(fontSize: 20)),
                    ),
                    StreamBuilder(
                        stream: Firestore.instance
                            .collection('popularcities')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot mypost =
                                      snapshot.data.documents[index];
                                  if (mypost['city'].toLowerCase().contains(
                                          searchController.text
                                              .toLowerCase()) ||
                                      mypost['airport'].toLowerCase().contains(
                                          searchController.text
                                              .toLowerCase())) {
                                    return City(
                                        city: '${mypost['city']}',
                                        airport: '${mypost['airport']}',
                                        ct: '${mypost['ct']}');
                                  } else {
                                    return null;
                                  }
                                });
                          }
                        })
                  ]),
                )
              ]),
        ));
  }
}

class City extends StatelessWidget {
  final String city;
  final String airport;
  final String ct;
  City({this.city, this.airport, this.ct});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          destinationController.text = city;
          ticket.airportto = airport;
          ticket.cityto = ct;
          Navigator.pop(context);
        },
        child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Text(city, style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, bottom: 5),
                  child: Text(airport, style: TextStyle(fontSize: 18)),
                ),
                Container(
                    width: double.infinity, color: Colors.black38, height: 1)
              ]),
        ),
      ),
    );
  }
}
