import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jmnchelogbook/pages/home/caseReport.dart';
import 'package:jmnchelogbook/pages/home/caseroutines.dart';
import 'package:jmnchelogbook/pages/home/endRotation.dart';
import 'package:jmnchelogbook/pages/home/reflection.dart';
class MentorRotation extends StatefulWidget {
  String uid;
  final int rotationNo;
  MentorRotation({this.uid, this.rotationNo});
  @override
  _MentorRotationState createState() => _MentorRotationState();
}

class _MentorRotationState extends State<MentorRotation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('JNMCH eLogBook'),
          backgroundColor: Color.fromRGBO(273, 146, 158, 1)
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
                color:  Color.fromRGBO(273, 146, 158, 1),
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
                //selected: true,


                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CaseroutineScreen(rotationNo: widget.rotationNo,)),
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


                onTap: () { Navigator.pushNamed(context, '/logofcases');},
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
                    MaterialPageRoute(builder: (context) => CaseReport(rotationNo: widget.rotationNo,)),
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
                    MaterialPageRoute(builder: (context) => EndRotation(rotationNo: widget.rotationNo,)),
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
                    MaterialPageRoute(builder: (context) => Reflection(rotationNo: widget.rotationNo,)),
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
