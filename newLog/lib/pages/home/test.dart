import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/updateTest.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
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
          builder: (BuildContext context) {
            return Scaffold(
              body: SafeArea(
                  child:  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                      child: UpdateTest(
                        tabNo: tabNo,
                      ),
                    ),
              ),
            );
          });
    }

    Widget displayTest(TestData testData, int tabNo) {
      const rowSpacer=TableRow( children: [ SizedBox( height: 12, ), SizedBox( height: 12, ), SizedBox( height: 12, ) ]);
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            elevation: 8.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text(
                    'Grading: Poor- 1, Satisfactory- 2, Average- 3, Good- 4, Very Good- 5',
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    columnWidths: {
                      0: FlexColumnWidth(4),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(4),
                    },
                    // textDirection: TextDirection.rtl,
                    //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                    // border:TableBorder.all(width: 2.0,color: Colors.red),
                    children: [

                      TableRow(
                          children: [
                            Text( 'Date of test',textScaleFactor: 1.2,),
                            Text(":",textScaleFactor: 1.2,),
                            Text(testData.date,textScaleFactor: 1.2),
                            //Text("University",textScaleFactor: 1.2),
                          ]
                      ),
                      rowSpacer,
                      TableRow(
                          children: [
                            Text("Result of test",textScaleFactor: 1.2,),
                            Text(":",textScaleFactor: 1.2,),
                            Text(testData.result,textScaleFactor: 1.2),
                            //Text("AKTU",textScaleFactor: 1.2),
                          ]
                      ),
                      rowSpacer,
                      TableRow(
                          children: [
                            Text("Self assessment. How did I perform? Grade yourself from good, satisfactory, poor.",textScaleFactor: 1.2,),
                            Text(":",textScaleFactor: 1.2,),
                            Text(testData.assessment,textScaleFactor: 1.2),

                          ]
                      ),
                      rowSpacer,
                      TableRow(
                          children: [
                            Text("Reasons for level of performance",textScaleFactor: 1.2),
                            Text(":",textScaleFactor: 1.2,),
                            Text(testData.reason,textScaleFactor: 1.2),

                          ]
                      ),
                      rowSpacer,
                    ],
                  ),
                ),
                (!testData.isApproved) ?
                RaisedButton(
                  color: Colors.teal,
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),),
                  onPressed: () => _showSettingsPanel(tabNo),
                ) :
                RaisedButton(
                  //color: Colors.teal,
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.black),),
                  onPressed:() {showMyDialog(context);},
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
                          Text('Approved',textScaleFactor: 1.2,),
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
          ),
        ),
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
