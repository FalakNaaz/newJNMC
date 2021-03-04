import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class PublicationsInfo extends StatefulWidget {
  @override
  _PublicationsInfoState createState() => _PublicationsInfoState();
}

class _PublicationsInfoState extends State<PublicationsInfo> {

  TextStyle textStyle(){
    return TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(273, 146, 158, 1), fontSize: 14);
  }
  @override
  Widget build(BuildContext context) {
    const rowSpacer=TableRow( children: [ SizedBox( height: 12, ), SizedBox( height: 12, ), SizedBox( height: 12, ) ]);
    final publications = Provider.of<User>(context) ;
    return StreamBuilder<PublicationsData>(
        stream: DatabaseService(uid: publications.uid).publicationsData,
        builder: (context, snapshot) {
          if(snapshot.hasData)
          {
            PublicationsData publicationsData = snapshot.data;
            return SafeArea(
              child: publicationsData.papers == '' ? Align(
                alignment: Alignment.center,
                child: Text(
                  'No Information Available! Edit to update',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.grey),
                ),
              ) : SingleChildScrollView(
                child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(

                          columnWidths: {
                            0: FlexColumnWidth(8),
                            1: FlexColumnWidth(1),
                            2: FlexColumnWidth(1),
                          },
                          // textDirection: TextDirection.rtl,
                          //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                          // border:TableBorder.all(width: 2.0,color: Colors.red),
                          children: [

                            TableRow(
                                children: [
                                  Text("Papers Published/ Communicated",textScaleFactor: 1.5,style:textStyle()),
                                  Text(":",textScaleFactor: 1.5,),
                                  Text(publicationsData.papers,textScaleFactor: 1.5),
                                  //Text("University",textScaleFactor: 1.5),
                                ]
                            ),
                            rowSpacer,
                            TableRow(
                                children: [
                                  Text("Conferences/CMEs/Workshops attended",textScaleFactor: 1.5,style:textStyle()),
                                  Text(":",textScaleFactor: 1.5,),
                                  Text(publicationsData.conferences,textScaleFactor: 1.5),
                                  //Text("AKTU",textScaleFactor: 1.5),
                                ]
                            ),
                            rowSpacer,
                            TableRow(
                                children: [
                                  Text("Outreach activity/Social Work",textScaleFactor: 1.5,style:textStyle()),
                                  Text(":",textScaleFactor: 1.5,),
                                  Text(publicationsData.social,textScaleFactor: 1.5),

                                ]
                            ),
                            rowSpacer,
                            TableRow(
                                children: [
                                  Text("Organisational Experience",textScaleFactor: 1.5,style:textStyle()),
                                  Text(":",textScaleFactor: 1.5,),
                                  Text(publicationsData.organization,textScaleFactor: 1.5),
                                ]
                            ),
                            rowSpacer,
                            TableRow(
                                children: [
                                  Text("Any other achievement/Awards",textScaleFactor: 1.5,style:textStyle()),
                                  Text(":",textScaleFactor: 1.5,),
                                  Text(publicationsData.achievement,textScaleFactor: 1.5),
                                ]
                            ),
                          ],
                        ),
                      ),
                      (publicationsData.isApproved) ?
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
                                Text('Mentor Name: ${publicationsData.mentorName}'),
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
                                      TextSpan(text:publicationsData.mentorMail,style: TextStyle(color: Color.fromRGBO(273, 146, 158, 1)) )
                                    ]


                                  )
                                ),
                              ],
                            )
                          ],
                        ),
                      ):
                      (!publicationsData.approvalReady) ?
                        Center(
                          child: RaisedButton(
                              color: Color.fromRGBO(273, 146, 158, 1),
                              child: Text(
                                'Get Approved',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: ()async {await DatabaseService(uid: publications.uid).updateApprovalReady(true); }
                          ),
                        ) : Center(
                          child: RaisedButton(
                              color: Color.fromRGBO(273, 146, 158, 1),
                              child: Text(
                                'Pending',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: ()async {await DatabaseService(uid: publications.uid).updateApprovalReady(false); }
                          ),
                        )
                    ]),
              ),

            );

          }
          else{
            return Container();
          }

        }
    );
  }
}