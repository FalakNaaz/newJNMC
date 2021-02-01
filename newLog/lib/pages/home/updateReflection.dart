import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';
enum SingingCharacter { reporter, interpreter, manager, educator }
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
  SingingCharacter _character = SingingCharacter.reporter;
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
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Update your reflection data',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color.fromRGBO(273, 146, 158, 1),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Column(
                      children: <Widget>[
                        ListTile(
                          title: const Text('Reporter'),
                          leading: Radio(
                            value: SingingCharacter.reporter,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Interpreter'),
                          leading: Radio(
                            value: SingingCharacter.interpreter,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Manager'),
                          leading: Radio(
                            value: SingingCharacter.manager,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Educator'),
                          leading: Radio(
                            value: SingingCharacter.educator,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'My level in core competencies(rate from 1 to 5):',
                      style: TextStyle(
                        color: Color.fromRGBO(273, 146, 158, 1),
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Medical Care'),
                      maxLines: 4,
                      initialValue:
                          reflectionData[widget.rotationNo].mKnowledge,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter Name' : null,
                      onChanged: (val) =>
                          setState(() => _currentMKnowledge = val),
                    ),
                   /* Row(
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
                          value: _currentMKnowledge ?? reflectionData[widget.rotationNo].mKnowledge,
                          items:
                          <String>['A', 'B', 'C', 'D', 'E'].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValueSelected) {
                            setState(() {
                              this._currentMKnowledge = newValueSelected;
                            });
                          },
                          dropdownColor: Color.fromRGBO(273, 146, 158, 1),
                        ),
                      ],
                    ),*/
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Patient Care'),
                      maxLines: 4,
                      initialValue: reflectionData[widget.rotationNo].pCare,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter l1' : null,
                      onChanged: (val) => setState(() => _currentPCare = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Professionalism'),
                      maxLines: 4,
                      initialValue:
                          reflectionData[widget.rotationNo].professionalism,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter l1' : null,
                      onChanged: (val) =>
                          setState(() => _currentProfessionalism = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration('Interpersonal Communication'),
                      maxLines: 4,
                      initialValue:
                          reflectionData[widget.rotationNo].iCommunication,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter l2 ' : null,
                      onChanged: (val) =>
                          setState(() => _currentProfessionalism = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Practice-based learning: personal improvement: '),
                      maxLines: 4,
                      initialValue:
                          reflectionData[widget.rotationNo].pImprovement,
                      validator: (val) => val.isEmpty ? 'Any other l3' : null,
                      onChanged: (val) =>
                          setState(() => _currentICommunication = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'System-based Practice: systems improvement'),
                      maxLines: 4,
                      initialValue:
                          reflectionData[widget.rotationNo].sImprovement,
                      validator: (val) => val.isEmpty ? ' Strategy' : null,
                      onChanged: (val) =>
                          setState(() => _currentPImprovement = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Color.fromRGBO(273, 146, 158, 1),
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        // if (_formKey.currentState.validate())
                        {
                          //print(_currentpdate);
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
