import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/MentorPages/DetailPage.dart';
import 'package:jmnchelogbook/pages/MentorPages/authMentor.dart';
import 'package:jmnchelogbook/services/auth.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class MentorHomePage extends StatefulWidget {
  @override
  _MentorHomePageState createState() => _MentorHomePageState();
}

class _MentorHomePageState extends State<MentorHomePage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder(
        stream: DatabaseService(uid: user.uid).listOfResidentData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ListOfResidentData> listOfResidentData = snapshot.data;
            print(listOfResidentData[2].name);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      'Mentor log out',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      await _auth.signOut();
                    },
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    for (var i in listOfResidentData)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Resident: ${i.name} ',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            RaisedButton(
                                child: Text('Details'),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detail(uid: i.uid)),
                                  );
                                })
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
