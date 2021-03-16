import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/logOfCasesInfo.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class LogOfCases extends StatefulWidget {
  final int rotationNo;
  LogOfCases({this.rotationNo});
  @override
  _LogOfCasesState createState() => _LogOfCasesState();
}

class _LogOfCasesState extends State<LogOfCases> {
  String text = '';
  bool shouldDisplay = false;


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Log of Cases/Procedures'),
        backgroundColor: Colors.teal,
      ),
    body: LogOfCasesInfo(rotationNo: widget.rotationNo),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: IconButton(icon: Icon(Icons.add,color: Colors.white,),),
        onPressed: ()async {await DatabaseService(uid:user.uid).incrementPatientDoc(widget.rotationNo);},
      ),
    );
  }
}
