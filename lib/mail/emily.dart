import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Emily extends StatefulWidget {
  @override
  _EmilyState createState() => _EmilyState();
}

class _EmilyState extends State<Emily> {
  TextEditingController chatController = new TextEditingController();
  createData(){
    DocumentReference ds = Firestore.instance.collection('emily').document(Timestamp.now().seconds.toString());
    Map<String,dynamic> msg = {
      "message":chatController.text,
      "me":true,
      "time": Timestamp.now()
    };
    ds.setData(msg).whenComplete((){
      print("Task created");
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      //padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 2),
                    blurRadius: 5,
                  )
                ],
                color: Colors.deepPurple[50]),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/emily.jpg'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Emily Xanders', style: TextStyle(fontSize: 20))
              ]),
            )),
        Expanded(
            child: StreamBuilder(
                stream: Firestore.instance.collection('emily').snapshots(),
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
                          if (mypost['me']) {
                            return MyChat(message: '${mypost['message']}',time:mypost['time']);
                          } else {
                            return TheirChat(message: '${mypost['message']}',time:mypost['time']);
                          }
                        });
                  }
                })),
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 36,
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 4),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    controller: chatController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  )),
              GestureDetector(
                onTap: () {
                  setState(() {
                    createData();
                    chatController.text = '';
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
                child: Container(
                    child: Icon(
                  Icons.send,
                  color: Colors.blue,
                )),
              )
            ],
          ),
        )
      ],
    );
  }
}

class MyChat extends StatelessWidget {
  final Timestamp time;
  final String message;
  MyChat({this.message, this.time});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                color: Colors.deepPurple[200]),
            child: Text(
              message,
              style: TextStyle(fontSize: 16),
              maxLines: 5,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.end,
            ),
          ),
          Text(DateFormat.jm('en_US').format(time.toDate()).toString(), style:TextStyle(color:Colors.black38))
        ],
      ),
    );
  }
}

class TheirChat extends StatelessWidget {
  final String message;
  final Timestamp time;
  TheirChat({this.message, this.time});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Colors.deepPurple[100]),
            child: Text(
              message,
              style: TextStyle(fontSize: 16),
              maxLines: 5,
              overflow: TextOverflow.fade,
            ),
          ),
          Text(DateFormat.jm('en_US').format(time.toDate()).toString(), style:TextStyle(color:Colors.black38))
        ],
      ),
    );
  }
}

// ListView(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//             children: <Widget>[
//               MyChat(
//                 message: 'halo',
//               ),
//               MyChat(
//                 message: 'hola',
//               ),
//               TheirChat(
//                   message:
//                       'welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome ')
//             ],
//           ),
