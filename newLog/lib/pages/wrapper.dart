import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/home.dart';
import 'authenticate/baseApp.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //return either home or authenticate widget
    //return Authenticate();
    return (user != null) ? MyApp2() : Authenticate();
  }
}
