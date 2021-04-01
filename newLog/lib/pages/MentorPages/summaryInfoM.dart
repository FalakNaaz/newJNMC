import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class SummaryInfoM extends StatefulWidget {
  final String uid;
  SummaryInfoM({this.uid});
  @override
  _SummaryInfoMState createState() => _SummaryInfoMState();
}

class _SummaryInfoMState extends State<SummaryInfoM> {

  TextStyle textStyle(){
    return TextStyle(fontWeight: FontWeight.w600,color: Colors.teal, fontSize: 14);
  }
  @override
  Widget build(BuildContext context) {
    const rowSpacer=TableRow( children: [ SizedBox( height: 12, ), SizedBox( height: 12, ), SizedBox( height: 12, ) ]);
    final user = Provider.of<User>(context) ;
    return StreamBuilder<Summary>(
        stream: DatabaseService(uid: widget.uid).summaryData,
        builder: (context, snapshot) {
          if(snapshot.hasData)
          {
            Summary summaryData = snapshot.data;
            return StreamBuilder<MentorData>(
              stream: DatabaseService(uid: user.uid).mentorData,
              builder: (context, snapshot2) {
                if(snapshot2.hasData){
                  MentorData mentorData = snapshot2.data;
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
                                      Text('Approved',textScaleFactor: 1.5,),
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
                                  ),
                                  SizedBox(height: 20.0,),
                                  Center(
                                    child: RaisedButton(
                                        color: Colors.teal,
                                        child: Text(
                                          'Un-approve',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: ()async {
                                          await DatabaseService(uid: widget.uid).updateIsApprovedSummary(false, '', '');
                                          await DatabaseService(uid: widget.uid).updateApprovalReadySummary(false);
                                          setState(() {});
                                        }
                                    ),
                                  )

                                ],
                              ),
                            ):
                            (summaryData.approvalReady) ?

                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 100.0,),
                                  RaisedButton(
                                      color: Colors.teal,
                                      child: Text(
                                        'Approve',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: ()async {
                                        await DatabaseService(uid: widget.uid).updateIsApprovedSummary(true, mentorData.name, mentorData.email);
                                        setState(() {});
                                      }
                                  ),
                                  SizedBox(width: 20.0,),
                                  RaisedButton(
                                      color: Colors.teal,
                                      child: Text(
                                        'Decline',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: ()async {
                                        await DatabaseService(uid: widget.uid).updateApprovalReadySummary(false, );
                                        setState(() {});
                                      }
                                  ),
                                ],
                              ),
                            ) : Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.info_outline),
                                    SizedBox(width: 10.0,),
                                    Text('The resident has not yet applied for approval'),
                                  ],
                                ),
                              ),
                            )
                          ]),
                    ),

                  );
                } else{
                  return Container();
                }

              }
            );

          }
          else{
            return Container();
          }

        }
    );
  }
}