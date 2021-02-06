import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/MentorPages/authMentor.dart';
import 'package:provider/provider.dart';
class MentorHomePage extends StatefulWidget {
  @override
  _MentorHomePageState createState() => _MentorHomePageState();
}

class _MentorHomePageState extends State<MentorHomePage> {
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<Mentor>(context);
    final MentorAuthService _auth = MentorAuthService();
    return Container(
      child: RaisedButton(
        child: Text('Mentor log out'),
        onPressed:  ()async{await _auth.signOut();},
      )
    );
  }
}
