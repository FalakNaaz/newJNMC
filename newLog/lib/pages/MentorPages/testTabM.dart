import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/updateTest.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class TestTabM extends StatefulWidget {
  final String uid;
  TestTabM({this.uid});
  @override
  _TestTabMState createState() => _TestTabMState();
}

class _TestTabMState extends State<TestTabM> {
  String text = '';
  bool shouldDisplay = false;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(int tabNo) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                child: UpdateTest(
                  tabNo: tabNo,
                ),
              ),
            );
          });
    }

    Widget displayTest(MentorData mentorData,TestData testData, int tabNo) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          (testData.date != '')
              ? Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    'Date of Test                        :   ${testData.date}'),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                    'Result of Test                     :   ${testData.result}'),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                    'Self Assessment. How \ndid I perform                       :   ${testData.assessment}'),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                    'Reasons for level of \nperformance                         :   ${testData.reason}'),
                (testData.isApproved) ?
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
                          Text('Mentor Name: ${testData.mentorName}'),
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
                                    TextSpan(text:testData.mentorMail,style: TextStyle(color: Colors.teal) )
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
                              await DatabaseService(uid: widget.uid).updateIsApprovedTest(tabNo.toString(),false, '', '');
                              await DatabaseService(uid: widget.uid).updateApprovalReadyTest(tabNo.toString(),false);
                              setState(() {});
                            }
                        ),
                      )

                    ],
                  ),
                ):
                (testData.approvalReady) ?
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
                            await DatabaseService(uid: widget.uid).updateIsApprovedTest(tabNo.toString(),true, mentorData.name, mentorData.email);
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
                            await DatabaseService(uid: widget.uid).updateApprovalReadyTest(tabNo.toString(),false, );
                            setState(() {});
                          }
                      ),
                    ],
                  ),
                ) :Center(
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
            ),
          )
              : Text('No information available yet!',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.grey)),
          SizedBox(
            height: 20.0,
          ),
        ],
      );
    }

    final user = Provider.of<User>(context);
    return StreamBuilder<List<TestData>>(
        stream: DatabaseService(uid: widget.uid).listOfTestData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<TestData> listOfTestData = snapshot.data;
            return StreamBuilder<MentorData>(
              stream: DatabaseService(uid: user.uid).mentorData,
              builder: (context, snapshot2) {
                if(snapshot2.hasData){
                  MentorData mentorData = snapshot2.data;
                  return DefaultTabController(
                    length: 4,
                    child: Scaffold(
                      appBar: AppBar(
                        toolbarHeight: 55.0,
                        backgroundColor: Colors.teal,
                        bottom: TabBar(
                          tabs: [
                            Tab(text: 'Test 1'),
                            Tab(text: 'Test 2'),
                            Tab(text: 'Test 3'),
                            Tab(text: 'Test 4'),
                          ],
                          labelColor: Colors.white,
                          indicatorColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                        ),
                      ),
                      body: TabBarView(
                        children: [
                          displayTest(mentorData,listOfTestData[0], 0),
                          displayTest(mentorData,listOfTestData[1], 1),
                          displayTest(mentorData,listOfTestData[2], 2),
                          displayTest(mentorData,listOfTestData[3], 3),
                        ],
                      ),
                    ),
                  );
                }else{
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
