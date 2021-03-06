import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/patientInfo.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';

class LogOfCasesInfo extends StatefulWidget {
  final int rotationNo;

  LogOfCasesInfo({this.rotationNo});

  @override
  _LogOfCasesInfoState createState() => _LogOfCasesInfoState();
}

class _LogOfCasesInfoState extends State<LogOfCasesInfo> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<QuerySnapshot>(
        stream: DatabaseService(uid: user.uid).listOfPatientData,
        builder: (context, snapshot) {
          print('listOfPatientNo snapshot.data:${snapshot.data}');
          if (snapshot.hasData) {
            QuerySnapshot patientData = snapshot.data;
            patientData.documents.forEach((element) {
              print('forEach Bala');
              print(element.data);
            });
            return SafeArea(
              child: (/*patientNo[widget.rotationNo].no != 0*/ true)
                  ? Padding(
                      padding: EdgeInsets.all(20.0),
                      child: ListView(
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          if (document.documentID ==
                              'Rotation${widget.rotationNo}') if (document
                                  .data['no'] !=
                              0)
                            return Column(
                              children: [
                                for (int i = 1; i <= document.data['no']; i++)
                                  Card(
                                    child: new ListTile(
                                      leading: Icon(
                                        Icons.person_sharp,
                                        size: 56,
                                        color: Colors.teal,
                                      ),
                                      title: (document.data['Patient$i']
                                                  ['name'] ==
                                              '')
                                          ? Text('Patient$i')
                                          : Text(
                                              "${document.data['Patient$i']['name']}"),
                                      //subtitle: new Text(document.data['company']),
                                      //onLongPress: ()=> DatabaseService(uid: user.uid).deletePatientDoc(widget.rotationNo, i),
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PatientInfo(
                                                    rotationNo:
                                                        widget.rotationNo,
                                                    patientNo: i,
                                                  ))),
                                    ),
                                  ),
                              ],
                            );
                          else
                            return Text("hi${document.data['no']}");
                          else
                            return Container();
                        }).toList(),
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
