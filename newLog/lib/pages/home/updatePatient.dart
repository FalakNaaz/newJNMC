import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';
class UpdatePatient extends StatefulWidget {
  final int rotationNo;
  final int patientNo;
  UpdatePatient({this.rotationNo, this.patientNo});
  @override
  _UpdatePatientState createState() => _UpdatePatientState();
}

class _UpdatePatientState extends State<UpdatePatient> {
  final _formKey = GlobalKey<FormState>();

  //form values
  String _currentdate;
  String _currentname;
  String _currentdiagnosis;
  String _currentprocedure;
  String _currentlevel;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    DocumentSnapshot documentSnapshot;
    return StreamBuilder<QuerySnapshot>(
        stream: DatabaseService(uid: user.uid).listOfPatientData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            QuerySnapshot querySnapshot = snapshot.data;
            querySnapshot.documents.forEach((DocumentSnapshot document) {
              if (document.documentID == 'Rotation${widget.rotationNo}') {
                print('document');
                documentSnapshot = document;
                print(documentSnapshot);
              }
            });
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Update your Patient Info',
                      style: TextStyle(fontSize: 20.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.w600),

                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(' Date '),
                      maxLines: 4,
                      initialValue: documentSnapshot.data['Patient${widget.patientNo}']['date'],
                      validator: (val) =>
                      val.isEmpty ? 'Please enter Date detail' : null,
                      onChanged: (val) => setState(() => _currentdate = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Patient\'s Name' ),
                      maxLines: 4,
                      initialValue: documentSnapshot.data['Patient${widget.patientNo}']['name'],
                      validator: (val) =>
                      val.isEmpty ? 'Please enter Name' : null,
                      onChanged: (val) => setState(() => _currentname = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Diagnosis'),
                      maxLines: 4,
                      initialValue: documentSnapshot.data['Patient${widget.patientNo}']['diagnosis'],
                      validator: (val) =>
                      val.isEmpty ? 'Please enter diagnosis' : null,
                      onChanged: (val) => setState(() => _currentdiagnosis = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Procedure '),
                      maxLines: 4,
                      initialValue: documentSnapshot.data['Patient${widget.patientNo}']['procedure'],
                      validator: (val) =>
                      val.isEmpty ? 'Please enter procedure ' : null,
                      onChanged: (val) => setState(() => _currentprocedure = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Level Achieved'),
                      maxLines: 4,
                      initialValue: documentSnapshot.data['Patient${widget.patientNo}']['level'],
                      validator: (val) => val.isEmpty ? 'Any other level achieved' : null,
                      onChanged: (val) => setState(() => _currentlevel = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Colors.teal,
                      child: Text(
                        'update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        // if (_formKey.currentState.validate())
                        {

                          //print(_currentpdate);
                          await DatabaseService(uid: user.uid)
                              .updatePatientDoc(
                            widget.rotationNo,
                            widget.patientNo,
                            _currentdate ?? documentSnapshot.data['Patient${widget.patientNo}']['date'],
                            _currentname ?? documentSnapshot.data['Patient${widget.patientNo}']['name'],
                            _currentdiagnosis ?? documentSnapshot.data['Patient${widget.patientNo}']['diagnosis'],
                            _currentprocedure ?? documentSnapshot.data['Patient${widget.patientNo}']['procedure'],
                            _currentlevel ?? documentSnapshot.data['Patient${widget.patientNo}']['level'],
                          );
                          Navigator.pop(context);
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
