import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class FeedbackInfo extends StatefulWidget {
  @override
  _FeedbackInfoState createState() => _FeedbackInfoState();
}

class _FeedbackInfoState extends State<FeedbackInfo> {

  TextStyle textStyle(){
    return TextStyle(fontWeight: FontWeight.w600,color: Colors.teal, fontSize: 14);
  }
  @override
  Widget build(BuildContext context) {
    const rowSpacer=TableRow( children: [ SizedBox( height: 12, ), SizedBox( height: 12, ), SizedBox( height: 12, ), SizedBox( height: 12, ) ]);
    final user = Provider.of<User>(context) ;
    return StreamBuilder<Feedback1>(
        stream: DatabaseService(uid: user.uid).feedbackData,
        builder: (context, snapshot) {
          print('snapshot.hasDaata');
          print(snapshot.hasData);
          if(snapshot.hasData)
          {
            Feedback1 feedbackData = snapshot.data;
            print(feedbackData);
            print(feedbackData.patients1);

            return SafeArea(
              child: feedbackData.patients1 == '' ? Align(
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
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('Grading:\nGrade the resident on knowledge, skills, empathy, interpersonal relationships, communication skills and professionalism on a scale of 1-4:\n\n1 = Poor, 2 = Satisfactory, 3 = Good , 4 = Excellent',style: TextStyle(color: Colors.red),),
                        ),
                      ),
                     Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Table(

                          columnWidths: {
                            0: FlexColumnWidth(6),
                            1: FlexColumnWidth(3),
                            2: FlexColumnWidth(3),
                            3: FlexColumnWidth(3),
                          },
                          // textDirection: TextDirection.rtl,
                          //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                          // border:TableBorder.all(width: 2.0,color: Colors.red),
                          children: [

                            TableRow(
                                children: [
                                  Text("",textScaleFactor: 1.2,),
                                  Text('Year 1',textScaleFactor: 1.2,),
                                  Text('Year 2',textScaleFactor: 1.2),
                                  Text('Year 3',textScaleFactor: 1.2),
                                  //Text("University",textScaleFactor: 1.2),
                                ]
                            ),
                            rowSpacer,
                             TableRow(
                                children: [
                                  Text("Patient [patient complaints , if any]",textScaleFactor: 1.2,),
                                  Text(feedbackData.patients1,textScaleFactor: 1.2,),
                                  Text(feedbackData.patients2,textScaleFactor: 1.2),
                                  Text(feedbackData.patients3,textScaleFactor: 1.2),
                                  //Text("University",textScaleFactor: 1.2),
                                ]
                            ),
                            rowSpacer,

                            TableRow(
                                children: [
                                  Text("Nursing and other staff",textScaleFactor: 1.2,),
                                  Text(feedbackData.nursing1,textScaleFactor: 1.2),
                                  Text(feedbackData.nursing2,textScaleFactor: 1.2),
                                  Text(feedbackData.nursing3,textScaleFactor: 1.2),
                                ]
                            ),
                            rowSpacer,
                            TableRow(
                                children: [
                                  Text("Undergraduates",textScaleFactor: 1.2,),
                                  Text(feedbackData.under1,textScaleFactor: 1.2),
                                  Text(feedbackData.under2,textScaleFactor: 1.2),
                                  Text(feedbackData.under3,textScaleFactor: 1.2),

                                ]
                            ),
                            rowSpacer,
                            TableRow(
                                children: [
                                  Text("Interns",textScaleFactor: 1.2,),
                                  Text(feedbackData.inter1,textScaleFactor: 1.2),
                                  Text(feedbackData.inter2,textScaleFactor: 1.2),
                                  Text(feedbackData.inter3,textScaleFactor: 1.2),
                                ]
                            ),
                            rowSpacer,
                            TableRow(
                                children: [
                                  Text("Seniors",textScaleFactor: 1.2,),
                                  Text(feedbackData.senior1,textScaleFactor: 1.2),
                                  Text(feedbackData.senior2,textScaleFactor: 1.2),
                                  Text(feedbackData.senior3,textScaleFactor: 1.2),
                                ]
                            ),
                            rowSpacer,
                            TableRow(
                                children: [
                                  Text("Juniors",textScaleFactor: 1.2,),
                                  Text(feedbackData.junior1,textScaleFactor: 1.2),
                                  Text(feedbackData.junior2,textScaleFactor: 1.2),
                                  Text(feedbackData.junior3,textScaleFactor: 1.2),
                                ]
                            ),
                          ],
                        ),
                      ),
                      (feedbackData.isApproved) ?
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text('Approved',textScaleFactor: 1.2,),
                                Icon(Icons.check_circle, color: Colors.green,size: 30,)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text('Mentor Name: ${feedbackData.mentorName}'),
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
                                          TextSpan(text:feedbackData.mentorMail,style: TextStyle(color: Colors.teal) )
                                        ]


                                    )
                                ),
                              ],
                            )
                          ],
                        ),
                      ):
                      (!feedbackData.approvalReady) ?
                      Center(
                        child: RaisedButton(
                            color: Colors.teal,
                            child: Text(
                              'Get Approved',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: ()async {await DatabaseService(uid: user.uid).updateApprovalReadyFeedback1(true); }
                        ),
                      ) : Center(
                        child: RaisedButton(
                            color: Colors.teal,
                            child: Text(
                              'Pending',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: ()async {await DatabaseService(uid: user.uid).updateApprovalReadyFeedback1(false); }
                        ),
                      ),
                      SizedBox(height: 80.0,),
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