import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';

class CaseReportInfoM extends StatefulWidget {
  final String uid;
  final int rotationNo;

  CaseReportInfoM({this.uid,this.rotationNo});

  @override
  _CaseReportInfoMState createState() => _CaseReportInfoMState();
}

class _CaseReportInfoMState extends State<CaseReportInfoM> {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Report>>(
        stream: DatabaseService(uid: widget.uid).listOfReportData,
        builder: (context, snapshot) {
          print('snapshot.data:${snapshot.hasData}');
          if (snapshot.hasData) {
            List<Report> reportData = snapshot.data;
            return SafeArea(
              child: (reportData[widget.rotationNo].reportText != '')
                  ? Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Write a case report of an interesting case you managed/helped manage during the current posting which maybe:\n1.	A rare disease, uncommon problem\n2.	A rare presentation of a common disease\n3.	An uncommon management of a common problem\n4.	An  important clinical lesson',
                        style: textStyle(),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20.0,),
                      Text('${reportData[widget.rotationNo].reportText}'),
                    ],
                  ))
                  : Align(
                alignment: Alignment.center,
                child: Text(
                  'No information available! Edit to Update',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.grey),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
