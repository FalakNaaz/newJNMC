import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/MentorPages/logOfCasesInfoM.dart';

class LogOfCasesM extends StatefulWidget {
  final String uid;
  final int rotationNo;
  LogOfCasesM({this.uid,this.rotationNo});
  @override
  _LogOfCasesMState createState() => _LogOfCasesMState();
}

class _LogOfCasesMState extends State<LogOfCasesM> {
  String text = '';
  bool shouldDisplay = false;
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JNMCH eLogBook'),
        backgroundColor: Color.fromRGBO(273, 146, 158, 1),
      ),
      body: LogOfCasesInfoM(uid: widget.uid,rotationNo: widget.rotationNo),
    );
  }
}
