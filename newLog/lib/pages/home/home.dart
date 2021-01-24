import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/homeTab.dart';
import 'package:jmnchelogbook/pages/home/missionTab.dart';
import 'package:jmnchelogbook/pages/home/test.dart';
import 'package:jmnchelogbook/pages/home/thesis.dart';
import 'package:jmnchelogbook/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/loading.dart';
import 'package:provider/provider.dart';

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  final AuthService _auth = AuthService();
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    MissionTab(),
    ThesisTab(),
    TestBar(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget createDrawerHeader(String name, String email) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/images/bg.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 35.0,
              left: 16.0,
              child: Text('$name',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text('$email',
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

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user?.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Scaffold(
              //extendBodyBehindAppBar: true,
              appBar: AppBar(
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Text('JNMCH eLogBook'),
                backgroundColor: Color.fromRGBO(273, 146, 158, 1),
              ),
              body: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    createDrawerHeader(userData.name, userData.email),
                    createDrawerBodyItem(
                        icon: Icons.account_circle,
                        text: 'Profile',
                        onTap: () {
                          Navigator.pushNamed(context, '/CV');
                        }),
                    createDrawerBodyItem(
                        icon: Icons.person_add, text: 'Add Mentor'),
                    createDrawerBodyItem(
                        icon: Icons.publish,
                        text: 'Uploads',
                        onTap: () {
                          Navigator.pushNamed(context, '/uploadScreen');
                        }),
                    createDrawerBodyItem(
                        icon: Icons.public,
                        text: 'Publications',
                        onTap: () {
                          Navigator.pushNamed(context, '/publications');
                        }),
                    createDrawerBodyItem(
                      icon: Icons.exit_to_app,
                      text: 'Log Out',
                      onTap: () async {
                        //Navigator.of(context).pop();
                        // Navigator.of(context).pushReplacementNamed('/');
                        await _auth.signOut();
                        //Provider.of<AuthService>(context, listen: false);
                      },
                    ),
                    ListTile(
                      title: Text('App version 1.0.0'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                  // sets the background color of the `BottomNavigationBar`
                  canvasColor: Color.fromRGBO(273, 146, 158, 1),
                ),
                child: BottomNavigationBar(
                    //currentIndex: 0,
                    type: BottomNavigationBarType.fixed,
                    unselectedItemColor: Color.fromRGBO(146, 180, 237, 1),
                    selectedItemColor: Colors.white,
                    items: [
                      BottomNavigationBarItem(
                        title: Text("Home"),
                        icon: Icon(Icons.home),
                      ),
                      BottomNavigationBarItem(
                        title: Text("Mission"),
                        icon: Icon(Icons.verified_user),
                      ),
                      BottomNavigationBarItem(
                        title: Text("Thesis"),
                        icon: Icon(Icons.edit),
                      ),
                      BottomNavigationBarItem(
                        title: Text("Test"),
                        icon: Icon(Icons.assignment),
                      ),
                    ],
                  currentIndex: _selectedIndex,
                  //selectedItemColor: Colors.teal,
                  //unselectedItemColor: Colors.grey[600],
                  showUnselectedLabels: true,
                  //type: BottomNavigationBarType.fixed,
                  onTap: _onItemTapped,
                   ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
