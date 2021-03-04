import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class PublicationsInfoM extends StatefulWidget {
  final String uid;
  PublicationsInfoM({this.uid});
  @override
  _PublicationsInfoMState createState() => _PublicationsInfoMState();
}

class _PublicationsInfoMState extends State<PublicationsInfoM> {
  TextStyle textStyle(){
    return TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(273, 146, 158, 1), fontSize: 12);
  }
  @override
  Widget build(BuildContext context) {
    const rowSpacer=TableRow( children: [ SizedBox( height: 12, ), SizedBox( height: 12, ), SizedBox( height: 12, ) ]);
    final user = Provider.of<User>(context) ;
    return StreamBuilder<PublicationsData>(
        stream: DatabaseService(uid: widget.uid).publicationsData,
        builder: (context, snapshot) {
          if(snapshot.hasData)
          {
            PublicationsData publicationsData = snapshot.data;
            return StreamBuilder<MentorData>(
              stream: DatabaseService(uid: user.uid).mentorData,
              builder: (context, snapshot2) {
               if(snapshot2.hasData){
                 MentorData mentorData = snapshot2.data;
                 return SafeArea(
                   child: publicationsData.papers == '' ? Align(
                     alignment: Alignment.center,
                     child: Text(
                       'No Information Available Yet!',
                       style: TextStyle(
                           fontStyle: FontStyle.italic, color: Colors.grey),
                     ),
                   ) : SingleChildScrollView(
                     child: Column(
                         //crossAxisAlignment: CrossAxisAlignment.start ,
                       //mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Table(

                               columnWidths: {
                                 0: FlexColumnWidth(3),
                                 1: FlexColumnWidth(1),
                                 2: FlexColumnWidth(6),
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
                                 ),
                                 SizedBox(height: 20.0,),
                                 Center(
                                   child: RaisedButton(
                                       color: Color.fromRGBO(273, 146, 158, 1),
                                       child: Text(
                                         'Un-approve',
                                         style: TextStyle(color: Colors.white),
                                       ),
                                       onPressed: ()async {
                                         await DatabaseService(uid: widget.uid).updateIsApproved(false, '', '');
                                         await DatabaseService(uid: widget.uid).updateApprovalReady(false);
                                         setState(() {});
                                       }
                                   ),
                                 )

                               ],
                             ),
                           ):
                           (publicationsData.approvalReady) ?

                           Center(
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 SizedBox(height: 100.0,),
                                 RaisedButton(
                                     color: Color.fromRGBO(273, 146, 158, 1),
                                     child: Text(
                                       'Approve',
                                       style: TextStyle(color: Colors.white),
                                     ),
                                     onPressed: ()async {
                                       await DatabaseService(uid: widget.uid).updateIsApproved(true, mentorData.name, mentorData.email);
                                       setState(() {});
                                     }
                                 ),
                                 SizedBox(width: 20.0,),
                                 RaisedButton(
                                     color: Color.fromRGBO(273, 146, 158, 1),
                                     child: Text(
                                       'Decline',
                                       style: TextStyle(color: Colors.white),
                                     ),
                                     onPressed: ()async {
                                       await DatabaseService(uid: widget.uid).updateApprovalReady(false, );
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
               } else{
                 return Container();
               }
              }
            );

          }
          else{
            return Container();
          }

        }
    );
  }
}