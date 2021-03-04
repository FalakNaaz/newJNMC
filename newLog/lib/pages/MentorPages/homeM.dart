import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/MentorPages/cvScreenM.dart';
import 'package:jmnchelogbook/pages/MentorPages/firstPage2M.dart';
import 'package:jmnchelogbook/pages/MentorPages/homeTabM.dart';
import 'package:jmnchelogbook/pages/MentorPages/missionTabM.dart';
import 'package:jmnchelogbook/pages/MentorPages/publicationsM.dart';
import 'package:jmnchelogbook/pages/MentorPages/testTabM.dart';
import 'package:jmnchelogbook/pages/MentorPages/thesisTabM.dart';
import 'package:jmnchelogbook/pages/MentorPages/uploadScreenM.dart';
import 'package:jmnchelogbook/pages/PdfFirebase/FirstPage2.dart';
import 'package:jmnchelogbook/pages/home/homeTab.dart';
import 'package:jmnchelogbook/pages/home/missionTab.dart';
import 'package:jmnchelogbook/pages/home/publications.dart';
import 'package:jmnchelogbook/pages/home/test.dart';
import 'package:jmnchelogbook/pages/home/thesis.dart';
import 'package:jmnchelogbook/pages/home/uploadScreen.dart';
import 'package:jmnchelogbook/services/auth.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/loading.dart';
import 'package:provider/provider.dart';

class HomeM extends StatefulWidget {
  final String uid;
  HomeM({this.uid});
  @override
  _HomeMState createState() => _HomeMState();
}

class _HomeMState extends State<HomeM> {
  //String url;
  @override
  /* void initState() {
    super.initState();
    createCollections();
  }
  Future createCollections() async {
    //super.initState();
    User user = Provider.of<User>(context);
    //await DatabaseService(uid:user.uid).mastersList();
    await DatabaseService(uid:user.uid).createTest2('','','','',);
    await DatabaseService(uid:user.uid).createThesis('A','A','A',);
    await DatabaseService(uid:user.uid).createRotations();
    await DatabaseService(uid:user.uid).updateUserData('', '', '', '','','','','','','','','','','','');
    await DatabaseService(uid:user.uid).updateUserDataForMission(false,'');
    await DatabaseService(uid:user.uid).updatePublicationsData('', '', '','','');
  }*/
  final AuthService _auth = AuthService();
  int _selectedIndex = 0;
  Widget getPage(int index)
  {
    switch(index){
      case 0:
        return HomeTabM(uid:widget.uid);
        break;
       case 1:
        return MissionTabM(uid:widget.uid);
        break;
       case 2:
        return ThesisTabM(uid:widget.uid);
        break;
       case 3:
        return TestTabM(uid:widget.uid);
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
          /*if(url!=null)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage:
              NetworkImage(url),
              backgroundColor: Colors.transparent,
            ),
          ),*/
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

  /* getUrl(BuildContext context) async {
    final user = Provider.of<User>(context);
    //var url;
    var isImage = await DatabaseService(uid: user.uid).getImageVar();
    if (isImage) {
      final ref = FirebaseStorage.instance.ref().child('images/${user.uid}.jpeg');
      url = await ref.getDownloadURL();
    } else
      url=null;
  }*/

  @override
  Widget build(BuildContext context) {
   // final user = Provider.of<User>(context);

    //getUrl(context);
    return StreamBuilder<ResidentData>(
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
                        text: 'Profile',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CVScreenM(uid: widget.uid)),
                          );
                        }),
                    createDrawerBodyItem(
                        icon: Icons.person,
                        text: 'Mentor approval',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UploadScreenM(uid: widget.uid)),
                          );
                        }),
                    createDrawerBodyItem(
                        icon: Icons.publish,
                        text: 'Upload Profile Picture',
                        onTap: () {
                         // print(widget.uid);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UploadScreenM(uid: widget.uid)),
                          );
                        }),
                    createDrawerBodyItem(
                        icon: Icons.menu_book,
                        text: 'Upload Documents',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstPage2M(uid: widget.uid)));
                        }),
                    createDrawerBodyItem(
                        icon: Icons.public,
                        text: 'Publications',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PublicationsScreenM(uid: widget.uid)),
                          );
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
