import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';

class UpdateTest extends StatefulWidget {
  int tabNo;

  UpdateTest({this.tabNo});

  @override
  _UpdateTestState createState() => _UpdateTestState();
}

class _UpdateTestState extends State<UpdateTest> {
  final _formKey = GlobalKey<FormState>();

  //form values
  String _currentdate;
  String _currentresult;
  String _currentassessment;
  String _currentgoals;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return StreamBuilder<List<TestData>>(
        stream: DatabaseService(uid: user.uid).listOfTestData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<TestData> listOfTestData = snapshot.data;
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Update your Test info',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(' Date of Test: '),
                      maxLines: 4,
                      initialValue: listOfTestData[widget.tabNo].date,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter the date of test' : null,
                      onChanged: (val) => setState(() => _currentdate = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Result'),
                      maxLines: 4,
                      initialValue: listOfTestData[widget.tabNo].result,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter result' : null,
                      onChanged: (val) => setState(() => _currentresult = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Wrap(children: <Widget>[
                      Text(
                          'Self Assessment:How did i perform? Grade yourself from good, satisfactory, poor. ',
                        style: TextStyle(color: Colors.teal),),
                      DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          child: DropdownButton<String>(
                            value: _currentassessment ??
                                listOfTestData[widget.tabNo].assessment,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 28,
                            elevation: 20,
                            iconEnabledColor: Colors.teal,
                            style: TextStyle(color: Colors.teal),
                            onChanged: (String newValue) {
                              setState(() {
                                _currentassessment = newValue;
                              });
                            },
                            items: <String>['1', '2', '3', '4', '5']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ]),

                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Reflection: Reasons for level of performance.'),
                      maxLines: 4,
                      initialValue: listOfTestData[widget.tabNo].reason,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter future goals:' : null,
                      onChanged: (val) => setState(() => _currentgoals = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Colors.teal,
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        // if (_formKey.currentState.validate())
                        {
                          await DatabaseService(uid: user.uid).updateTest2(
                            (widget.tabNo).toString(),
                            _currentdate ?? listOfTestData[widget.tabNo].date,
                            _currentresult ??
                                listOfTestData[widget.tabNo].result,
                            _currentassessment ??
                                listOfTestData[widget.tabNo].assessment,
                            _currentgoals ??
                                listOfTestData[widget.tabNo].reason,
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
            return Container();
          }
        });
  }
}
