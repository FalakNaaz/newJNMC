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
    final caseroutine = Provider.of<User>(context);
    return StreamBuilder<List<Learning>>(
        stream: DatabaseService(uid: caseroutine.uid).listOfLearningData,
        builder: (context, snapshot) {
          //print(snapshot.hasData);
          if (snapshot.hasData) {
            List<Learning> caseroutineData = snapshot.data;
            return SafeArea(
              child: (caseroutineData[widget.rotationNo].pdate != '') ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
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
                                  color:  Colors.teal,
                                  decoration: TextDecoration.underline,
                                ),),
                            ),
                          ),
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

                          (caseroutineData[widget.rotationNo].isApproved) ?
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text('Approved',textScaleFactor: 1.5,),
                                    Icon(Icons.check_circle, color: Colors.green,size: 30,)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text('Mentor Name: ${caseroutineData[widget.rotationNo].mentorName}'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    RichText(
                                        text: TextSpan(
                                            text: 'Mentor Email: ',
                                            style: DefaultTextStyle.of(context).style,
                                            children: <TextSpan>[
                                              TextSpan(text:caseroutineData[widget.rotationNo].mentorMail,style: TextStyle(color: Colors.teal) )
                                            ]


                                        )
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ):
                          (!caseroutineData[widget.rotationNo].approvalReady) ?
                          Center(
                            child: RaisedButton(
                                color: Colors.teal,
                                child: Text(
                                  'Get Approved',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: ()async {await DatabaseService(uid: caseroutine.uid).updateApprovalReadyLearning(widget.rotationNo.toString(),true); }
                            ),
                          ) : Center(
                            child: RaisedButton(
                                color: Colors.teal,
                                child: Text(
                                  'Pending',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: ()async {await DatabaseService(uid: caseroutine.uid).updateApprovalReadyLearning(widget.rotationNo.toString(),false); }
                            ),
                          )
                        ]),
                  ),
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