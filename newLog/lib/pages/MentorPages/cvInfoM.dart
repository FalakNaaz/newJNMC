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
    const rowSpacer=TableRow( children: [ SizedBox( height: 12, ), SizedBox( height: 12, ), SizedBox( height: 12, ) ]);
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
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Table(

                                      columnWidths: {
                                        0: FlexColumnWidth(3),
                                        1: FlexColumnWidth(1),
                                        2: FlexColumnWidth(3),
                                      },
                                      // textDirection: TextDirection.rtl,
                                      //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                                      // border:TableBorder.all(width: 2.0,color: Colors.red),
                                      children: [

                                        TableRow(
                                            children: [
                                              Text("Name",textScaleFactor: 1.2,),
                                              Text(":",textScaleFactor: 1.2,),
                                              Text(userData.name,textScaleFactor: 1.2),
                                              //Text("University",textScaleFactor: 1.2),
                                            ]
                                        ),
                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("Date of Birth(DD/MM//YY)",textScaleFactor: 1.2,),
                                              Text(":",textScaleFactor: 1.2,),
                                              Text(userData.dob,textScaleFactor: 1.2),
                                            ]
                                        ),
                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("Permanent Address",textScaleFactor: 1.2,),
                                              Text(":",textScaleFactor: 1.2,),
                                              Text(userData.p_add,textScaleFactor: 1.2),

                                            ]
                                        ),
                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("Local Address",textScaleFactor: 1.2,),
                                              Text(":",textScaleFactor: 1.2,),
                                              Text(userData.l_add,textScaleFactor: 1.2),
                                            ]
                                        ),
                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("Mobile Number",textScaleFactor: 1.2,),
                                              Text(":",textScaleFactor: 1.2,),
                                              Text(userData.mob,textScaleFactor: 1.2),
                                            ]
                                        ),
                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("Email",textScaleFactor: 1.2,),
                                              Text(":",textScaleFactor: 1.2,),
                                              Text(userData.email,textScaleFactor: 1.2),
                                            ]
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text("MBBS Degree:",textScaleFactor: 1.2,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(50, 20, 20, 20),
                                    child: Table(

                                      columnWidths: {
                                        0: FlexColumnWidth(3),
                                        1: FlexColumnWidth(1),
                                        2: FlexColumnWidth(3),
                                      },
                                      // textDirection: TextDirection.rtl,
                                      //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                                      // border:TableBorder.all(width: 2.0,color: Colors.red),
                                      children: [

                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("Year of admission",textScaleFactor: 1.2,),
                                              Text(':',textScaleFactor: 1.2,),
                                              Text(userData.degreeDetailYrAdd,textScaleFactor: 1.2),
                                              //Text("AKTU",textScaleFactor: 1.2),
                                            ]
                                        ),
                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("Year of passing",textScaleFactor: 1.2,),
                                              Text(":",textScaleFactor: 1.2,),
                                              Text(userData.degreeDetailYrPass,textScaleFactor: 1.2),

                                            ]
                                        ),
                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("College / University",textScaleFactor: 1.2,),
                                              Text(":",textScaleFactor: 1.2,),
                                              Text(userData.degreeDetailCollege,textScaleFactor: 1.2),
                                            ]
                                        ),

                                      ],
                                    ),
                                  ),
                                  Text("MBBS Record:",textScaleFactor: 1.2,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(50, 20, 20, 20),
                                    child: Table(

                                      columnWidths: {
                                        0: FlexColumnWidth(2),
                                        1: FlexColumnWidth(2),
                                        2: FlexColumnWidth(2),
                                      },
                                      // textDirection: TextDirection.rtl,
                                      //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                                      // border:TableBorder.all(width: 2.0,color: Colors.red),
                                      children: [

                                        TableRow(
                                            children: [
                                              Text("S.No.",textScaleFactor: 1.2,),
                                              Text("Percentage",textScaleFactor: 1.2,),
                                              Text('Medals/Distinction/Awards',textScaleFactor: 1.2),
                                              //Text("University",textScaleFactor: 1.2),
                                            ]
                                        ),
                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("1st Prof",textScaleFactor: 1.2,),
                                              Text(userData.degreeRecord1stProfP,textScaleFactor: 1.2,),
                                              Text(userData.degreeRecord1stProfM,textScaleFactor: 1.2),
                                              //Text("AKTU",textScaleFactor: 1.2),
                                            ]
                                        ), rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("2nd Prof",textScaleFactor: 1.2,),
                                              Text(userData.degreeRecord2ndProfP,textScaleFactor: 1.2,),
                                              Text(userData.degreeRecord2ndProfM,textScaleFactor: 1.2),
                                              //Text("AKTU",textScaleFactor: 1.2),
                                            ]
                                        ),
                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("Mid Prof",textScaleFactor: 1.2,),
                                              Text(userData.degreeRecordMidProfP,textScaleFactor: 1.2,),
                                              Text(userData.degreeRecordMidProfM,textScaleFactor: 1.2),
                                              //Text("AKTU",textScaleFactor: 1.2),
                                            ]
                                        ),
                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("Final Prof",textScaleFactor: 1.2,),
                                              Text(userData.degreeRecordFinalProfP,textScaleFactor: 1.2,),
                                              Text(userData.degreeRecordFinalProfM,textScaleFactor: 1.2),
                                              //Text("AKTU",textScaleFactor: 1.2),
                                            ]
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text("Internship:",textScaleFactor: 1.2,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(50, 20, 20, 20),
                                    child: Table(

                                      columnWidths: {
                                        0: FlexColumnWidth(3),
                                        1: FlexColumnWidth(1),
                                        2: FlexColumnWidth(3),
                                      },
                                      // textDirection: TextDirection.rtl,
                                      //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                                      // border:TableBorder.all(width: 2.0,color: Colors.red),
                                      children: [

                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("Month / Year of beginning",textScaleFactor: 1.2,),
                                              Text(':',textScaleFactor: 1.2,),
                                              Text(userData.internshipYrBeg,textScaleFactor: 1.2),
                                              //Text("AKTU",textScaleFactor: 1.2),
                                            ]
                                        ),
                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("Month / Year of completion",textScaleFactor: 1.2,),
                                              Text(":",textScaleFactor: 1.2,),
                                              Text(userData.internshipYrComp,textScaleFactor: 1.2),

                                            ]
                                        ),
                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("College & Hospital",textScaleFactor: 1.2,),
                                              Text(":",textScaleFactor: 1.2,),
                                              Text(userData.internshipCollege,textScaleFactor: 1.2),
                                            ]
                                        ),

                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Table(

                                      columnWidths: {
                                        0: FlexColumnWidth(3),
                                        1: FlexColumnWidth(1),
                                        2: FlexColumnWidth(3),
                                      },
                                      // textDirection: TextDirection.rtl,
                                      //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                                      // border:TableBorder.all(width: 2.0,color: Colors.red),
                                      children: [

                                        TableRow(
                                            children: [
                                              Text("Medical Council Registration No. & Date",textScaleFactor: 1.2,),
                                              Text(":",textScaleFactor: 1.2,),
                                              Text(userData.regNo,textScaleFactor: 1.2),
                                              //Text("University",textScaleFactor: 1.2),
                                            ]
                                        ),
                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("Month & Year of Joining the Course",textScaleFactor: 1.2,),
                                              Text(":",textScaleFactor: 1.2,),
                                              Text(userData.joiningDate,textScaleFactor: 1.2),
                                              //Text("AKTU",textScaleFactor: 1.2),
                                            ]
                                        ),
                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("Month & Year of appearing for the Degree / Diploma examination",textScaleFactor: 1.2,),
                                              Text(":",textScaleFactor: 1.2,),
                                              Text(userData.appearDate,textScaleFactor: 1.2),

                                            ]
                                        ),
                                        rowSpacer,
                                        TableRow(
                                            children: [
                                              Text("Special Interest / Hobbies and Extra Curricular  Activities",textScaleFactor: 1.2,),
                                              Text(":",textScaleFactor: 1.2,),
                                              Text(userData.hobby,textScaleFactor: 1.2),
                                            ]
                                        ),

                                      ],
                                    ),
                                  ),
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text('The resident has not yet applied for approval'),
                                    ),
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
