import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/updateThesis.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';

class ThesisTab extends StatefulWidget {
  @override
  _ThesisTabState createState() => _ThesisTabState();
}

class _ThesisTabState extends State<ThesisTab> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    void _showSettingsPanel(int tabNo) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              body: SafeArea(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 120.0, horizontal: 15.0),
                  child: UpdateThesis(
                    tabNo: tabNo,
                  ),
                ),
              ),
            );
          });
    }

    Widget displayText(ThesisData thesisData, int tabNo) {
      const rowSpacer=TableRow( children: [ SizedBox( height: 12, ), SizedBox( height: 12, ), SizedBox( height: 12, ) ]);
      var consult = thesisData.consult;
      var collect = thesisData.collect;
      var pre = thesisData.pre;
      return Padding(
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
                          Text( 'Periodic Consultation with Mentor',textScaleFactor: 1.2),
                          Text(":",textScaleFactor: 1.2,),
                          Text(consult,textScaleFactor: 1.2),
                          //Text("University",textScaleFactor: 1.2),
                        ]
                    ),
                    rowSpacer,
                    TableRow(
                        children: [
                          Text("Regular Collection of Data",textScaleFactor: 1.2),
                          Text(":",textScaleFactor: 1.2,),
                          Text(collect,textScaleFactor: 1.2),
                          //Text("AKTU",textScaleFactor: 1.2),
                        ]
                    ),
                    rowSpacer,
                    TableRow(
                        children: [
                          Text("Departmental Presentation",textScaleFactor: 1.2,),
                          Text(":",textScaleFactor: 1.2,),
                          Text(pre,textScaleFactor: 1.2),

                        ]
                    ),
                    rowSpacer,
                  ],
                ),
              ),
              (!thesisData.isApproved) ?
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
              (thesisData.isApproved) ?
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
                    )
                  ],
                ),
              ):
              (!thesisData.approvalReady) ?
              Center(
                child: RaisedButton(
                    color: Colors.teal,
                    child: Text(
                      'Get Approved',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: ()async {await DatabaseService(uid: user.uid).updateApprovalReadyThesis(tabNo.toString(),true); }
                ),
              ) : Center(
                child: RaisedButton(
                    color: Colors.teal,
                    child: Text(
                      'Pending',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: ()async {await DatabaseService(uid: user.uid).updateApprovalReadyThesis(tabNo.toString(),false); }
                ),
              )
            ],
          ),
        ),
      );
    }


    return StreamBuilder<List<ThesisData>>(
        stream: DatabaseService(uid: user.uid).listOfThesisData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ThesisData> listOfThesisData = snapshot.data;

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
                    displayText(listOfThesisData[0], 0),
                    displayText(listOfThesisData[1], 1),
                    displayText(listOfThesisData[2], 2),
                    displayText(listOfThesisData[3], 3),
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
