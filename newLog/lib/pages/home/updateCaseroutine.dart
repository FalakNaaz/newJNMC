import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';

class UpdateCaseroutine extends StatefulWidget {
  @override
  _UpdateCaseroutineState createState() => _UpdateCaseroutineState();
}

class _UpdateCaseroutineState extends State<UpdateCaseroutine> {
  final _formKey = GlobalKey<FormState>();

  //form values
  String _currentpdate;
  String _currentpname;
  String _currentl1;
  String _currentl2;
  String _currentl3;
  String _currentstrategy;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<CaseroutineData>(
        stream: DatabaseService(uid: user.uid).caseroutineData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            CaseroutineData caseroutineData = snapshot.data;
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Update your Case Routine Info',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(' Date '),
                      maxLines: 4,
                      initialValue: caseroutineData.pdate,
                      validator: (val) =>
                      val.isEmpty ? 'Please enter Date detail' : null,
                      onChanged: (val) => setState(() => _currentpdate = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Name:'),
                      maxLines: 4,
                      initialValue: caseroutineData.pname,
                      validator: (val) =>
                      val.isEmpty ? 'Please enter Name' : null,
                      onChanged: (val) => setState(() => _currentpname = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Learn 1'),
                      maxLines: 4,
                      initialValue: caseroutineData.l1,
                      validator: (val) =>
                      val.isEmpty ? 'Please enter l1' : null,
                      onChanged: (val) => setState(() => _currentl1 = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('L2 '),
                      maxLines: 4,
                      initialValue: caseroutineData.l2,
                      validator: (val) =>
                      val.isEmpty ? 'Please enter l2 ' : null,
                      onChanged: (val) => setState(() => _currentl2 = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(' L3 '),
                      maxLines: 4,
                      initialValue: caseroutineData.l3,
                      validator: (val) => val.isEmpty ? 'Any other l3' : null,
                      onChanged: (val) => setState(() => _currentl3 = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(' Strategy: '),
                      maxLines: 4,
                      initialValue: caseroutineData.l3,
                      validator: (val) => val.isEmpty ? ' Strategy' : null,
                      onChanged: (val) =>
                          setState(() => _currentstrategy = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Color.fromRGBO(273, 146, 158, 1),
                      child: Text(
                        'update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        // if (_formKey.currentState.validate())
                        {
                          await DatabaseService(uid: user.uid)
                              .updateCaseroutineData(
                            _currentpdate ?? caseroutineData.pdate,
                            _currentpname ?? caseroutineData.pname,
                            _currentl1 ?? caseroutineData.l1,
                            _currentl2 ?? caseroutineData.l2,
                            _currentl3 ?? caseroutineData.l3,
                            _currentstrategy ?? caseroutineData.strategy,
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
