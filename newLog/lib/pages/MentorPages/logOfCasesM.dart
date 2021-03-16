import 'package:flutter/material.dart';
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
        title: Text('Log of Cases/Procedures'),
        backgroundColor: Colors.teal,
      ),
      body: LogOfCasesInfoM(uid: widget.uid,rotationNo: widget.rotationNo),
    );
  }
}
