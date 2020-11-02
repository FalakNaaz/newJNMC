import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '../authenticate/baseApp.dart';
import '../authenticate/login.dart';


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
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('JNMCH eLogBook'),
        backgroundColor: Color.fromRGBO(273, 146, 158, 1),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[

          Container(
            height: 538,
            child:DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar:AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Formative Assessment Tests'),
                  backgroundColor: Color.fromRGBO(273, 146, 158, 1),
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
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Date of Test'),
                          Text('Result'),
                          Text('Self Assessment. How  did I perform?'),
                          Text('Reflections: Reasons for level of performance'),
                          Text('Future Goals'),
                        ]),
                    ListView(
                      children: [
                        Row(
                          //mainAxisSize: MainAxisSize.min,
                          // crossAxisAlignment: CrossAxisAlignment.baseline,
                          // textBaseline: TextBaseline.ideographic,
                          children: <Widget>[
                            //Text("${selectedDate.toLocal()}".split(' ')[0]),
                            //SizedBox(width: 20.0,),
                            Text('Date:      ', style: TextStyle(fontSize: 25),),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              child: IconButton(
                                onPressed: () => _selectDate(context),
                                color: Color.fromRGBO(146, 180, 237, 1),
                                icon: Icon(Icons.perm_contact_calendar),
                                iconSize: 30,

                              ),
                            ),
                            Text("${selectedDate.toLocal()}".split(' ')[0]),
                          ],
                        ),
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.baseline,
                          //textBaseline: TextBaseline.ideographic,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('Result:     ', style: TextStyle(fontSize: 25),),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width: 150.0,
                              height:50,
                              margin: const EdgeInsets.only(right: 0, left: 0),
                              child:TextField(
                                onChanged: (value) {
                                  setState(() {
                                    text = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: 'Enter result',
                                  counterText: "",
                                  fillColor: Colors.white,
                                  border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                    borderSide: new BorderSide(
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            FlatButton(onPressed: () {
                              setState(() {
                                shouldDisplay = !shouldDisplay;
                              });
                            },// child: Text('Submit')
                            ),
                            shouldDisplay ? Text(text) : Spacer()
                          ],


                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('''Self Ass-\nessment: ''', style: TextStyle(fontSize: 25),),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width: 300.0,
                              //height:65,
                              margin: const EdgeInsets.only(right: 0, left: 0),
                              child:TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  labelText: '''Self Assessment: How did I\nperform? Grade yourself from good,\nsatisfactory, poor''',
                                  counterText: "",
                                  fillColor: Colors.white,
                                  border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                    borderSide: new BorderSide(
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],


                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('''Reflectio- \nns:''', style: TextStyle(fontSize: 25),),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width: 300.0,
                              //height:65,
                              margin: const EdgeInsets.only(right: 0, left: 0),
                              child:TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  labelText: '''Reflection: Reasons for level of\nperformance''',
                                  counterText: "",
                                  fillColor: Colors.white,
                                  border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                    borderSide: new BorderSide(
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],


                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('''Future G- \noals: ''', style: TextStyle(fontSize: 25),),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width: 300.0,
                              //height:65,
                              margin: const EdgeInsets.only(right: 0, left: 0),
                              child:TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  labelText: '''Future Goals''',
                                  counterText: "",
                                  fillColor: Colors.white,
                                  border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                    borderSide: new BorderSide(
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],


                        ),
                      ],
                    ),
                    Text(''),
                    Text(''),
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
            currentIndex : 3,
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
