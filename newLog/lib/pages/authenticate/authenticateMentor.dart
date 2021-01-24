import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/authenticate/loginMentor.dart';
import 'package:jmnchelogbook/pages/authenticate/registerMentor.dart';
import 'package:jmnchelogbook/pages/authenticate/registerResident.dart';
import 'package:jmnchelogbook/pages/authenticate/loginResident.dart';

class AuthenticateMentor extends StatefulWidget {
  final Function toggleScreen;
  AuthenticateMentor({this.toggleScreen});
  @override
  _AuthenticateMentorState createState() => _AuthenticateMentorState();
}

class _AuthenticateMentorState extends State<AuthenticateMentor> {
  bool showSignIn = true;

  void toggleView()
  {
    setState(()=> showSignIn = !showSignIn );
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn ? LogInMentor(toggleView: toggleView,toggleScreen: widget.toggleScreen,) : RegisterMentor(toggleView: toggleView);
  }
}
