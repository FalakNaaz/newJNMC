import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/updatePatient.dart';
import 'package:jmnchelogbook/services/database.dart';

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
            } else {
              return Container();
            }
          }),
    );
  }
}
