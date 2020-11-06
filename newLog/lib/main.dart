import 'package:flutter/material.dart';
import 'package:jmnchelogbook/services/auth.dart';
import 'pages/authenticate/baseApp.dart';
import 'pages/authenticate/login.dart';
import 'pages/home/home.dart';
import 'pages/home/thesis.dart';
import 'pages/home/test.dart';
import 'pages/home/mission.dart';
import 'pages/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:jmnchelogbook/models/user.dart';
void main()
{
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          theme: new ThemeData(
            //brightness: Brightness.light,
            //primaryColor: Color.fromRGBO(146, 180, 237, 1),
            //accentColor: hexToColor(0xFCA311),
            //splashColor: hexToColor(0x3BB273),

          ),

          home: Wrapper(),
          routes: <String, WidgetBuilder>{
            '/LoginAsResident' : (context) => LogInResident(),
            '/BaseApp' : (context) => BaseApp(),
            '/home' : (context) => MyApp2(),
            '/thesis' : (context) => Thesis(),
            '/test' : (context) => Test(),
            '/mission' : (context) => Mission(),
          }
      ),
    );

  }
}
