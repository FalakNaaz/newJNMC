import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class ThesisTabM extends StatefulWidget {
  final String uid;
  ThesisTabM({this.uid});
  @override
  _ThesisTabMState createState() => _ThesisTabMState();
}

class _ThesisTabMState extends State<ThesisTabM> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    Widget displayText(ThesisData thesisData,MentorData mentorData, int tabNo) {
      var consult = thesisData.consult;
      var collect = thesisData.collect;
      var pre = thesisData.pre;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Text(
              'Grading: Poor- E, Satisfactory- D, Average- C, Good- B, Very Good- A',
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: <Widget>[
              Text(
                'Periodic Consultation with Mentor :  $consult',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: <Widget>[
              Text(
                'Regular Collection of Data               :  $collect',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: <Widget>[
              Text(
                'Departmental Presentation             :  $pre',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
          (thesisData.isApproved) ?
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
                    Text('Mentor Name: ${thesisData.mentorName}'),
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
                              TextSpan(text:thesisData.mentorMail,style: TextStyle(color: Colors.teal) )
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
                        await DatabaseService(uid: widget.uid).updateIsApprovedThesis(tabNo.toString(),false, '', '');
                        await DatabaseService(uid: widget.uid).updateApprovalReadyThesis(tabNo.toString(),false);
                        setState(() {});
                      }
                  ),
                )

              ],
            ),
          ):
          (thesisData.approvalReady) ?

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
                      await DatabaseService(uid: widget.uid).updateIsApprovedThesis(tabNo.toString(),true, mentorData.name, mentorData.email);
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
                      await DatabaseService(uid: widget.uid).updateApprovalReadyThesis(tabNo.toString(),false, );
                      setState(() {});
                    }
                ),
              ],
            ),
          ) : Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.info_outline),
                  SizedBox(width: 10.0,),
                  Text('The resident has not yet applied for approval'),
                ],
              ),
            ),
          )

        ],
      );
    }
    return StreamBuilder<List<ThesisData>>(
        stream: DatabaseService(uid: widget.uid).listOfThesisData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ThesisData> listOfThesisData = snapshot.data;

            return StreamBuilder<MentorData>(
              stream:  DatabaseService(uid: user.uid).mentorData,
              builder: (context, snapshot2) {
                if(snapshot2.hasData){
                  MentorData mentorData = snapshot2.data;
                  return DefaultTabController(
                    length: 4,
                    child: Scaffold(
                      appBar: AppBar(
                        toolbarHeight: 55.0,

                        automaticallyImplyLeading: false,
                        //title: Text('Evaluation of Thesis Work'),
                        backgroundColor: Colors.teal,
                        bottom: TabBar(
                          tabs: [
                            Tab(text: '6th'),
                            Tab(text: '12th'),
                            Tab(text: '18th'),
                            Tab(text: '24th'),
                          ],
                          labelColor: Colors.white,
                          indicatorColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                        ),
                      ),
                      body: TabBarView(
                        children: [
                          displayText(listOfThesisData[0],mentorData, 0),
                          displayText(listOfThesisData[1],mentorData, 1),
                          displayText(listOfThesisData[2],mentorData, 2),
                          displayText(listOfThesisData[3],mentorData, 3),
                        ],
                      ),
                    ),
                  );
                } else{
                  return Container();
                }

              }
            );
          } else {
            return Container(
                child: Center(
                  child: Text(
                    'Loading...',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ));
          }
        });
  }
}
