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
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<List<Report>>(
        stream: DatabaseService(uid: user.uid).listOfReportData,
        builder: (context, snapshot) {
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
                          (reportData[widget.rotationNo].isApproved) ?
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text('Approved',textScaleFactor: 1.5,),
                                    Icon(Icons.check_circle, color: Colors.green,size: 30,)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text('Mentor Name: ${reportData[widget.rotationNo].mentorName}'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    RichText(
                                        text: TextSpan(
                                            text: 'Mentor Email: ',
                                            style: DefaultTextStyle.of(context).style,
                                            children: <TextSpan>[
                                              TextSpan(text:reportData[widget.rotationNo].mentorMail,style: TextStyle(color: Colors.teal) )
                                            ]


                                        )
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ):
                          (!reportData[widget.rotationNo].approvalReady) ?
                          Center(
                            child: RaisedButton(
                                color: Colors.teal,
                                child: Text(
                                  'Get Approved',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: ()async {await DatabaseService(uid: user.uid).updateApprovalReadyReport(widget.rotationNo.toString(),true); }
                            ),
                          ) : Center(
                            child: RaisedButton(
                                color: Colors.teal,
                                child: Text(
                                  'Pending',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: ()async {await DatabaseService(uid: user.uid).updateApprovalReadyReport(widget.rotationNo.toString(),false); }
                            ),
                          )
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
