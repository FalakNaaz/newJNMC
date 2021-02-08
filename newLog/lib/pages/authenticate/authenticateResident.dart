import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/authenticate/registerResident.dart';
import 'package:jmnchelogbook/pages/authenticate/loginResident.dart';

class AuthenticateResident extends StatefulWidget {
 /* final Function toggleScreen;
  AuthenticateResident({this.toggleScreen});*/
  @override
  _AuthenticateResidentState createState() => _AuthenticateResidentState();
}

class _AuthenticateResidentState extends State<AuthenticateResident> {
  bool showSignIn = true;

  void toggleView()
  {
    setState(()=> showSignIn = !showSignIn );
  }

  @override
  Widget build(BuildContext context) {
   return showSignIn ? LogInResident(toggleView: toggleView) : BaseApp(toggleView: toggleView);
  }
}
