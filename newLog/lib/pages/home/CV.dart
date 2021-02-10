import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';
// import 'package:image/src/image.dart';
// import 'package:flutter/src/widgets/image.dart';

class CV_Info extends StatefulWidget {
  @override
  _CV_InfoState createState() => _CV_InfoState();
}

class _CV_InfoState extends State<CV_Info> {

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
    //final CV = Provider.of<List<CV_model>>(context) ?? [];
    final user = Provider.of<User>(context);

    // return ListView.builder(
    //   itemCount: CV.length,
    //   itemBuilder: (context, index) {
    //     return CV_Tile(CV_item: CV[index]);
    //   },
    // );
    var url;

    Future<String> printImage() async{
      final ref = FirebaseStorage.instance.ref().child('images/${user.uid}.jpeg');
      // no need of the file extension, the name will do fine.
      url = await ref.getDownloadURL();
      print(url);
      /*setState(() {

      });
      Image image = Image.network(url);
      Image thumbnail = copyResize(image, width: 120);*/
      return url;
    }
    // void printtt()
    // {
    //   print('falak');
    // }
    printImage();
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          //print(url);
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return FutureBuilder<String>(
              future: printImage(), // async work
              builder: (BuildContext context, AsyncSnapshot<String> snapshot){
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
                              if(snapshot.connectionState == ConnectionState.waiting )
                                Text('Loading...'),
                              if(snapshot.connectionState == ConnectionState.done)
                                Container(
                                  padding: EdgeInsets.fromLTRB(75, 0, 0, 0),
                                  height: 100,
                                  width: 150,
                                  //child: Text('falkk  ${snapshot.data}'),
                                  child: Image.network(snapshot.data),
                                ),
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
              }

            );
          }
          else {
            return Container();
          }
        }
    );
  }
}