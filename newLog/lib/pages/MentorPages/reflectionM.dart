import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/MentorPages/reflectionInfoM.dart';

class ReflectionM extends StatelessWidget {
  final String uid;
  final int rotationNo;
  ReflectionM({this.uid,this.rotationNo});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Reflection'),
          backgroundColor: Colors.teal,
        ),
        body: ReflectionInfoM(uid:uid,rotationNo: rotationNo),
    );
  }
}
