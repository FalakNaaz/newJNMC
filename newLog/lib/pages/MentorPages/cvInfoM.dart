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
            style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(273, 146, 158, 1), fontSize: 16),
            children: <TextSpan>[
              TextSpan(text: text, style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black, fontSize: 16)),
            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<User>(context);
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
            return FutureBuilder<String>(
                future: printImage(), // async work
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return SafeArea(
                    child: userData.name == '' ? Align(
                      alignment: Alignment.center,
                      child: Text(
                        'No information available! Edit to update!',
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
                          ]),
                    ),
                  );
                });
          } else {
            return Container();
          }
        });
  }
}
