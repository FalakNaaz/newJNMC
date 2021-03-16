import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/MentorPages/patientInfoM.dart';
import 'package:jmnchelogbook/services/database.dart';
class LogOfCasesInfoM extends StatefulWidget {
  final String uid;
  final int rotationNo;
  LogOfCasesInfoM({this.uid,this.rotationNo});
  @override
  _LogOfCasesInfoMState createState() => _LogOfCasesInfoMState();
}

class _LogOfCasesInfoMState extends State<LogOfCasesInfoM> {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
        stream: DatabaseService(uid: widget.uid).listOfPatientData,
        builder: (context, snapshot) {
          print('listOfPatientNo snapshot.data:${snapshot.data}');
          if (snapshot.hasData) {
            QuerySnapshot patientData = snapshot.data;
            //patientData.documents.forEach((element) {print('forEach Bala');print(element.data);});
            return SafeArea(
              child: (/*patientNo[widget.rotationNo].no != 0*/true)
                  ? Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ListView(
                    children: snapshot.data.documents.map((DocumentSnapshot document) {
                      if(document.documentID == 'Rotation${widget.rotationNo}')
                        if(document.data['no'] != 0)
                          return Column(
                            children: [
                              for(int i=1; i<=document.data['no'];i++)
                                Card(
                                  color: Colors.cyan[50],
                                  shadowColor: Colors.blueGrey,
                                  child: new ListTile(
                                    leading:  Icon(Icons.account_circle, size: 35, color: Colors.blue,),
                                    title:(document.data['Patient$i']['name'] == '')? Text('Patient $i') : Text("${document.data['Patient$i']['name'] }"),
                                    //subtitle: new Text(document.data['company']),
                                    //onLongPress: ()=> DatabaseService(uid: widget.uid).deletePatientDoc(widget.rotationNo, i),
                                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => PatientInfoM(uid: widget.uid,rotationNo: widget.rotationNo,patientNo: i,))),
                                  ),
                                ),
                            ],
                          );
                        else
                          return Padding(
                            padding: const EdgeInsets.only(top: 250.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'No information available yet!',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, color: Colors.grey),
                              ),
                            ),
                          );
                      else
                        return Container();
                    }).toList(),
                  ),)
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
        });
  }
}
