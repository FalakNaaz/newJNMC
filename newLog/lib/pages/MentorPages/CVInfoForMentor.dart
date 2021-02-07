import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
class CVInfoForMentor extends StatefulWidget {
  final String uid;
  CVInfoForMentor({this.uid});
  @override
  _CVInfoForMentorState createState() => _CVInfoForMentorState();
}

class _CVInfoForMentorState extends State<CVInfoForMentor> {
  Widget _createTextArea(String label, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Text('$label $text',
        //textAlign: TextAlign.right,
        style: TextStyle(

        ),),

    );
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: DatabaseService(uid: widget.uid).userData,
        builder: (context, snapshot){
          if(snapshot.hasData){
            UserData userData = snapshot.data;
            print("HI");
            print(userData.uid);
            print(userData.email);
            print(userData.mob);
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.fromLTRB(
                            190.0, 10.0, 10.0, 0.0),
                        child: Text('CV',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,

                          ),),
                      ),

                      // Text('Falak'),
                      // Text('Naz'),
                      //_createTextArea('Name', userData.name),
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              _createTextArea('Name:', userData.name),
                              _createTextArea(
                                  'Date of Birth(DD/MM//YY) : ', userData.dob),
                            ],
                          ),
                          // if(snapshot.connectionState == ConnectionState.waiting )
                          //   Text('Loading...'),
                          // if(snapshot.connectionState == ConnectionState.done)
                          //   Container(
                          //     padding: EdgeInsets.fromLTRB(75, 0, 0, 0),
                          //     height: 100,
                          //     width: 150,
                          //     //child: Text('falkk  ${snapshot.data}'),
                          //     child: Image.network(snapshot.data),
                          //   ),
                        ],
                      ),
                      _createTextArea('Permanent Address : ', userData.p_add),
                      _createTextArea('Local Address : ', userData.l_add),
                      _createTextArea('Mobile Number : ', userData.mob),
                      _createTextArea('Email : ', userData.email),
                      _createTextArea(
                          'MBBS Degree Detail(Year of Addmission, Year of Passing, College/University) : ',
                          userData.degreeDetail),
                      _createTextArea(
                          'MBBS Record(1st Prof, 2nd Prof, Mid prof and Final Prof Percetages, medals or any distinctions)',
                          userData.degreeRecord),
                      _createTextArea(
                          'Internship: Month / Year of beginning, Month / Year of completion, College & Hospital: ',
                          userData.iDetail),
                      _createTextArea('Other Experience: ', userData.other),
                      _createTextArea(
                          'Medical Council Registration No. & Date : ',
                          userData.regNo),
                      _createTextArea('Month & Year of Joining the Course: ',
                          userData.joiningDate),
                      _createTextArea(
                          'Month & Year of appearing for the Degree / Diploma examination:',
                          userData.appearDate),
                      _createTextArea(
                          'Special Interest / Hobbies and Extra Curricular  Activities: ',
                          userData.hobby),

                    ]),
              ),

            );
          } else {
            return Container();
          }
    });
  }
}
