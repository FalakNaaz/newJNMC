import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class SummaryInfo extends StatefulWidget {
  @override
  _SummaryInfoState createState() => _SummaryInfoState();
}

class _SummaryInfoState extends State<SummaryInfo> {

  TextStyle textStyle(){
    return TextStyle(fontWeight: FontWeight.w600,color: Colors.teal, fontSize: 14);
  }
  @override
  Widget build(BuildContext context) {
    const rowSpacer=TableRow( children: [ SizedBox( height: 12, ), SizedBox( height: 12, ), SizedBox( height: 12, ) ]);
    final publications = Provider.of<User>(context) ;
    return StreamBuilder<Summary>(
        stream: DatabaseService(uid: publications.uid).summaryData,
        builder: (context, snapshot) {
          if(snapshot.hasData)
          {
            Summary summaryData = snapshot.data;
            return SafeArea(
              child: summaryData.name == '' ? Align(
                alignment: Alignment.center,
                child: Text(
                  'No Information Available! Edit to update',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.grey),
                ),
              ) : SingleChildScrollView(
                child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('(To be filled in at the end of the course)',),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Table(

                          columnWidths: {
                            0: FlexColumnWidth(6),
                            1: FlexColumnWidth(1),
                            2: FlexColumnWidth(3),
                          },
                          // textDirection: TextDirection.rtl,
                          //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                          // border:TableBorder.all(width: 2.0,color: Colors.red),
                          children: [

                            TableRow(
                                children: [
                                  Text("Name of the Student",textScaleFactor: 1.2,),
                                  Text(":",textScaleFactor: 1.2,),
                                  Text(summaryData.name,textScaleFactor: 1.2),
                                  //Text("University",textScaleFactor: 1.2),
                                ]
                            ),
                            rowSpacer,
                            TableRow(
                                children: [
                                  Text("Name of the Course",textScaleFactor: 1.2,),
                                  Text(":",textScaleFactor: 1.2,),
                                  Text(summaryData.course,textScaleFactor: 1.2),
                                  //Text("AKTU",textScaleFactor: 1.2),
                                ]
                            ),
                            rowSpacer,
                            TableRow(
                                children: [
                                  Text("Duration of the Course",textScaleFactor: 1.2,),
                                  Text(":",textScaleFactor: 1.2,),
                                  Text(summaryData.duration,textScaleFactor: 1.2),

                                ]
                            ),
                            rowSpacer,
                            TableRow(
                                children: [
                                  Text("Number of Major Operations /  Procedure Performed",textScaleFactor: 1.2,),
                                  Text(":",textScaleFactor: 1.2,),
                                  Text(summaryData.majorP,textScaleFactor: 1.2),
                                ]
                            ),
                            rowSpacer,
                            TableRow(
                                children: [
                                  Text("Number of Major Operations /  Procedure Assisted",textScaleFactor: 1.2,),
                                  Text(":",textScaleFactor: 1.2,),
                                  Text(summaryData.majorA,textScaleFactor: 1.2),
                                ]
                            ),
                            rowSpacer,
                            TableRow(
                                children: [
                                  Text("Number of Minor Operations /  Procedure Performed",textScaleFactor: 1.2,),
                                  Text(":",textScaleFactor: 1.2,),
                                  Text(summaryData.minorP,textScaleFactor: 1.2),
                                ]
                            ),
                            rowSpacer,
                            TableRow(
                                children: [
                                  Text("Number of Minor Operations /  Procedure Assisted",textScaleFactor: 1.2,),
                                  Text(":",textScaleFactor: 1.2,),
                                  Text(summaryData.minorA,textScaleFactor: 1.2),
                                ]
                            ),rowSpacer,
                            TableRow(
                                children: [
                                  Text("Number of Seminars Presented",textScaleFactor: 1.2,),
                                  Text(":",textScaleFactor: 1.2,),
                                  Text(summaryData.seminarP,textScaleFactor: 1.2),
                                ]
                            ),rowSpacer,
                            TableRow(
                                children: [
                                  Text("Number of Seminars Attended",textScaleFactor: 1.2,),
                                  Text(":",textScaleFactor: 1.2,),
                                  Text(summaryData.seminarA,textScaleFactor: 1.2),
                                ]
                            ),rowSpacer,
                            TableRow(
                                children: [
                                  Text("Number of Case Presentations Presented",textScaleFactor: 1.2,),
                                  Text(":",textScaleFactor: 1.2,),
                                  Text(summaryData.caseP,textScaleFactor: 1.2),
                                ]
                            ),rowSpacer,
                            TableRow(
                                children: [
                                  Text("Number of Case Presentations Attended",textScaleFactor: 1.2,),
                                  Text(":",textScaleFactor: 1.2,),
                                  Text(summaryData.caseA,textScaleFactor: 1.2),
                                ]
                            ),rowSpacer,
                            TableRow(
                                children: [
                                  Text("Number of UG classes Conducted",textScaleFactor: 1.2,),
                                  Text(":",textScaleFactor: 1.2,),
                                  Text(summaryData.ugC,textScaleFactor: 1.2),
                                ]
                            ),rowSpacer,
                            TableRow(
                                children: [
                                  Text("Number of UG classes Attended",textScaleFactor: 1.2,),
                                  Text(":",textScaleFactor: 1.2,),
                                  Text(summaryData.ugA,textScaleFactor: 1.2),
                                ]
                            ),rowSpacer,
                            TableRow(
                                children: [
                                  Text("Number  of Public Health Visits / Social-Work / Survey / Camps",textScaleFactor: 1.2,),
                                  Text(":",textScaleFactor: 1.2,),
                                  Text(summaryData.pHV,textScaleFactor: 1.2),
                                ]
                            ),rowSpacer,
                            TableRow(
                                children: [
                                  Text("Number of conferences / Symposia /Workshops / CMEs Attended",textScaleFactor: 1.2,),
                                  Text(":",textScaleFactor: 1.2,),
                                  Text(summaryData.conferences,textScaleFactor: 1.2),
                                ]
                            ),rowSpacer,
                            TableRow(
                                children: [
                                  Text("Any other activities",textScaleFactor: 1.2,),
                                  Text(":",textScaleFactor: 1.2,),
                                  Text(summaryData.other,textScaleFactor: 1.2),
                                ]
                            ),
                          ],
                        ),
                      ),
                      (summaryData.isApproved) ?
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text('Approved',textScaleFactor: 1.2,),
                                Icon(Icons.check_circle, color: Colors.green,size: 30,)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text('Mentor Name: ${summaryData.mentorName}'),
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
                                          TextSpan(text:summaryData.mentorMail,style: TextStyle(color: Colors.teal) )
                                        ]


                                    )
                                ),
                              ],
                            )
                          ],
                        ),
                      ):
                      (!summaryData.approvalReady) ?
                      Center(
                        child: RaisedButton(
                            color: Colors.teal,
                            child: Text(
                              'Get Approved',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: ()async {await DatabaseService(uid: publications.uid).updateApprovalReadySummary(true); }
                        ),
                      ) : Center(
                        child: RaisedButton(
                            color: Colors.teal,
                            child: Text(
                              'Pending',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: ()async {await DatabaseService(uid: publications.uid).updateApprovalReadySummary(false); }
                        ),
                      ),
                      SizedBox(height: 80.0,),
                    ]),
              ),

            );

          }
          else{
            return Container();
          }

        }
    );
  }
}