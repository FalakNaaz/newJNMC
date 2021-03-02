import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/MentorPages/CVInfoForMentor.dart';
import 'package:jmnchelogbook/services/auth.dart';
import 'package:jmnchelogbook/pages/MentorPages/ResidentInfo.dart';
class Detail extends StatefulWidget {
  final String uid;
  Detail({this.uid});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    print(widget.uid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: <Widget>[
          FlatButton(
            child: Text('Mentor log out',style: TextStyle(color: Colors.white),),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body:ResidentInfo(uid:widget.uid),
    );
  }
}
