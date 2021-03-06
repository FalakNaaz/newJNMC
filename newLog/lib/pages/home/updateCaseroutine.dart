import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';

class UpdateCaseroutine extends StatefulWidget {
  final int rotationNo;
  UpdateCaseroutine({this.rotationNo});
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

    return StreamBuilder<List<Learning>>(
        stream: DatabaseService(uid: user.uid).listOfLearningData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Learning> caseroutineData = snapshot.data;
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Update your Case Routine Info',
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
                      initialValue: caseroutineData[widget.rotationNo].pdate,
                      validator: (val) =>
                      val.isEmpty ? 'Please enter Date detail' : null,
                      onChanged: (val) => setState(() => _currentpdate = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Preceptor\'s Name' ),
                      maxLines: 4,
                      initialValue: caseroutineData[widget.rotationNo].pname,
                      validator: (val) =>
                      val.isEmpty ? 'Please enter Name' : null,
                      onChanged: (val) => setState(() => _currentpname = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('3 things I want to learn in this rotation:',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16.0,
                    ),),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('1st thing'),
                      maxLines: 4,
                      initialValue: caseroutineData[widget.rotationNo].l1,
                      validator: (val) =>
                      val.isEmpty ? 'Please enter l1' : null,
                      onChanged: (val) => setState(() => _currentl1 = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('2nd thing '),
                      maxLines: 4,
                      initialValue: caseroutineData[widget.rotationNo].l2,
                      validator: (val) =>
                      val.isEmpty ? 'Please enter l2 ' : null,
                      onChanged: (val) => setState(() => _currentl2 = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('3rd thing'),
                      maxLines: 4,
                      initialValue: caseroutineData[widget.rotationNo].l3,
                      validator: (val) => val.isEmpty ? 'Any other l3' : null,
                      onChanged: (val) => setState(() => _currentl3 = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Strategy'),
                      maxLines: 4,
                      initialValue: caseroutineData[widget.rotationNo].strategy,
                      validator: (val) => val.isEmpty ? ' Strategy' : null,
                      onChanged: (val) =>
                          setState(() => _currentstrategy = val),
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
                              .updateCaseroutineData(
                            widget.rotationNo,
                            _currentpdate ?? caseroutineData[widget.rotationNo].pdate,
                            _currentpname ?? caseroutineData[widget.rotationNo].pname,
                            _currentl1 ?? caseroutineData[widget.rotationNo].l1,
                            _currentl2 ?? caseroutineData[widget.rotationNo].l2,
                            _currentl3 ?? caseroutineData[widget.rotationNo].l3,
                            _currentstrategy ?? caseroutineData[widget.rotationNo].strategy,
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
