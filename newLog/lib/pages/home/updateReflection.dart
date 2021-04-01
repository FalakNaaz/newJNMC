import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';
enum SingingCharacter { Reporter, Interpreter, Manager, Educator }
class UpdateReflection extends StatefulWidget {
  final int rotationNo;

  UpdateReflection({this.rotationNo});

  @override
  _UpdateReflectionState createState() => _UpdateReflectionState();
}

class _UpdateReflectionState extends State<UpdateReflection> {
  final _formKey = GlobalKey<FormState>();

  //form values
  String _currentLevel;
  String _currentMKnowledge;
  String _currentPCare;
  String _currentProfessionalism;
  String _currentICommunication;
  String _currentPImprovement;
  String _currentSImprovement;
  SingingCharacter _character = SingingCharacter.Reporter;
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<List<ReflectionData1>>(
        stream: DatabaseService(uid: user.uid).listOfReflectionData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ReflectionData1> reflectionData = snapshot.data;
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Update your reflection data',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'I am at the following level of clinical training of RIME Model: ',
                      style: TextStyle(color:Colors.teal,fontSize: 16,),
                    ),
                    RadioListTile<SingingCharacter>(
                      title: const Text('Reporter'),
                      value: SingingCharacter.Reporter,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                   RadioListTile<SingingCharacter>(
                      title: const Text('Interpreter'),
                      value: SingingCharacter.Interpreter,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                   RadioListTile<SingingCharacter>(
                      title: const Text('Manager'),
                      value: SingingCharacter.Manager,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                   RadioListTile<SingingCharacter>(
                      title: const Text('Educator'),
                      value: SingingCharacter.Educator,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),


                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'My level in core competencies(rate from 1 to 5):',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      // textBaseline: TextBaseline.ideographic,
                      children: <Widget>[
                        Text(
                          'Medical Knowledge:   ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        DropdownButton<String>(
                          value:  _currentMKnowledge ?? reflectionData[widget.rotationNo].mKnowledge,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(color:Colors.teal,),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentMKnowledge = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4','5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      // textBaseline: TextBaseline.ideographic,
                      children: <Widget>[
                        Text(
                          'Patient Care:  ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        DropdownButton<String>(
                          value:  _currentPCare ??  reflectionData[widget.rotationNo].pCare,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(color:Colors.teal,),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentPCare = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4','5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      // textBaseline: TextBaseline.ideographic,
                      children: <Widget>[
                        Text(
                          'Professionalism:    ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        DropdownButton<String>(
                          value:  _currentProfessionalism ??  reflectionData[widget.rotationNo].professionalism,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(color:Colors.teal,),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentProfessionalism = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4','5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      // textBaseline: TextBaseline.ideographic,
                      children: <Widget>[
                        Text(
                          'Interpersonal Communication:    ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        DropdownButton<String>(
                          value:  _currentICommunication ??  reflectionData[widget.rotationNo].iCommunication,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(color:Colors.teal,),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentICommunication = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4','5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Practice-based Learning: personal ',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'improvement:    ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        DropdownButton<String>(
                          value:  _currentPImprovement ??  reflectionData[widget.rotationNo].pImprovement,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(color:Colors.teal,),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentPImprovement = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4','5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'System-based Practice: systems ',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      // textBaseline: TextBaseline.ideographic,
                      children: <Widget>[
                        Text(
                          'improvement:   ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        DropdownButton<String>(
                          value:  _currentSImprovement ??  reflectionData[widget.rotationNo].sImprovement,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(color:Colors.teal,),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentSImprovement = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4','5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: RaisedButton(
                        color: Colors.teal,
                        child: Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                           if (_formKey.currentState.validate())
                          {
                            await DatabaseService(uid: user.uid)
                                .updateReflectionData(
                              widget.rotationNo,
                              _character.toString().split('.').last ??
                                  reflectionData[widget.rotationNo].level,
                              _currentMKnowledge ??
                                  reflectionData[widget.rotationNo].mKnowledge,
                              _currentPCare ??
                                  reflectionData[widget.rotationNo].pCare,
                              _currentProfessionalism ??
                                  reflectionData[widget.rotationNo]
                                      .professionalism,
                              _currentICommunication ??
                                  reflectionData[widget.rotationNo]
                                      .iCommunication,
                              _currentPImprovement ??
                                  reflectionData[widget.rotationNo].pImprovement,
                              _currentSImprovement ??
                                  reflectionData[widget.rotationNo].sImprovement,
                            );
                            Navigator.pop(context);
                          }
                        },
                      ),
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
