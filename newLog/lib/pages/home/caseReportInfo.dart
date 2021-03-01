import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';

class CaseReportInfo extends StatefulWidget {
  final int rotationNo;

  CaseReportInfo({this.rotationNo});

  @override
  _CaseReportInfoState createState() => _CaseReportInfoState();
}

class _CaseReportInfoState extends State<CaseReportInfo> {
  Widget _createTextArea(String label, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Text(
        '$label $text',
        style: TextStyle(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<List<Report>>(
        stream: DatabaseService(uid: user.uid).listOfReportData,
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
