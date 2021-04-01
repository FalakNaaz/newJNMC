import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/MentorPages/cvScreenM.dart';
import 'package:jmnchelogbook/pages/MentorPages/feedback1M.dart';
import 'package:jmnchelogbook/pages/MentorPages/firstPage2M.dart';
import 'package:jmnchelogbook/pages/MentorPages/homeTabM.dart';
import 'package:jmnchelogbook/pages/MentorPages/missionTabM.dart';
import 'package:jmnchelogbook/pages/MentorPages/publicationsM.dart';
import 'package:jmnchelogbook/pages/MentorPages/summaryM.dart';
import 'package:jmnchelogbook/pages/MentorPages/testTabM.dart';
import 'package:jmnchelogbook/pages/MentorPages/thesisTabM.dart';
import 'package:jmnchelogbook/pages/MentorPages/uploadScreenM.dart';
import 'package:jmnchelogbook/services/auth.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/loading.dart';

class HomeM extends StatefulWidget {
  final String uid;
  HomeM({this.uid});
  @override
  _HomeMState createState() => _HomeMState();
}

class _HomeMState extends State<HomeM> {
  @override
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
                backgroundColor: Colors.teal,
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
                        icon: Icons.assignment,
                        text: 'Blueprint for evaluation',
                        onTap: () {
                          Navigator.pushNamed(context, '/blueprint');
                        }),
                    createDrawerBodyItem(
                        icon: Icons.ac_unit,
                        text: 'RIME model',
                        onTap: () {
                          Navigator.pushNamed(context, '/rime');
                        }),
                    createDrawerBodyItem(
                        icon: Icons.subject_rounded,
                        text: 'Summary',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SummaryScreenM(uid: widget.uid)),
                          );
                        }),
                    createDrawerBodyItem(
                        icon: Icons.check,
                        text: '360 degree Feedback',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FeedbackScreenM(uid: widget.uid)),
                          );
                        }),
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
                  canvasColor: Colors.teal,
                ),
                child: BottomNavigationBar(
                  //currentIndex: 0,
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor:  Colors.tealAccent,
                  selectedItemColor: Colors.white,
                  items: [
                    BottomNavigationBarItem(
                      label: 'Home',
                      icon: Icon(Icons.home),
                    ),
                    BottomNavigationBarItem(
                      label: 'Mission',
                      icon: Icon(Icons.verified_user),
                    ),
                    BottomNavigationBarItem(
                      label: 'Thesis',
                      icon: Icon(Icons.edit),
                    ),
                    BottomNavigationBarItem(
                      label: 'Test',
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
