import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/pages/MentorPages/ResInfo.dart';

class ResidentInfo extends StatefulWidget {
  final String uid;
  ResidentInfo({this.uid});
  @override
  _ResidentInfoState createState() => _ResidentInfoState();
}

class _ResidentInfoState extends State<ResidentInfo> {
  int _selectedIndex = 0;

 /* static List<Widget> _widgetOptions = <Widget>[
    ResInfo(uid: widget.uid),

  ];
*/
  Widget getPage(int index)
  {
    switch(index){
      case 0:
        return ResInfo(uid:widget.uid);
        break;
    }
  }

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
    return StreamBuilder(
        stream: DatabaseService(uid: widget.uid).residentData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ResidentData residentData = snapshot.data;
            return Scaffold(
              //extendBodyBehindAppBar: true,
              appBar: AppBar(
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Text('JNMCH eLogBook'),
                backgroundColor: Color.fromRGBO(273, 146, 158, 1),
              ),
              body: Center(
                child: getPage(_selectedIndex),
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    createDrawerHeader(residentData.name, residentData.email),
                    createDrawerBodyItem(
                        icon: Icons.account_circle,
                        text: 'Resident CV',
                        onTap: () {
                          Navigator.pushNamed(context, '/CV');
                        }),
                    createDrawerBodyItem(
                        icon: Icons.publish,
                        text: 'Documents',
                        onTap: () {
                          Navigator.pushNamed(context, '/uploadScreen');
                        }),
                    createDrawerBodyItem(
                        icon: Icons.public,
                        text: 'Publications',
                        onTap: () {
                          Navigator.pushNamed(context, '/publications');
                        }),
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
                  showUnselectedLabels: true,
                  //type: BottomNavigationBarType.fixed,
                  onTap: _onItemTapped,
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
