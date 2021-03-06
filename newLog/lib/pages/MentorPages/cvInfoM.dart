import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class CVInfoM extends StatefulWidget {
  final String uid;
  CVInfoM({this.uid});
  @override
  _CVInfoMState createState() => _CVInfoMState();
}

class _CVInfoMState extends State<CVInfoM> {
  Widget _createTextArea(String label, String text) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: RichText(
          text: TextSpan(
            text: '$label: ',
            style: TextStyle(fontWeight: FontWeight.w600,color: Colors.teal, fontSize: 16),
            children: <TextSpan>[
              TextSpan(text: text, style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black, fontSize: 16)),
            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    var url;
    Future<String> printImage() async {
      var isImage = await DatabaseService(uid: widget.uid).getImageVar();
      if (isImage) {
        final ref =
        FirebaseStorage.instance.ref().child('images/${widget.uid}.jpeg');
        url = await ref.getDownloadURL();
      }
      return url;
    }

    printImage();
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: widget.uid).userData,
        builder: (context, snapshot) {
          //print(url);
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return StreamBuilder<MentorData>(
              stream: DatabaseService(uid: user.uid).mentorData,
              builder: (context, snapshot2) {
                if(snapshot2.hasData){
                  MentorData mentorData = snapshot2.data;
                  return FutureBuilder<String>(
                      future: printImage(), // async work
                      builder:
                          (BuildContext context, AsyncSnapshot<String> snapshot) {
                        return SafeArea(
                          child: userData.name == '' ? Align(
                            alignment: Alignment.center,
                            child: Text(
                              'No information available yet!',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, color: Colors.grey),
                            ),
                          ) : SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  if (snapshot.connectionState ==
                                      ConnectionState.done)
                                    if (url != null)
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 50.0,
                                            backgroundImage:
                                            NetworkImage(url),
                                            backgroundColor: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                  _createTextArea('Name:', userData.name),
                                  _createTextArea(
                                      'Date of Birth(DD/MM//YY) : ',
                                      userData.dob),

                                  /* if (snapshot.connectionState ==
                                      ConnectionState.waiting)
                                   CircularProgressIndicator(),*/

                                  _createTextArea(
                                      'Permanent Address : ', userData.p_add),
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
                                  _createTextArea(
                                      'Other Experience: ', userData.other),
                                  _createTextArea(
                                      'Medical Council Registration No. & Date : ',
                                      userData.regNo),
                                  _createTextArea(
                                      'Month & Year of Joining the Course: ',
                                      userData.joiningDate),
                                  _createTextArea(
                                      'Month & Year of appearing for the Degree / Diploma examination:',
                                      userData.appearDate),
                                  _createTextArea(
                                      'Special Interest / Hobbies and Extra Curricular  Activities: ',
                                      userData.hobby),
                                  (userData.isApproved) ?
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
                                            Text('Mentor Name: ${userData.mentorName}'),
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
                                                      TextSpan(text:userData.mentorMail,style: TextStyle(color: Colors.teal) )
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
                                                await DatabaseService(uid: widget.uid).updateIsApprovedCV(false, '', '');
                                                await DatabaseService(uid: widget.uid).updateApprovalReadyCV(false);
                                                setState(() {});
                                              }
                                          ),
                                        )

                                      ],
                                    ),
                                  ):
                                  (userData.approvalReady) ?

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
                                              await DatabaseService(uid: widget.uid).updateIsApprovedCV(true, mentorData.name, mentorData.email);
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
                                              await DatabaseService(uid: widget.uid).updateApprovalReadyCV(false, );
                                              setState(() {});
                                            }
                                        ),
                                      ],
                                    ),
                                  ) : Center(
                                    child: Text('The resident has not yet applied for approval'),
                                  )
                                ]),
                          ),
                        );
                      });
                }else {
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
