import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class EndRotationInfoM extends StatefulWidget {
  final String uid;
  final int rotationNo;

  EndRotationInfoM({this.uid,this.rotationNo});

  @override
  _EndRotationInfoMState createState() => _EndRotationInfoMState();
}

class _EndRotationInfoMState extends State<EndRotationInfoM> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return StreamBuilder<List<EndRotation>>(
        stream: DatabaseService(uid: widget.uid).listOfEndRotation,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<EndRotation> listOfEndRotationData = snapshot.data;
            return StreamBuilder<MentorData>(
              stream: DatabaseService(uid: user.uid).mentorData,
              builder: (context, snapshot2) {
               if(snapshot2.hasData){
                 MentorData mentorData = snapshot2.data;
                 return SafeArea(
                   child: (listOfEndRotationData[widget.rotationNo].antCareR != '')
                       ? Padding(
                     padding: const EdgeInsets.all(0.0),
                     child: SingleChildScrollView(
                       child: Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text(
                               "Category: Patient Care",
                               textScaleFactor: 1.5,
                               style: TextStyle(fontWeight: FontWeight.w600,
                                 color:Colors.teal,),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Table(
                               columnWidths: {
                                 0: FlexColumnWidth(5),
                                 1: FlexColumnWidth(2),
                                 2: FlexColumnWidth(3),
                               },
                               //textDirection: TextDirection.rtl,
                               defaultVerticalAlignment:
                               TableCellVerticalAlignment.middle,

                               border: TableBorder(
                                 horizontalInside: BorderSide(
                                     width: 1,
                                     color: Colors.grey,
                                     style: BorderStyle.solid),
                               ),
                               children: [
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     alignment: Alignment.center,
                                     child: Text(
                                       'Competency',
                                       style: TextStyle(
                                           fontStyle: FontStyle.italic,
                                           fontWeight: FontWeight.w600),
                                       textScaleFactor: 1.5,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       'Levels',
                                       style: TextStyle(
                                           fontStyle: FontStyle.italic,
                                           fontWeight: FontWeight.w600),
                                       textScaleFactor: 1.5,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       'Remarks',
                                       style: TextStyle(
                                           fontStyle: FontStyle.italic,
                                           fontWeight: FontWeight.w600),
                                       textScaleFactor: 1.5,
                                     ),
                                   ),
                                 ]),
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     //alignment: Alignment.center,
                                     child: Text(
                                       'Antepartum Care and Complications of Pregnancy',
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .antCareL,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .antCareR,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                 ]),
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     //alignment: Alignment.center,
                                     child: Text(
                                       'Care of Patients in the Intrapartum Period',
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .iCarePatientsL,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .iCarePatientsR,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                 ]),
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     child: Text(
                                       'Care of Patients in the Postpartum Period',
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .pCarePatientsL,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .pCarePatientsR,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                 ]),
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     //alignment: Alignment.center,
                                     child: Text(
                                       'Obstetrical Technical Skills',
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .obTechL,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .obTechR,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                 ]),
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     //alignment: Alignment.center,
                                     child: Text(
                                       'Gynecology Technical Skills: Laparotomyand vaginal surgery (e.g., abdominal Hysterectomy, Myomectomy, Adnexectomy, Vaginal Hysterectomy, Colporrhaphy, Mid-urethral Sling)',
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .gynaeTech1L,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .gynaeTech1R,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                 ]),
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     // alignment: Alignment.center,
                                     child: Text(
                                       'Gynecology Technical Skills: Endoscopy (Laparoscopy, Hysteroscopy, Cystoscopy)',
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .gynaeTech2L,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .gynaeTech2R,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                 ]),
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     //alignment: Alignment.center,
                                     child: Text(
                                       'Family Planning',
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .familyPlanningL,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .familyPlanningR,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                 ]),
                               ],
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text(
                               "Category: Professionalism",
                               textScaleFactor: 1.5,
                               style: TextStyle(fontWeight: FontWeight.w600,
                                 color:Colors.teal,),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Table(
                               columnWidths: {
                                 0: FlexColumnWidth(5),
                                 1: FlexColumnWidth(2),
                                 2: FlexColumnWidth(3),
                               },
                               //textDirection: TextDirection.rtl,
                               defaultVerticalAlignment:
                               TableCellVerticalAlignment.middle,

                               border: TableBorder(
                                 horizontalInside: BorderSide(
                                     width: 1,
                                     color: Colors.grey,
                                     style: BorderStyle.solid),
                               ),
                               children: [
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     alignment: Alignment.center,
                                     child: Text(
                                       'Competency',
                                       style: TextStyle(
                                           fontStyle: FontStyle.italic,
                                           fontWeight: FontWeight.w600),
                                       textScaleFactor: 1.5,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       'Levels',
                                       style: TextStyle(
                                           fontStyle: FontStyle.italic,
                                           fontWeight: FontWeight.w600),
                                       textScaleFactor: 1.5,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       'Remarks',
                                       style: TextStyle(
                                           fontStyle: FontStyle.italic,
                                           fontWeight: FontWeight.w600),
                                       textScaleFactor: 1.5,
                                     ),
                                   ),
                                 ]),
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     //alignment: Alignment.center,
                                     child: Text(
                                       'Professionalism	Accountability and Responsiveness to the Needs of Patients, Society, and the Profession',
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .accAndResL,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .accAndResR,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                 ]),
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     //alignment: Alignment.center,
                                     child: Text(
                                       'Respect for Patient Privacy, Autonomy, Patient-Physician Relationship',
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .respectL,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .respectR,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                 ]),
                               ],
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text(
                               "Category:Interpersonal and Communication Skills",
                               textScaleFactor: 1.5,
                               style: TextStyle(fontWeight: FontWeight.w600,
                                 color:Colors.teal,),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Table(
                               columnWidths: {
                                 0: FlexColumnWidth(5),
                                 1: FlexColumnWidth(2),
                                 2: FlexColumnWidth(3),
                               },
                               //textDirection: TextDirection.rtl,
                               defaultVerticalAlignment:
                               TableCellVerticalAlignment.middle,

                               border: TableBorder(
                                 horizontalInside: BorderSide(
                                     width: 1,
                                     color: Colors.grey,
                                     style: BorderStyle.solid),
                               ),
                               children: [
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     alignment: Alignment.center,
                                     child: Text(
                                       'Competency',
                                       style: TextStyle(
                                           fontStyle: FontStyle.italic,
                                           fontWeight: FontWeight.w600),
                                       textScaleFactor: 1.5,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       'Levels',
                                       style: TextStyle(
                                           fontStyle: FontStyle.italic,
                                           fontWeight: FontWeight.w600),
                                       textScaleFactor: 1.5,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       'Remarks',
                                       style: TextStyle(
                                           fontStyle: FontStyle.italic,
                                           fontWeight: FontWeight.w600),
                                       textScaleFactor: 1.5,
                                     ),
                                   ),
                                 ]),
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     //alignment: Alignment.center,
                                     child: Text(
                                       'Interpersonal and Communication Skills	Communication with Patients and Families',
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .comm1L,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .comm1R,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                 ]),
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     //alignment: Alignment.center,
                                     child: Text(
                                       'Communication with Physicians and Other Health Professionals and Teamwork',
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .comm2L,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .comm2R,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                 ],
                                 ),
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     //alignment: Alignment.center,
                                     child: Text(
                                       '	Informed Consent and Shared Decision Making	',
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .informedL,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .informedR,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                 ]),
                               ],
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text(
                               "Category: Practice-based Learning",
                               textScaleFactor: 1.5,
                               style: TextStyle(fontWeight: FontWeight.w600,
                                 color:Colors.teal,),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Table(
                               columnWidths: {
                                 0: FlexColumnWidth(5),
                                 1: FlexColumnWidth(2),
                                 2: FlexColumnWidth(3),
                               },
                               //textDirection: TextDirection.rtl,
                               defaultVerticalAlignment:
                               TableCellVerticalAlignment.middle,

                               border: TableBorder(
                                 horizontalInside: BorderSide(
                                     width: 1,
                                     color: Colors.grey,
                                     style: BorderStyle.solid),
                               ),
                               children: [
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     alignment: Alignment.center,
                                     child: Text(
                                       'Competency',
                                       style: TextStyle(
                                           fontStyle: FontStyle.italic,
                                           fontWeight: FontWeight.w600),
                                       textScaleFactor: 1.5,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       'Levels',
                                       style: TextStyle(
                                           fontStyle: FontStyle.italic,
                                           fontWeight: FontWeight.w600),
                                       textScaleFactor: 1.5,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       'Remarks',
                                       style: TextStyle(
                                           fontStyle: FontStyle.italic,
                                           fontWeight: FontWeight.w600),
                                       textScaleFactor: 1.5,
                                     ),
                                   ),
                                 ]),
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     //alignment: Alignment.center,
                                     child: Text(
                                       'Practice-based Learning 	Patient Safety and Systems Approach to Medical Errors: Participates in identifying system errors and implementing potential systems solutions',
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .patientSafetyL,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .patientSafetyR,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                 ]),
                               ],
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text(
                               "Category: System-based Learning",
                               textScaleFactor: 1.5,
                               style: TextStyle(fontWeight: FontWeight.w600,
                                 color:Colors.teal,),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Table(
                               columnWidths: {
                                 0: FlexColumnWidth(5),
                                 1: FlexColumnWidth(2),
                                 2: FlexColumnWidth(3),
                               },
                               //textDirection: TextDirection.rtl,
                               defaultVerticalAlignment:
                               TableCellVerticalAlignment.middle,

                               border: TableBorder(
                                 horizontalInside: BorderSide(
                                     width: 1,
                                     color: Colors.grey,
                                     style: BorderStyle.solid),
                               ),
                               children: [
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     alignment: Alignment.center,
                                     child: Text(
                                       'Competency',
                                       style: TextStyle(
                                           fontStyle: FontStyle.italic,
                                           fontWeight: FontWeight.w600),
                                       textScaleFactor: 1.5,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       'Levels',
                                       style: TextStyle(
                                           fontStyle: FontStyle.italic,
                                           fontWeight: FontWeight.w600),
                                       textScaleFactor: 1.5,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       'Remarks',
                                       style: TextStyle(
                                           fontStyle: FontStyle.italic,
                                           fontWeight: FontWeight.w600),
                                       textScaleFactor: 1.5,
                                     ),
                                   ),
                                 ]),
                                 TableRow(children: [
                                   Container(
                                     padding: EdgeInsets.all(8.0),
                                     //alignment: Alignment.center,
                                     child: Text(
                                       'Systems improvement: Cost-effective Care and Patient Advocacy',
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .systemImpL,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                   Container(
                                     alignment: Alignment.center,
                                     child: Text(
                                       listOfEndRotationData[widget.rotationNo]
                                           .systemImpR,
                                       textScaleFactor: 1,
                                     ),
                                   ),
                                 ]),
                               ],
                             ),
                           ),
                           (listOfEndRotationData[widget.rotationNo].isApproved) ?
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
                                     Text('Mentor Name: ${listOfEndRotationData[widget.rotationNo].mentorName}'),
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
                                               TextSpan(text:listOfEndRotationData[widget.rotationNo].mentorMail,style: TextStyle(color: Colors.teal) )
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
                                         await DatabaseService(uid: widget.uid).updateIsApprovedEndRotation(widget.rotationNo.toString(),false, '', '');
                                         await DatabaseService(uid: widget.uid).updateApprovalReadyEndRotation(widget.rotationNo.toString(),false);
                                         setState(() {});
                                       }
                                   ),
                                 )

                               ],
                             ),
                           ):
                           (listOfEndRotationData[widget.rotationNo].approvalReady) ?
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
                                       await DatabaseService(uid: widget.uid).updateIsApprovedEndRotation(widget.rotationNo.toString(),true, mentorData.name, mentorData.email);
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
                                       await DatabaseService(uid: widget.uid).updateApprovalReadyEndRotation(widget.rotationNo.toString(),false, );
                                       setState(() {});
                                     }
                                 ),
                               ],
                             ),
                           ) : Center(
                             child: Padding(
                               padding: const EdgeInsets.all(16.0),
                               child: Row(
                                 children: [
                                   Icon(Icons.info_outline),
                                   SizedBox(width: 10.0,),
                                   Text('The resident has not yet applied for approval'),
                                 ],
                               ),
                             ),
                           )
                         ],
                       ),
                     ),
                   )
                       : Align(
                     alignment: Alignment.center,
                     child: Text(
                       'No information available yet!',
                       style: TextStyle(
                           fontStyle: FontStyle.italic, color: Colors.grey),
                     ),
                   ),
                 );
               } else{
                 return Container();
               }
              }
            );
          } else {
            return Container();
          }
        });
  }
}
