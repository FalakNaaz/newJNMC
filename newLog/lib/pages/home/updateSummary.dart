import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';

class UpdateSummary extends StatefulWidget {
  @override
  _UpdateSummaryState createState() => _UpdateSummaryState();
}

class _UpdateSummaryState extends State<UpdateSummary> {
  final _formKey = GlobalKey<FormState>();

  //form values
  String _currentname;
  String _currentcourse;
  String _currentduration;
  String _currentmajorP;
  String _currentmajorA;
  String _currentminorP;
  String _currentminorA;
  String _currentseminarP;
  String _currentseminarA;
  String _currentcaseP;
  String _currentcaseA;
  String _currentugC;
  String _currentugA;
  String _currentpHV;
  String _currentconferences;
  String _currentother;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<Summary>(
        stream: DatabaseService(uid: user?.uid).summaryData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Summary summaryData = snapshot.data;
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Update your Summary info',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '(To be filled in at the end of the course)',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Name of the Student'),
                      maxLines: 4,
                      initialValue: summaryData.name,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter name' : null,
                      onChanged: (val) => setState(() => _currentname = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Name of the Course'),
                      maxLines: 4,
                      initialValue: summaryData.course,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter course' : null,
                      onChanged: (val) =>
                          setState(() => _currentcourse = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Duration of the course'),
                      maxLines: 4,
                      initialValue: summaryData.duration,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter duration' : null,
                      onChanged: (val) =>
                          setState(() => _currentduration = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Number of Major Operations /  Procedure Performed'),
                      maxLines: 4,
                      initialValue: summaryData.majorP,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter the field' : null,
                      onChanged: (val) => setState(() => _currentmajorP= val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Number of Major Operations /  Procedure Assisted'),
                      maxLines: 4,
                      initialValue: summaryData.majorA,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter the field' : null,
                      onChanged: (val) =>
                          setState(() => _currentmajorA = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Number of Minor Operations /  Procedure Performed'),
                      maxLines: 4,
                      initialValue: summaryData.minorP,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter the field' : null,
                      onChanged: (val) =>
                          setState(() => _currentminorP = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Number of Minor Operations /  Procedure Assisted'),
                      maxLines: 4,
                      initialValue: summaryData.minorA,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter the field' : null,
                      onChanged: (val) =>
                          setState(() => _currentminorA = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration('Number of Seminars Presented'),
                      maxLines: 4,
                      initialValue: summaryData.seminarP,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter the field' : null,
                      onChanged: (val) =>
                          setState(() => _currentseminarP = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration('Number of Seminars Attended'),
                      maxLines: 4,
                      initialValue: summaryData.seminarA,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter the field' : null,
                      onChanged: (val) =>
                          setState(() => _currentseminarA = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Number of Case Presentations Presented'),
                      maxLines: 4,
                      initialValue: summaryData.caseP,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter the field' : null,
                      onChanged: (val) =>
                          setState(() => _currentcaseP = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Number of Case Presentations Attended'),
                      maxLines: 4,
                      initialValue: summaryData.caseA,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter the field' : null,
                      onChanged: (val) =>
                          setState(() => _currentcaseA = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Number of UG classes Conducted'),
                      maxLines: 4,
                      initialValue: summaryData.ugC,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter the field' : null,
                      onChanged: (val) =>
                          setState(() => _currentugC = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Number of UG classes Attended'),
                      maxLines: 4,
                      initialValue: summaryData.ugA,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter the field' : null,
                      onChanged: (val) =>
                          setState(() => _currentugA = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Number  of Public Health Visits / Social-Work / Survey / Camps'),
                      maxLines: 4,
                      initialValue: summaryData.pHV,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter the field' : null,
                      onChanged: (val) =>
                          setState(() => _currentpHV = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Number of conferences / Symposia /Workshops / CMEs Attended'),
                      maxLines: 4,
                      initialValue: summaryData.conferences,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter the field' : null,
                      onChanged: (val) =>
                          setState(() => _currentconferences = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Any other activities'),
                      maxLines: 4,
                      initialValue: summaryData.other,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter the field' : null,
                      onChanged: (val) =>
                          setState(() => _currentother = val),
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
                          await DatabaseService(uid: user.uid)
                              .updateSummary(
                            _currentname ?? summaryData.name,
                            _currentcourse ?? summaryData.course,
                            _currentduration ?? summaryData.duration,
                            _currentmajorP ?? summaryData.majorP,
                            _currentmajorA ?? summaryData.majorA,
                            _currentminorP ?? summaryData.minorP,
                            _currentminorA ?? summaryData.minorA,
                            _currentseminarP ?? summaryData.seminarP,
                            _currentseminarA ?? summaryData.seminarA,
                            _currentcaseP ?? summaryData.caseP,
                            _currentcaseA ?? summaryData.caseA,
                            _currentugC ?? summaryData.ugC,
                            _currentugA ?? summaryData.ugA,
                            _currentpHV ?? summaryData.pHV,
                            _currentconferences ?? summaryData.conferences,
                            _currentother ?? summaryData.other,
                            summaryData.approvalReady,
                            summaryData.isApproved,
                            summaryData.mentorName,
                            summaryData.mentorMail,


                          );
                          Navigator.pop(context);
                        }
                        // print(_currentName);
                        // print(_currentEnrl);
                        // print(_currentFacultyno);
                      },
                    )
                  ],
                ),
              ),
            );
          } else {
            setState(() {});
            return Container();
          }
        });
  }
}
