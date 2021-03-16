import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/MentorPages/homeM.dart';
import 'package:jmnchelogbook/services/auth.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/loading.dart';
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
            //print(listOfResidentData[2].name);
            return StreamBuilder<MentorData>(
              stream: DatabaseService(uid: user.uid).mentorData,
              builder: (context, snapshot2) {
               if(snapshot2.hasData){
                 MentorData mentorData = snapshot2.data;
                 return Scaffold(
                   appBar: AppBar(
                     title: Text(mentorData.name),
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
                         SizedBox(
                           height: 20.0,
                         ),
                         Text("Resident Doctors",style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline,),textScaleFactor: 1.3,),
                         for (var i in listOfResidentData)
                           MyDetails(
                               onTap:() {
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context) => HomeM(uid: i.uid)),
                                 );
                               },
                               title: i.name,
                               subtitle: i.email
                           ),

                       ],
                     ),
                   ),
                 );
               } else{
                 return Loading();
               }
              }
            );
          } else {
            return Loading();
          }
        });
  }
}

Widget MyDetails({@required VoidCallback onTap, @required String title, @required String subtitle}){
  return  GestureDetector(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.cyan[50],
        shadowColor: Colors.blueGrey,
        child:ListTile(
            leading:  Icon(Icons.account_circle, size: 35, color: Colors.blue,),
            title: Text(title, style: TextStyle(color: Colors.black),),
            subtitle: Text(subtitle),
            //selected: true,
            onTap: onTap
        ),

      ),
    ),
  );
}
