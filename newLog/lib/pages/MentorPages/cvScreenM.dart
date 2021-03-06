import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/MentorPages/cvInfoM.dart';

class CVScreenM extends StatelessWidget {
  final String uid;
  CVScreenM({this.uid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Curriculum Vitae'),
        backgroundColor: Colors.teal,
      ),
      body: CVInfoM(uid: uid,),
    );
  }
}
