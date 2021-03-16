import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class UpdateThesis extends StatefulWidget {
  int tabNo;

  UpdateThesis({this.tabNo});

  @override
  _UpdateThesisState createState() => _UpdateThesisState();
}

class _UpdateThesisState extends State<UpdateThesis> {
  String _currentconsult;
  String _currentcollect;
  String _currentpre;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<List<ThesisData>>(
        stream: DatabaseService(uid: user.uid).listOfThesisData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ThesisData> listOfThesisData = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                  // textBaseline: TextBaseline.ideographic,
                  children: <Widget>[
                    Text(
                      'Periodic Consultation with Mentor :',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    new DropdownButton<String>(
                      //value: 'A',
                      value: _currentconsult ?? listOfThesisData[widget.tabNo].consult,
                      items:
                          <String>['1', '2', '3', '4', '5'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this._currentconsult = newValueSelected;
                        });
                      },
                      dropdownColor: Colors.teal,
                    ),
                  ],
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.baseline,
                  //textBaseline: TextBaseline.ideographic,
                  children: <Widget>[
                    Text(
                      'Regular Collection of Data               :',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    new DropdownButton<String>(
                      value: _currentcollect ?? listOfThesisData[widget.tabNo].collect,
                      items:
                          <String>['1', '2', '3', '4', '5'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this._currentcollect = newValueSelected;
                        });
                      },
                      dropdownColor: Colors.teal,
                    ),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                  // textBaseline: TextBaseline.ideographic,
                  children: <Widget>[
                    Text(
                      'Departmental Presentation             :',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    new DropdownButton<String>(
                      items:
                          <String>['1', '2', '3', '4', '5'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState(() {
                          _currentpre = newValueSelected;
                        });
                      },
                      //value: 'A',
                      value: _currentpre ?? listOfThesisData[widget.tabNo].pre,
                      dropdownColor: Colors.teal,
                    ),
                  ],
                ),
                Center(
                  child: RaisedButton(
                    color: Colors.teal,
                    child: Text(
                      'update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      // if (_formKey.currentState.validate())
                      {

                        await DatabaseService(uid: user.uid).updateThesis(
                          (widget.tabNo).toString(),
                          _currentconsult ?? listOfThesisData[widget.tabNo].consult,
                          _currentcollect ?? listOfThesisData[widget.tabNo].collect,
                          _currentpre ?? listOfThesisData[widget.tabNo].pre,
                        );
                        Navigator.pop(context);
                      }
                      // print(_currentName);
                      // print(_currentEnrl);
                      // print(_currentFacultyno);
                    },
                  ),
                )
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
