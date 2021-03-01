import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class ReflectionInfo extends StatefulWidget {
  final int rotationNo;

  ReflectionInfo({this.rotationNo});

  @override
  _ReflectionInfoState createState() => _ReflectionInfoState();
}

class _ReflectionInfoState extends State<ReflectionInfo> {
  Widget _createTextArea(String label, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            //textAlign: TextAlign.right,
            style: TextStyle(),
          ),
          Text(
            text,
            style: TextStyle(color: Color.fromRGBO(273, 146, 158, 1),),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<List<ReflectionData1>>(
        stream: DatabaseService(uid: user.uid).listOfReflectionData,
        builder: (context, snapshot) {
          print('reflection data ${snapshot.hasData}');
          if (snapshot.hasData) {
            List<ReflectionData1> listOfReflectionData = snapshot.data;
            return SafeArea(
              child: (listOfReflectionData[widget.rotationNo].level != '')
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Card(
                        color: Colors.white,
                        shadowColor: Colors.blueGrey,
                        elevation: 10.0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    'Rotation ${widget.rotationNo + 1}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25.0,
                                      color: Color.fromRGBO(273, 146, 158, 1),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              //_createTextArea('I am at the following level of clinical training of RIME model: ', listOfReflectionData[widget.rotationNo].level),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                child: Text(
                                  'I am at the following level of clinical training ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'of RIME model: ',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                    Text(
                                      listOfReflectionData[widget.rotationNo].level,
                                      style: TextStyle(
                                          color: Color.fromRGBO(273, 146, 158, 1), fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 20.0),
                                child: Text(
                                    'My level in core competencies(rated from 1 to 5): '),
                              ),
                              _createTextArea(
                                  'Medical Care: ',
                                  listOfReflectionData[widget.rotationNo]
                                      .mKnowledge),
                              _createTextArea(
                                  'Patient care: ',
                                  listOfReflectionData[widget.rotationNo]
                                      .pCare),

                              _createTextArea(
                                  'Professionalism: ',
                                  listOfReflectionData[widget.rotationNo]
                                      .professionalism),
                              _createTextArea(
                                  'Interpersonal Communication: ',
                                  listOfReflectionData[widget.rotationNo]
                                      .iCommunication),
                              _createTextArea(
                                  'Practice-based learning: personal improvement: ',
                                  listOfReflectionData[widget.rotationNo]
                                      .pImprovement),
                              _createTextArea(
                                  'System-based Practice: systems improvement: ',
                                  listOfReflectionData[widget.rotationNo]
                                      .sImprovement),
                            ]),
                      ),
                    )
                  : Align(
                      alignment: Alignment.center,
                      child: Text(
                        'No information available! Edit to Update',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.grey),
                      ),
                    ),
            );
          } else {
            return Container();
          }
        });
  }
}
