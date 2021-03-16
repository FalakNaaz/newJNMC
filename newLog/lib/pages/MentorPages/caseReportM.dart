import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/MentorPages/caseReportInfoM.dart';

class CaseReportM extends StatelessWidget {
  final String uid;
  final int rotationNo;
  CaseReportM({this.uid,this.rotationNo});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Case Report'),
          backgroundColor: Colors.teal,
        ),
        body: CaseReportInfoM(uid: uid, rotationNo: rotationNo),

    );
  }
}
