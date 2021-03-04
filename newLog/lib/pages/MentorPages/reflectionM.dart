import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/MentorPages/reflectionInfoM.dart';
import 'package:jmnchelogbook/pages/home/caseroutineInfo.dart';
import 'package:jmnchelogbook/pages/home/reflectionInfo.dart';
import 'package:jmnchelogbook/pages/home/updateCaseroutine.dart';
import 'package:jmnchelogbook/pages/home/updateReflection.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class ReflectionM extends StatelessWidget {
  final String uid;
  final int rotationNo;
  ReflectionM({this.uid,this.rotationNo});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('JNMCH eLogBook'),
          backgroundColor: Color.fromRGBO(273, 146, 158, 1),
        ),
        body: ReflectionInfoM(uid:uid,rotationNo: rotationNo),
    );
  }
}
