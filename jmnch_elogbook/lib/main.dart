import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'pages/baseApp.dart';
import 'pages/login.dart';
import 'pages/home.dart';
import 'pages/thesis.dart';
import 'pages/test.dart';

void main()
{
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
         home: BaseApp(),
          routes: <String, WidgetBuilder>{
           '/LoginAsResident' : (context) => LogInResident(),
            '/BaseApp' : (context) => BaseApp(),
            '/home' : (context) => MyApp2(),
            '/thesis' : (context) => Thesis(),
            '/test' : (context) => Test(),
          }
    );

  }
}
