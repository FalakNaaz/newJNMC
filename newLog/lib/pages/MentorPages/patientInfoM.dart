import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/updatePatient.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class PatientInfoM extends StatefulWidget {
  final String uid;
  final int rotationNo;
  final int patientNo;

  PatientInfoM({this.uid,this.rotationNo, this.patientNo});

  @override
  _PatientInfoMState createState() => _PatientInfoMState();
}

class _PatientInfoMState extends State<PatientInfoM> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    const rowSpacer=TableRow( children: [ SizedBox( height: 12, ), SizedBox( height: 12, ), SizedBox( height: 12, ) ]);
    DocumentSnapshot documentSnapshot;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Patient Info'),
        backgroundColor: Color.fromRGBO(273, 146, 158, 1),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: DatabaseService(uid: widget.uid).listOfPatientData,
          builder: (context, snapshot) {
            print('snapshot.data:${snapshot.hasData}');
            if (snapshot.hasData) {
              QuerySnapshot querySnapshot = snapshot.data;
              querySnapshot.documents.forEach((DocumentSnapshot document) {
                if (document.documentID == 'Rotation${widget.rotationNo}') {
                  print('document');
                  documentSnapshot = document;
                  print(documentSnapshot);
                }
              });
              return StreamBuilder<MentorData>(
                stream:  DatabaseService(uid: user.uid).mentorData,
                builder: (context, snapshot2) {
                 if(snapshot2.hasData){
                   MentorData mentorData = snapshot2.data;
                   return SafeArea(
                     child: (documentSnapshot
                         .data['Patient${widget.patientNo}']
                     ['date'] != '')
                         ? SizedBox.expand(
                       child: Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: Card(
                           color: Colors.white,
                           shadowColor: Colors.blueGrey,
                           elevation: 10.0,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             //mainAxisAlignment: MainAxisAlignment.start,
                             children: <Widget>[
                               SizedBox(height: 10.0,),
                               Text('Rotation #${widget.rotationNo+1}',
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                   fontWeight: FontWeight.w600,
                                   fontSize: 25.0,
                                   color:  Color.fromRGBO(273, 146, 158, 1),
                                   decoration: TextDecoration.underline,
                                 ),),
                               Text('Patient #${widget.patientNo}',
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                   fontWeight: FontWeight.w600,
                                   fontSize: 25.0,
                                   color:  Color.fromRGBO(273, 146, 158, 1),
                                   decoration: TextDecoration.underline,
                                 ),),
                               SizedBox(height: 40.0,),

                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Table(

                                   columnWidths: {
                                     0: FlexColumnWidth(5),
                                     1: FlexColumnWidth(1),
                                     2: FlexColumnWidth(5),
                                   },
                                   // textDirection: TextDirection.rtl,
                                   //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                                   // border:TableBorder.all(width: 2.0,color: Colors.red),
                                   children: [

                                     TableRow(
                                         children: [
                                           Text("Date",textScaleFactor: 1.5,),
                                           Text(":",textScaleFactor: 1.5,),
                                           Text(documentSnapshot
                                               .data['Patient${widget.patientNo}']
                                           ['date'],textScaleFactor: 1.5),
                                           //Text("University",textScaleFactor: 1.5),
                                         ]
                                     ),
                                     rowSpacer,
                                     TableRow(
                                         children: [
                                           Text("Patient name/ Age / CADs",textScaleFactor: 1.5),
                                           Text(":",textScaleFactor: 1.5,),
                                           Text(documentSnapshot
                                               .data['Patient${widget.patientNo}']
                                           ['name'],textScaleFactor: 1.5),
                                           //Text("AKTU",textScaleFactor: 1.5),
                                         ]
                                     ),
                                     rowSpacer,
                                     TableRow(
                                         children: [
                                           Text("Diagnosis",textScaleFactor: 1.5),
                                           Text(":",textScaleFactor: 1.5,),
                                           Text(documentSnapshot
                                               .data['Patient${widget.patientNo}']
                                           ['diagnosis'],textScaleFactor: 1.5),

                                         ]
                                     ),
                                     rowSpacer,
                                     TableRow(
                                         children: [
                                           Text("Procedure",textScaleFactor: 1.5),
                                           Text(":",textScaleFactor: 1.5,),
                                           Text(documentSnapshot
                                               .data['Patient${widget.patientNo}']
                                           ['procedure'],textScaleFactor: 1.5),
                                         ]
                                     ),
                                     rowSpacer,
                                     TableRow(
                                         children: [
                                           Text("Level Achieved",textScaleFactor: 1.5),
                                           Text(":",textScaleFactor: 1.5,),
                                           Text(documentSnapshot
                                               .data['Patient${widget.patientNo}']
                                           ['level'],textScaleFactor: 1.5),
                                         ]
                                     ),
                                   ],
                                 ),
                               ),
                               (documentSnapshot.data['Patient${widget.patientNo}']['isApproved']) ?
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
                                         Text('Mentor Name: ${documentSnapshot.data['Patient${widget.patientNo}']['mentorName']}'),
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
                                                   TextSpan(text:documentSnapshot.data['Patient${widget.patientNo}']['mentorMail'],style: TextStyle(color: Color.fromRGBO(273, 146, 158, 1)) )
                                                 ]


                                             )
                                         ),
                                       ],
                                     ),
                                     SizedBox(height: 20.0,),
                                     Center(
                                       child: RaisedButton(
                                           color: Color.fromRGBO(273, 146, 158, 1),
                                           child: Text(
                                             'Un-approve',
                                             style: TextStyle(color: Colors.white),
                                           ),
                                           onPressed: ()async {
                                             await DatabaseService(uid: widget.uid).updateIsApprovedLog(widget.rotationNo,widget.patientNo,false, '', '');
                                             await DatabaseService(uid: widget.uid).updateApprovalReadyLog(widget.rotationNo,widget.patientNo,false);
                                             setState(() {});
                                           }
                                       ),
                                     )

                                   ],
                                 ),
                               ):
                               (documentSnapshot.data['Patient${widget.patientNo}']['approvalReady']) ?
                               Center(
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     SizedBox(height: 100.0,),
                                     RaisedButton(
                                         color: Color.fromRGBO(273, 146, 158, 1),
                                         child: Text(
                                           'Approve',
                                           style: TextStyle(color: Colors.white),
                                         ),
                                         onPressed: ()async {
                                           await DatabaseService(uid: widget.uid).updateIsApprovedLog(widget.rotationNo,widget.patientNo,true, mentorData.name, mentorData.email);
                                           setState(() {});
                                         }
                                     ),
                                     SizedBox(width: 20.0,),
                                     RaisedButton(
                                         color: Color.fromRGBO(273, 146, 158, 1),
                                         child: Text(
                                           'Decline',
                                           style: TextStyle(color: Colors.white),
                                         ),
                                         onPressed: ()async {
                                           await DatabaseService(uid: widget.uid).updateApprovalReadyLog(widget.rotationNo,widget.patientNo,false, );
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
                             ],
                           ),
                         ),
                       ),
                     )
                         : Align(
                       alignment: Alignment.center,
                       child: Text(
                         'No information available Yet!',
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
          }),
    );
  }
}
