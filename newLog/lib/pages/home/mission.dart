import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class Mission extends StatefulWidget  {
  @override
  _MissionState createState() => _MissionState();
}

class _MissionState extends State<Mission> {
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
            currentIndex : 1,
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
