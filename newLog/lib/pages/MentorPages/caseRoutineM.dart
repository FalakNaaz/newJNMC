import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/MentorPages/caseRoutineInfoM.dart';

class CaseRoutineScreenM extends StatelessWidget {
  final String uid;
  final int rotationNo;
  CaseRoutineScreenM({this.uid,this.rotationNo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('JNMCH eLogBook'),
          backgroundColor: Colors.teal,
        ),
        body: CaseRoutineInfoM(uid: uid, rotationNo: rotationNo),

    );
  }
}
