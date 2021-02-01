import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class CaseRoutineInfo extends StatefulWidget {
  final int rotationNo;
  CaseRoutineInfo({this.rotationNo});
  @override
  _CaseRoutineInfoState createState() => _CaseRoutineInfoState();
}

class _CaseRoutineInfoState extends State<CaseRoutineInfo> {
  Widget _createTextArea(String label, String text) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Text(
        '$label $text',
        //textAlign: TextAlign.right,
        style: TextStyle(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final Publications = Provider.of<List<Publications_model>>(context) ?? [];
    final caseroutine = Provider.of<User>(context);

    // return ListView.builder(
    //   itemCount: Publications.length,
    //   itemBuilder: (context, index) {
    //     return Publications_Tile(Publications_item: Publications[index]);
    //   },
    // );
    return StreamBuilder<List<Learning>>(
        stream: DatabaseService(uid: caseroutine.uid).listOfLearningData,
        builder: (context, snapshot) {
          //print(snapshot.hasData);
          if (snapshot.hasData) {
            List<Learning> caseroutineData = snapshot.data;
            return SafeArea(
              child: (caseroutineData[widget.rotationNo].pdate != '') ? Padding(
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
                            child: Text('Rotation ${widget.rotationNo+1}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 25.0,
                                color:  Color.fromRGBO(273, 146, 158, 1),
                                decoration: TextDecoration.underline,
                              ),),
                          ),
                        ),
                        // Text('Falak'),
                        // Text('Naz'),
                        //_createTextArea('Name', userData.name),
                        _createTextArea('Posting/Rotation dd/mm/year: ', caseroutineData[widget.rotationNo].pdate),
                        _createTextArea('Preceptor\'s Name: ', caseroutineData[widget.rotationNo].pname),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          child: Text('Three things I want to learn  in this rotation: '),
                        ),
                        _createTextArea('1. ', caseroutineData[widget.rotationNo].l1),
                        _createTextArea('2.', caseroutineData[widget.rotationNo].l2),
                        _createTextArea('3.', caseroutineData[widget.rotationNo].l3),
                        _createTextArea('My strategy for accomplishing above goals:', caseroutineData[widget.rotationNo].strategy),
                      ]),
                ),
              )
              :
              Align(
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