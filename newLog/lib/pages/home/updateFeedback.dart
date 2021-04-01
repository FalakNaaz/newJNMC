import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';

class UpdateFeedback extends StatefulWidget {
  @override
  _UpdateFeedbackState createState() => _UpdateFeedbackState();
}

class _UpdateFeedbackState extends State<UpdateFeedback> {
  final _formKey = GlobalKey<FormState>();

  //form values
  String _currentpatient1;
  String _currentnursing1;
  String _currentunder1;
  String _currentinter1;
  String _currentsenior1;
  String _currentjunior1;
 String _currentpatient2;
  String _currentnursing2;
  String _currentunder2;
  String _currentinter2;
  String _currentsenior2;
  String _currentjunior2;
 String _currentpatient3;
  String _currentnursing3;
  String _currentunder3;
  String _currentinter3;
  String _currentsenior3;
  String _currentjunior3;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    const rowSpacer = TableRow(children: [
      SizedBox(
        height: 12,
      ),
      SizedBox(
        height: 12,
      ),
      SizedBox(
        height: 12,
      ),
      SizedBox(
        height: 12,
      )
    ]);
    return StreamBuilder<Feedback1>(
        stream: DatabaseService(uid: user?.uid).feedbackData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Feedback1 feedbackData = snapshot.data;
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Update your Feedback info',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(6),
                          1: FlexColumnWidth(3),
                          2: FlexColumnWidth(3),
                          3: FlexColumnWidth(3),
                        },
                        // textDirection: TextDirection.rtl,
                        //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                        // border:TableBorder.all(width: 2.0,color: Colors.red),
                        children: [
                          TableRow(
                              children: [
                                Text("",textScaleFactor: 1.2,),
                                Text('Year 1',textScaleFactor: 1.2,),
                                Text('Year 2',textScaleFactor: 1.2),
                                Text('Year 3',textScaleFactor: 1.2),
                                //Text("University",textScaleFactor: 1.2),
                              ]
                          ),
                          rowSpacer,
                          TableRow(children: [
                            Text(
                              "Patient [patient complaints , if any]",
                              textScaleFactor: 1.2,
                            ),
                            DropdownButton<String>(
                              value: _currentpatient1 ??
                                  feedbackData.patients1,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentpatient1 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                             DropdownButton<String>(
                              value: _currentpatient2 ??
                                  feedbackData.patients2,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentpatient2 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                             DropdownButton<String>(
                              value: _currentpatient3 ??
                                  feedbackData.patients3,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentpatient3 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),

                            ]),
                          rowSpacer,
                          TableRow(children: [
                            Text(
                              "Nursing and other staff",
                              textScaleFactor: 1.2,
                            ),
                            DropdownButton<String>(
                              value: _currentnursing1 ??
                                  feedbackData.nursing1,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentnursing1 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),     DropdownButton<String>(
                              value: _currentnursing2 ??
                                  feedbackData.nursing2,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentnursing2 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),     DropdownButton<String>(
                              value: _currentnursing3 ??
                                  feedbackData.nursing3,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentnursing3 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),

                          ]),
                          rowSpacer,
                          TableRow(children: [
                            Text(
                              "Undergraduates",
                              textScaleFactor: 1.2,
                            ),
                            DropdownButton<String>(
                              value: _currentunder1 ??
                                  feedbackData.under1,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentunder1 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ), DropdownButton<String>(
                              value: _currentunder2 ??
                                  feedbackData.under2,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentunder2 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ), DropdownButton<String>(
                              value: _currentunder3 ??
                                  feedbackData.under3,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentunder3 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),

                          ]),
                          rowSpacer,TableRow(children: [
                            Text(
                              "Interns",
                              textScaleFactor: 1.2,
                            ),
                            DropdownButton<String>(
                              value: _currentinter1 ??
                                  feedbackData.inter1,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentinter1 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ), DropdownButton<String>(
                              value: _currentinter2 ??
                                  feedbackData.inter2,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentinter2 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ), DropdownButton<String>(
                              value: _currentinter3 ??
                                  feedbackData.inter3,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentinter3 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),

                          ]),
                          rowSpacer,TableRow(children: [
                            Text(
                              "Seniors",
                              textScaleFactor: 1.2,
                            ),
                            DropdownButton<String>(
                              value: _currentsenior1 ??
                                  feedbackData.senior1,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentsenior1 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),DropdownButton<String>(
                              value: _currentsenior2 ??
                                  feedbackData.senior2,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentsenior2 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),DropdownButton<String>(
                              value: _currentsenior3 ??
                                  feedbackData.senior3,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentsenior3 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),

                          ]),
                          rowSpacer,TableRow(children: [
                            Text(
                              "Juniors",
                              textScaleFactor: 1.2,
                            ),
                            DropdownButton<String>(
                              value: _currentjunior1??
                                  feedbackData.junior1,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentjunior1 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            DropdownButton<String>(
                              value: _currentjunior2??
                                  feedbackData.junior2,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentjunior2 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            DropdownButton<String>(
                              value: _currentjunior3??
                                  feedbackData.junior3,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 28,
                              elevation: 16,
                              iconEnabledColor: Colors.teal,
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.teal,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  this._currentjunior3 = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),

                          ]),
                          rowSpacer,
                        ],
                      ),
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
                          await DatabaseService(uid: user.uid).updateFeedback1(
                           _currentpatient1 ?? feedbackData.patients1,
                            _currentnursing1 ?? feedbackData.nursing1,
                            _currentunder1 ?? feedbackData.under1,
                            _currentinter1 ?? feedbackData.inter1,
                            _currentsenior1?? feedbackData.senior1,
                            _currentjunior1 ?? feedbackData.junior1,
                            _currentpatient2 ?? feedbackData.patients2,
                            _currentnursing2 ?? feedbackData.nursing2,
                            _currentunder2 ?? feedbackData.under2,
                            _currentinter2 ?? feedbackData.inter2,
                            _currentsenior2?? feedbackData.senior2,
                            _currentjunior2 ?? feedbackData.junior2,
                            _currentpatient3 ?? feedbackData.patients3,
                            _currentnursing3 ?? feedbackData.nursing3,
                            _currentunder3 ?? feedbackData.under3,
                            _currentinter3 ?? feedbackData.inter3,
                            _currentsenior3?? feedbackData.senior3,
                            _currentjunior3 ?? feedbackData.junior3,
                            feedbackData.isApproved,
                            feedbackData.mentorName,
                            feedbackData.mentorMail,
                            feedbackData.approvalReady,
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
