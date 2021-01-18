import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/updateTest.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';


class Test extends StatefulWidget  {

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Widget createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/bg.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 35.0,
              left: 16.0,
              child: Text("Mark Shaun",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("shaunmark05@hotmail.com",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget createDrawerBodyItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  //TestData testData;
  Widget displayTest(TestData testData) {
    if (testData.date != '') {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Date of Test                        :   ${testData.date}'),
            SizedBox(height: 20.0,),
            Text('Result of Test                     :   ${testData.result}'),
            SizedBox(height: 20.0,),
            Text(
                'Self Assessment. How \ndid I perform                       :   ${testData
                    .assessment}'),
            SizedBox(height: 20.0,),
            Text('Reasons for level of \nperformance                         :   ${testData.goals}'),
          ],
        ),
      );
    }
    else {
      return Center(
          child: Text('No information available! Edit to Update',style: TextStyle(fontStyle: FontStyle.italic,
              color: Colors.grey))
      );
    }
  }

  String text = '';
  bool shouldDisplay = false;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context, isScrollControlled: true, builder: (context) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: UpdateTest(),
          ),
        );
      });
    }
    final user = Provider.of<User>(context);
    return StreamBuilder<TestData>(
        stream: DatabaseService(uid: user.uid).testData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            TestData testData = snapshot.data;
            return DefaultTabController(
              length: 4,
              child: Scaffold(
                //resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  automaticallyImplyLeading: true,

                  title: Text('FA Tests'),
                  backgroundColor: Color.fromRGBO(273, 146, 158, 1),
                  actions: <Widget>[
                    FlatButton.icon(
                        onPressed: () => _showSettingsPanel(),
                        icon: Icon(Icons.edit, color: Colors.white,),
                        label: Text('Edit Test Info',
                          style: TextStyle(color: Colors.white,),)),

                  ],
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
                    displayTest(testData),
                    Center(
                        child: Text('No information available! Edit to update!',
                            style: TextStyle(fontStyle: FontStyle.italic,
                                color: Colors.grey))
                    ),
                    Center(
                        child: Text('No information available! Edit to update!',style: TextStyle(fontStyle: FontStyle.italic,
                            color: Colors.grey))
                    ),
                    Center(
                        child: Text('No information available! Edit to update!',style: TextStyle(fontStyle: FontStyle.italic,
                            color: Colors.grey))
                    ),


                  ],
                ),
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      createDrawerHeader(),
                      createDrawerBodyItem(
                          icon: Icons.account_circle, text: 'Profile'),
                      createDrawerBodyItem(
                          icon: Icons.person_add, text: 'Add Mentor'),
                      createDrawerBodyItem(
                          icon: Icons.publish, text: 'Uploads'),
                      createDrawerBodyItem(
                          icon: Icons.public, text: 'Publications'),
                      createDrawerBodyItem(
                          icon: Icons.exit_to_app, text: 'Log Out'),
                      ListTile(
                        title: Text('App version 1.0.0'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar
                    : Theme(
                  data: Theme.of(context).copyWith(
                    // sets the background color of the `BottomNavigationBar`
                    canvasColor: Color.fromRGBO(273, 146, 158, 1),

                  ),
                  child: BottomNavigationBar(
                      currentIndex: 3,
                      type: BottomNavigationBarType.fixed,
                      unselectedItemColor: Color.fromRGBO(146, 180, 237, 1),
                      selectedItemColor: Colors.white,
                      items
                          : [
                        BottomNavigationBarItem(
                          title
                              : Text("Home"),
                          icon
                              : Icon(Icons.home),

                        ),
                        BottomNavigationBarItem(
                          title
                              : Text("Mission"),
                          icon
                              : Icon(Icons.verified_user),),
                        BottomNavigationBarItem(
                          title
                              : Text("Thesis"),
                          icon
                              : Icon(Icons.edit),),
                        BottomNavigationBarItem(
                          title
                              : Text("Test"),
                          icon
                              : Icon(Icons.assignment),
                        ),

                      ],
                      onTap
                          : (int indexOfItem) {
                        if (indexOfItem == 0)
                          Navigator.pushNamed(context, '/home');
                        else if (indexOfItem == 1)
                          Navigator.pushNamed(context, '/mission');
                        else if (indexOfItem == 2)
                          Navigator.pushNamed(context, '/thesis');
                        else if (indexOfItem == 3)
                          Navigator.pushNamed(context, '/test');
                      }),
                ),
              ),

            );
          }
          else {
            return Container();
          }
        }
    );
  }
}