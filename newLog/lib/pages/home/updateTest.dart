import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';

class UpdateTest extends StatefulWidget {
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

    final user = Provider.of<User>(context) ;

    return StreamBuilder<TestData>(
        stream: DatabaseService(uid: user.uid).testData,
        builder: (context, snapshot) {
          if(snapshot.hasData)
          {
            TestData testData = snapshot.data;
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Update your Test info',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration(' Date of Test: '),
                      maxLines: 4,
                      initialValue: testData.date,
                      validator: (val) => val.isEmpty ? 'Please enter the date of test' : null,
                      onChanged: (val) => setState(() => _currentdate = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Result'),
                      maxLines: 4,
                      initialValue: testData.result,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter result'
                          : null,
                      onChanged: (val) => setState(() => _currentresult = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Self Assessment:How did i perform? Grade yourself from good, satisfactory, poor. '),
                      maxLines: 4,
                      initialValue: testData.assessment,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter assessment:'
                          : null,
                      onChanged: (val) => setState(() => _currentassessment = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Reflection: Reasons for level of performance.'),
                      maxLines: 4,
                      initialValue: testData.goals,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter future goals:'
                          : null,
                      onChanged: (val) => setState(() => _currentgoals = val),
                    ),
                    SizedBox(height: 20.0,),
                    RaisedButton(
                      color: Color.fromRGBO(273, 146, 158, 1),
                      child: Text(
                        'update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        // if (_formKey.currentState.validate())
                        {
                          await DatabaseService(uid: user.uid).updateTestData(
                            _currentdate ?? testData.date,
                            _currentresult ?? testData.result,
                            _currentassessment ?? testData.assessment,
                            _currentgoals ?? testData.goals,
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
          }
          else
          {
            return Container();
          }


        }
    );
  }
}