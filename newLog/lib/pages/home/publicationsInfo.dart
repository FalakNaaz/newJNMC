import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class PublicationsInfo extends StatefulWidget {
  @override
  _PublicationsInfoState createState() => _PublicationsInfoState();
}

class _PublicationsInfoState extends State<PublicationsInfo> {

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
                      _createTextArea('Papers Published/ Communicated', publicationsData.papers),
                      _createTextArea('Conferences/CMEs/Workshops attended', publicationsData.conferences),
                      _createTextArea('Outreach activity/Social Work', publicationsData.social),
                      _createTextArea('Organisational Experience', publicationsData.organization),
                      _createTextArea('Any other achievement/Awards', publicationsData.achievement),
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
                              child: Text('Get Approved'),
                              onPressed: ()async {await DatabaseService(uid: publications.uid).updateApprovalReady(true); }
                          ),
                        ) : Center(
                          child: RaisedButton(
                              child: Text('Pending'),
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