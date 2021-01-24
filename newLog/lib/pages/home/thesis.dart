import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/updateThesis.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class ThesisTab extends StatefulWidget {
  @override
  _ThesisTabState createState() => _ThesisTabState();
}

class _ThesisTabState extends State<ThesisTab> {
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(int tabNo) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: Container(
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
    Widget displayText(ThesisData thesisData, int tabNo){
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
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: <Widget>[
              Text(
                'Periodic Consultation with Mentor :  $consult',
                style:
                TextStyle(color: Colors.black, fontSize: 20),
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
                style:
                TextStyle(color: Colors.black, fontSize: 20),
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
                style:
                TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
          RaisedButton(
            child: Text('Update'),
            onPressed: () => _showSettingsPanel(tabNo),
          ),
        ],
      );
    }
    final user = Provider.of<User>(context);
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
                  backgroundColor: Color.fromRGBO(273, 146, 158, 1),
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
                  child: Text('Loading...',
                    style: TextStyle(
                        fontSize: 30.0
                    ),),
                )
            );
          }
        });
  }
}
