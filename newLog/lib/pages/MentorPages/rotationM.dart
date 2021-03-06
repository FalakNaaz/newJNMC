import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jmnchelogbook/pages/MentorPages/caseReportM.dart';
import 'package:jmnchelogbook/pages/MentorPages/caseRoutineM.dart';
import 'package:jmnchelogbook/pages/MentorPages/endRotationM.dart';
import 'package:jmnchelogbook/pages/MentorPages/logOfCasesM.dart';
import 'package:jmnchelogbook/pages/MentorPages/reflectionM.dart';

class RotationM extends StatefulWidget {
  final String uid;
  final int rotationNo;
  RotationM({this.uid,this.rotationNo});
  @override
  _RotationMState createState() => _RotationMState();
}

class _RotationMState extends State<RotationM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('JNMCH eLogBook'),
          backgroundColor: Colors.teal
      ),
      body:
      Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 10.0),
        child: ListView(
          children: <Widget>[
            Text('Rotation ${widget.rotationNo+1}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25.0,
                color:  Colors.teal,
                decoration: TextDecoration.underline,
              ),),
            SizedBox(height: 20.0),
            Card(
              color: Colors.cyan[50],
              shadowColor: Colors.blueGrey,

              child:ListTile(
                leading: const Icon(Icons.book, size: 35, color: Colors.blue,),
                title: const Text("Learning Objectives and Learning Contract", style: TextStyle(color: Colors.black),),
                subtitle: const Text(""),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CaseRoutineScreenM(uid: widget.uid,rotationNo: widget.rotationNo,)),
                  );
                },
              ),
            ),
            Card(
              color: Colors.cyan[50],
              shadowColor: Colors.blueGrey,
              child:ListTile(
                leading: const Icon(Icons.assignment, size: 35, color: Colors.blue,),
                title: const Text("Log of Cases/Procedures", style: TextStyle(color: Colors.black),),
                subtitle: const Text(""),
                //selected: true,


                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogOfCasesM(uid: widget.uid,rotationNo: widget.rotationNo,)),
                  );
                },
              ),
            ),
            Card(
              color: Colors.cyan[50],
              shadowColor: Colors.blueGrey,
              child:ListTile(
                leading: const Icon(Icons.pages, size: 35, color: Colors.blue,),
                title: const Text("Case Report", style: TextStyle(color: Colors.black),),
                subtitle: const Text(""),
                //selected: true,


                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CaseReportM(uid: widget.uid,rotationNo: widget.rotationNo,)),
                  );
                },
              ),
            ),
            Card(
              color: Colors.cyan[50],
              shadowColor: Colors.blueGrey,
              child:ListTile(
                leading: const Icon(Icons.check, size: 35, color: Colors.blue,),
                title: const Text("End of Rotation Assesment of Competencies by Unit Head", style: TextStyle(color: Colors.black),),
                subtitle: const Text(""),
                //selected: true,


                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EndRotationM(uid: widget.uid,rotationNo: widget.rotationNo,)),
                  );
                },
              ),
            ),
            Card(
              color: Colors.cyan[50],
              shadowColor: Colors.blueGrey,
              child:ListTile(
                leading: const Icon(Icons.animation, size: 35, color: Colors.blue,),
                title: const Text("Reflection", style: TextStyle(color: Colors.black),),
                subtitle: const Text(""),
                //selected: true,


                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReflectionM(uid: widget.uid,rotationNo: widget.rotationNo,)),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}