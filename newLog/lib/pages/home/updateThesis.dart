import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';

class UpdateThesis extends StatefulWidget {
  @override
  _UpdateThesisState createState() => _UpdateThesisState();
}

class _UpdateThesisState extends State<UpdateThesis> {

  String _currentconsult;
  String _currentcollect;
  String _currentpre;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context) ;

    return StreamBuilder<ThesisData>(
        stream: DatabaseService(uid: user.uid).thesisData,
        builder: (context, snapshot) {

          if(snapshot.hasData)
          {
            ThesisData thesisData = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                  // textBaseline: TextBaseline.ideographic,
                  children: <Widget>[
                    Text('Periodic Consultation with Mentor :',
                      style: TextStyle(color: Colors.black, fontSize: 20),),
                    new DropdownButton<String>(
                      //value: 'A',
                      value:  _currentconsult ?? thesisData.consult ,
                      items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState((){
                          this._currentconsult = newValueSelected;
                        });
                      },
                      dropdownColor: Color.fromRGBO(273, 146, 158, 1),

                    ),

                  ],
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.baseline,
                  //textBaseline: TextBaseline.ideographic,
                  children: <Widget>[
                    Text('Regular Collection of Data               :',
                      style: TextStyle(color: Colors.black, fontSize: 20),),
                    new DropdownButton<String>(
                      value: _currentcollect?? thesisData.collect ,
                      items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState((){
                          this._currentcollect = newValueSelected;
                        });
                      },

                      dropdownColor: Color.fromRGBO(273, 146, 158, 1),
                    ),

                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                  // textBaseline: TextBaseline.ideographic,
                  children: <Widget>[
                    Text('Departmental Presentation             :',
                      style: TextStyle(color: Colors.black, fontSize: 20),),
                    new DropdownButton<String>(
                      items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState((){
                          _currentpre = newValueSelected;
                        });
                      },
                      //value: 'A',
                      value: _currentpre ??  thesisData.pre,
                      dropdownColor: Color.fromRGBO(273, 146, 158, 1),
                    ),

                  ],
                ),
                Center(
                  child: RaisedButton(
                    color: Color.fromRGBO(273, 146, 158, 1),
                    child: Text(
                      'update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      // if (_formKey.currentState.validate())
                      {
                        await DatabaseService(uid: user.uid).updateThesisData(
                          _currentconsult?? thesisData.consult,
                          _currentcollect ?? thesisData.collect,
                          _currentpre ?? thesisData.pre,

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
          }
          else
          {
            return Container();
          }


        }
    );
  }
}