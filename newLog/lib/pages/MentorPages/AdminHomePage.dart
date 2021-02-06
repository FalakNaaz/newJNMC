import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/MentorPages/authMentor.dart';
import 'package:provider/provider.dart';
class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<Mentor>(context);
    final MentorAuthService _auth = MentorAuthService();
    return Container(
        child: RaisedButton(
          child: Text(' Admin log out'),
          onPressed:  ()async{await _auth.signOut();},
        )
    );
  }
}
