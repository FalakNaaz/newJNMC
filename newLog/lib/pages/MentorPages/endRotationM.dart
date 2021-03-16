import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/MentorPages/endRotationInfoM.dart';

class EndRotationM extends StatelessWidget {
  final String uid;
  final int rotationNo;
  EndRotationM({this.uid, this.rotationNo});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('End of Rotation Assessment'),
          backgroundColor: Colors.teal,
        ),
        body: EndRotationInfoM(uid: uid,rotationNo: rotationNo),

    );
  }
}
