import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';

class UpdateCaseReport extends StatefulWidget {
  final int rotationNo;

  UpdateCaseReport({this.rotationNo});

  @override
  _UpdateCaseReportState createState() => _UpdateCaseReportState();
}

class _UpdateCaseReportState extends State<UpdateCaseReport> {
  final _formKey = GlobalKey<FormState>();
  String _currentReportText;
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return StreamBuilder<List<Report>>(
            stream: DatabaseService(uid: user.uid).listOfReportData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Report> listOfReportData = snapshot.data;
               return Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                        child: Center(
                            child: Text(
                              "Case Report",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Write a case report of an interestingcase you managed/helped during the current posting which maybe:",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "1. A rare disease, uncommon problem.",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "2. A rare preentation of a common disearse.",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "3. A uncommon management off a commom problem.",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "4. An important clinical lesson.",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Case Report",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: textInputDecoration('Write your report'),
                              maxLines: 8,
                              initialValue: listOfReportData[widget.rotationNo].reportText,
                              validator: (val) => val.isEmpty ? 'Enter report' : null,
                              onChanged: (val) => setState(() => _currentReportText = val),
                            ),
                            ButtonTheme(
                              padding: const EdgeInsets.all(20),
                              child: ButtonTheme(
                                child: RaisedButton(
                                  onPressed: () async {
                                     if (_formKey.currentState.validate())
                                    {
                                      await DatabaseService(uid: user.uid)
                                          .updateReport(
                                        widget.rotationNo,
                                        _currentReportText ?? listOfReportData[widget.rotationNo].reportText,
                                      );

                                      Navigator.pop(context);
                                    }
                                  },
                                  color: Colors.teal,
                                  child: Text(
                                    'Update',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            }
            );
  }
}
