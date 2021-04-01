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
    return TextStyle(fontWeight: FontWeight.w600,color: Colors.teal, fontSize: 12);
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
                             padding: const EdgeInsets.all(20.0),
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
                                       Text("Papers Published/ Communicated",textScaleFactor: 1.2,),
                                       Text(":",textScaleFactor: 1.2,),
                                       Text(publicationsData.papers,textScaleFactor: 1.2),
                                       //Text("University",textScaleFactor: 1.2),
                                     ]
                                 ),
                                 rowSpacer,
                                 TableRow(
                                     children: [
                                       Text("Conferences/CMEs/Workshops attended",textScaleFactor: 1.2,),
                                       Text(":",textScaleFactor: 1.2,),
                                       Text(publicationsData.conferences,textScaleFactor: 1.2),
                                       //Text("AKTU",textScaleFactor: 1.2),
                                     ]
                                 ),
                                 rowSpacer,
                                 TableRow(
                                     children: [
                                       Text("Outreach activity/Social Work",textScaleFactor: 1.2,),
                                       Text(":",textScaleFactor: 1.2,),
                                       Text(publicationsData.social,textScaleFactor: 1.2),

                                     ]
                                 ),
                                 rowSpacer,
                                 TableRow(
                                     children: [
                                       Text("Organisational Experience",textScaleFactor: 1.2,),
                                       Text(":",textScaleFactor: 1.2,),
                                       Text(publicationsData.organization,textScaleFactor: 1.2),
                                     ]
                                 ),
                                 rowSpacer,
                                 TableRow(
                                     children: [
                                       Text("Any other achievement/Awards",textScaleFactor: 1.2,),
                                       Text(":",textScaleFactor: 1.2,),
                                       Text(publicationsData.achievement,textScaleFactor: 1.2),
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
                                               TextSpan(text:publicationsData.mentorMail,style: TextStyle(color: Colors.teal) )
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
                                     color: Colors.teal,
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
                                     color: Colors.teal,
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
                           ) :Center(
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
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