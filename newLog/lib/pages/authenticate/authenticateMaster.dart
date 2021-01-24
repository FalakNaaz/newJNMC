import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/authenticate/authenticateMentor.dart';
import 'package:jmnchelogbook/pages/authenticate/authenticateResident.dart';
import 'package:jmnchelogbook/pages/authenticate/registerResident.dart';
import 'package:jmnchelogbook/pages/authenticate/loginResident.dart';
import 'package:jmnchelogbook/pages/authenticate/registerMentor.dart';

class AuthenticateMaster extends StatefulWidget {
  @override
  _AuthenticateMasterState createState() => _AuthenticateMasterState();
}

class _AuthenticateMasterState extends State<AuthenticateMaster> {
  bool showRes = true;
  void toggleScreen()
  {
    setState(()=> showRes = !showRes);
  }

  @override
  Widget build(BuildContext context) {
    return showRes ? AuthenticateResident(toggleScreen: toggleScreen) : AuthenticateMentor(toggleScreen: toggleScreen );
  }
}
