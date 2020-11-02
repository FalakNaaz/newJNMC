import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class Thesis extends StatefulWidget  {
  @override
  _ThesisState createState() => _ThesisState();
}

class _ThesisState extends State<Thesis> {
  Widget createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image:  AssetImage('assets/images/bg.jpg'))),
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
  var currentItemSelected = 'A';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JNMCH eLogBook'),
        backgroundColor: Color.fromRGBO(273, 146, 158, 1),
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          Container(
            color: Color.fromRGBO(273, 146, 158, 1),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(146, 180, 237, 1),
                    border: Border.all(
                      // color: Colors.red[500],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(
                  child: Text(
                    "Keep your Log Book with yourselves!",
                    //alignment:Alignment(10,20),
                    style: TextStyle(fontSize: 27, fontFamily: "DancingScript",),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 310,
            child:DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar:AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Evaluation of Thesis Work'),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Grading: Poor- E, Satisfactory- D, Average- C, Good- B, Very Good- A',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.red),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: <Widget>[
                            Text('Periodic Consultation with Mentor :',
                              style: TextStyle(color: Colors.black, fontSize: 20),),
                            new DropdownButton<String>(
                              items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (String newValueSelected) {
                                setState((){
                                  this.currentItemSelected = newValueSelected;
                                });
                              },
                              value: currentItemSelected,
                              dropdownColor: Color.fromRGBO(273, 146, 158, 1),

                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: <Widget>[
                            Text('Regular Collection of Data              :',
                              style: TextStyle(color: Colors.black, fontSize: 20),),
                            new DropdownButton<String>(
                              items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (String newValueSelected) {
                                setState((){
                                  this.currentItemSelected = newValueSelected;
                                });
                              },
                              value: currentItemSelected,
                              dropdownColor: Color.fromRGBO(273, 146, 158, 1),
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: <Widget>[
                            Text('Departmental Presentation             :',
                              style: TextStyle(color: Colors.black, fontSize: 20),),
                            new DropdownButton<String>(
                              items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (String newValueSelected) {
                                setState((){
                                  this.currentItemSelected = newValueSelected;
                                });
                              },
                              value: currentItemSelected,
                              dropdownColor: Color.fromRGBO(273, 146, 158, 1),
                            ),

                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Grading: Poor- E, Satisfactory- D, Average- C, Good- B, Very Good- A',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.red),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: <Widget>[
                            Text('Periodic Consultation with Mentor :',
                              style: TextStyle(color: Colors.black, fontSize: 20),),
                            new DropdownButton<String>(
                              items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (String newValueSelected) {
                                setState((){
                                  this.currentItemSelected = newValueSelected;
                                });
                              },
                              value: currentItemSelected,
                              dropdownColor: Color.fromRGBO(273, 146, 158, 1),

                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: <Widget>[
                            Text('Regular Collection of Data              :',
                              style: TextStyle(color: Colors.black, fontSize: 20),),
                            new DropdownButton<String>(
                              items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (String newValueSelected) {
                                setState((){
                                  this.currentItemSelected = newValueSelected;
                                });
                              },
                              value: currentItemSelected,
                              dropdownColor: Color.fromRGBO(273, 146, 158, 1),
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: <Widget>[
                            Text('Departmental Presentation             :',
                              style: TextStyle(color: Colors.black, fontSize: 20),),
                            new DropdownButton<String>(
                              items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (String newValueSelected) {
                                setState((){
                                  this.currentItemSelected = newValueSelected;
                                });
                              },
                              value: currentItemSelected,
                              dropdownColor: Color.fromRGBO(273, 146, 158, 1),
                            ),

                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Grading: Poor- E, Satisfactory- D, Average- C, Good- B, Very Good- A',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.red),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: <Widget>[
                            Text('Periodic Consultation with Mentor :',
                              style: TextStyle(color: Colors.black, fontSize: 20),),
                            new DropdownButton<String>(
                              items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (String newValueSelected) {
                                setState((){
                                  this.currentItemSelected = newValueSelected;
                                });
                              },
                              value: currentItemSelected,
                              dropdownColor: Color.fromRGBO(273, 146, 158, 1),

                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: <Widget>[
                            Text('Regular Collection of Data              :',
                              style: TextStyle(color: Colors.black, fontSize: 20),),
                            new DropdownButton<String>(
                              items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (String newValueSelected) {
                                setState((){
                                  this.currentItemSelected = newValueSelected;
                                });
                              },
                              value: currentItemSelected,
                              dropdownColor: Color.fromRGBO(273, 146, 158, 1),
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: <Widget>[
                            Text('Departmental Presentation             :',
                              style: TextStyle(color: Colors.black, fontSize: 20),),
                            new DropdownButton<String>(
                              items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (String newValueSelected) {
                                setState((){
                                  this.currentItemSelected = newValueSelected;
                                });
                              },
                              value: currentItemSelected,
                              dropdownColor: Color.fromRGBO(273, 146, 158, 1),
                            ),

                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Grading: Poor- E, Satisfactory- D, Average- C, Good- B, Very Good- A',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.red),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: <Widget>[
                            Text('Periodic Consultation with Mentor :',
                              style: TextStyle(color: Colors.black, fontSize: 20),),
                            new DropdownButton<String>(
                              items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (String newValueSelected) {
                                setState((){
                                  this.currentItemSelected = newValueSelected;
                                });
                              },
                              value: currentItemSelected,
                              dropdownColor: Color.fromRGBO(273, 146, 158, 1),

                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: <Widget>[
                            Text('Regular Collection of Data              :',
                              style: TextStyle(color: Colors.black, fontSize: 20),),
                            new DropdownButton<String>(
                              items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (String newValueSelected) {
                                setState((){
                                  this.currentItemSelected = newValueSelected;
                                });
                              },
                              value: currentItemSelected,
                              dropdownColor: Color.fromRGBO(273, 146, 158, 1),
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: <Widget>[
                            Text('Departmental Presentation             :',
                              style: TextStyle(color: Colors.black, fontSize: 20),),
                            new DropdownButton<String>(
                              items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (String newValueSelected) {
                                setState((){
                                  this.currentItemSelected = newValueSelected;
                                });
                              },
                              value: currentItemSelected,
                              dropdownColor: Color.fromRGBO(273, 146, 158, 1),
                            ),

                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),

          ),
        ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            createDrawerHeader(),
            createDrawerBodyItem(
                icon: Icons.account_circle,text: 'Profile'),
            createDrawerBodyItem(
                icon: Icons.person_add,text: 'Add Mentor'),
            createDrawerBodyItem(
                icon: Icons.publish,text: 'Uploads'),
            createDrawerBodyItem(
                icon: Icons.public,text: 'Publications'),
            createDrawerBodyItem(
                icon: Icons.exit_to_app,text: 'Log Out'),
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
            currentIndex : 2,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor:  Color.fromRGBO(146, 180, 237, 1),
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
                    : Icon(Icons.verified_user), ),
              BottomNavigationBarItem(
                title
                    : Text("Thesis"),
                icon
                    : Icon(Icons.edit), ),
              BottomNavigationBarItem(
                title
                    : Text("Test"),
                icon
                    : Icon(Icons.assignment),
              ),

            ],
            onTap
                : (int indexOfItem){
              if(indexOfItem == 0)
                Navigator.pushNamed(context, '/home');
              else if(indexOfItem == 1)
                Navigator.pushNamed(context, '/mission');
              else if(indexOfItem == 2)
                Navigator.pushNamed(context, '/thesis');
              else if(indexOfItem == 3)
                Navigator.pushNamed(context, '/test');

            }),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
