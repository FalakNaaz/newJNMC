import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class ReflectionInfoM extends StatefulWidget {
  final String uid;
  final int rotationNo;

  ReflectionInfoM({this.uid,this.rotationNo});

  @override
  _ReflectionInfoMState createState() => _ReflectionInfoMState();
}

class _ReflectionInfoMState extends State<ReflectionInfoM> {
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
            style: TextStyle(color: Colors.teal,),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    User user  = Provider.of<User>(context);
    return StreamBuilder<List<ReflectionData1>>(
        stream: DatabaseService(uid: widget.uid).listOfReflectionData,
        builder: (context, snapshot) {
          print('reflection data ${snapshot.hasData}');
          if (snapshot.hasData) {
            List<ReflectionData1> listOfReflectionData = snapshot.data;
            return StreamBuilder<MentorData>(
              stream: DatabaseService(uid: user.uid).mentorData,
              builder: (context, snapshot2) {
                if(snapshot2.hasData){
                  MentorData mentorData = snapshot2.data;
                  return SafeArea(
                    child: (listOfReflectionData[widget.rotationNo].level != '')
                        ? SingleChildScrollView(
                      child: Padding(
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
                                        color: Colors.teal,
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
                                            color: Colors.teal, fontSize: 15),
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
                                (listOfReflectionData[widget.rotationNo].isApproved) ?
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
                                          Text('Mentor Name: ${listOfReflectionData[widget.rotationNo].mentorName}'),
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
                                                    TextSpan(text:listOfReflectionData[widget.rotationNo].mentorMail,style: TextStyle(color: Colors.teal) )
                                                  ]


                                              )
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.0,),
                                      Center(
                                        child: RaisedButton(
                                            color: Colors.teal,
                                            child: Text(
                                              'Un-approve',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            onPressed: ()async {
                                              await DatabaseService(uid: widget.uid).updateIsApprovedReflection(widget.rotationNo.toString(),false, '', '');
                                              await DatabaseService(uid: widget.uid).updateApprovalReadyReflection(widget.rotationNo.toString(),false);
                                              setState(() {});
                                            }
                                        ),
                                      )

                                    ],
                                  ),
                                ):
                                (listOfReflectionData[widget.rotationNo].approvalReady) ?
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 100.0,),
                                      RaisedButton(
                                          color: Colors.teal,
                                          child: Text(
                                            'Approve',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          onPressed: ()async {
                                            await DatabaseService(uid: widget.uid).updateIsApprovedReflection(widget.rotationNo.toString(),true, mentorData.name, mentorData.email);
                                            setState(() {});
                                          }
                                      ),
                                      SizedBox(width: 20.0,),
                                      RaisedButton(
                                          color: Colors.teal,
                                          child: Text(
                                            'Decline',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          onPressed: ()async {
                                            await DatabaseService(uid: widget.uid).updateApprovalReadyReflection(widget.rotationNo.toString(),false, );
                                            setState(() {});
                                          }
                                      ),
                                    ],
                                  ),
                                ) : Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.info_outline),
                                        SizedBox(width: 10.0,),
                                        Text('The resident has not yet applied for approval'),
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                      ),
                    ),
                        )
                        : Align(
                      alignment: Alignment.center,
                      child: Text(
                        'No information available Yet!',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.grey),
                      ),
                    ),
                  );
                } else{
                  return Container();
                }
              }
            );
          } else {
            return Container();
          }
        });
  }
}
