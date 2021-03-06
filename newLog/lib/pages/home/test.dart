import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/updateTest.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class TestBar extends StatefulWidget {
  @override
  _TestBarState createState() => _TestBarState();
}

class _TestBarState extends State<TestBar> {
  String text = '';
  bool shouldDisplay = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
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

    Widget displayTest(TestData testData, int tabNo) {
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
                      RaisedButton(
                        child: Text('Update'),
                        onPressed: () => _showSettingsPanel(tabNo),
                      ),
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
                            )
                          ],
                        ),
                      ):
                      (!testData.approvalReady) ?
                      Center(
                        child: RaisedButton(
                            color: Colors.teal,
                            child: Text(
                              'Get Approved',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: ()async {await DatabaseService(uid: user.uid).updateApprovalReadyTest(tabNo.toString(),true); }
                        ),
                      ) : Center(
                        child: RaisedButton(
                            color: Colors.teal,
                            child: Text(
                              'Pending',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: ()async {await DatabaseService(uid: user.uid).updateApprovalReadyTest(tabNo.toString(),false); }
                        ),
                      )
                    ],
                  ),
                )
              : Center(
                  child: FlatButton(
                    onPressed: () => _showSettingsPanel(tabNo),
                    child: Text('No information available! Tap to Update',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.grey)),
                  ),
                ),
          SizedBox(
            height: 20.0,
          ),
        ],
      );
    }

    return StreamBuilder<List<TestData>>(
        stream: DatabaseService(uid: user.uid).listOfTestData,
        builder: (context, snapshot) {
          print(snapshot.hasData);
          if (snapshot.hasData) {

            List<TestData> listOfTestData = snapshot.data;
            return DefaultTabController(
              length: 4,
              child: Scaffold(
                //resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  toolbarHeight: 55.0,
                  // automaticallyImplyLeading: true,
                  //
                  // //title: Text('FA Tests'),
                  backgroundColor: Colors.teal,
                  // actions: <Widget>[
                  //   FlatButton.icon(
                  //       onPressed: () => _showSettingsPanel(),
                  //       icon: Icon(Icons.edit, color: Colors.white,),
                  //       label: Text('Edit Test Info',
                  //         style: TextStyle(color: Colors.white,),)),
                  //
                  // ],
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
                    displayTest(listOfTestData[0], 0),
                    displayTest(listOfTestData[1], 1),
                    displayTest(listOfTestData[2], 2),
                    displayTest(listOfTestData[3], 3),
                  ],
                ),
              ),
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
