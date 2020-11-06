import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class Rotation extends StatefulWidget {
  @override
  _RotationState createState() => _RotationState();
}

class _RotationState extends State<Rotation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('JNMCH eLogBook'),
        backgroundColor: Color.fromRGBO(273, 146, 158, 1)
      ),
      body: 
      Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 8.0),
        child: ListView(
          children: <Widget>[
            Card(
              color: Colors.cyan[50],
              shadowColor: Colors.blueGrey,
            child:ListTile(
              leading: const Icon(Icons.book, size: 35, color: Colors.blue,),
              title: const Text("Learning Objectives and Learning Contract", style: TextStyle(color: Colors.black),),
              subtitle: const Text(""),
              trailing: const Icon(Icons.more_vert),
              //selected: true,


              onTap: () { Navigator.pushNamed(context, '/caserotation');},
              ),
            ),
             Card(
              color: Colors.cyan[50],
              shadowColor: Colors.blueGrey,
            child:ListTile(
              leading: const Icon(Icons.assignment, size: 35, color: Colors.blue,),
              title: const Text("Log of Cases/Procedures", style: TextStyle(color: Colors.black),),
              subtitle: const Text(""),
              trailing: const Icon(Icons.more_vert),
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
              trailing: const Icon(Icons.more_vert),
              //selected: true,


              onTap: () { Navigator.pushNamed(context, '/casereport');},
              ),
            ),
              Card(
              color: Colors.cyan[50],
              shadowColor: Colors.blueGrey,
            child:ListTile(
              leading: const Icon(Icons.check, size: 35, color: Colors.blue,),
              title: const Text("End of Rotation Assesment of Competencies by Unit Head", style: TextStyle(color: Colors.black),),
              subtitle: const Text(""),
              trailing: const Icon(Icons.more_vert),
              //selected: true,


              onTap: () { Navigator.pushNamed(context, '/caseendofrotation');},
              ),
            ),
              Card(
              color: Colors.cyan[50],
              shadowColor: Colors.blueGrey,
            child:ListTile(
              leading: const Icon(Icons.check, size: 35, color: Colors.blue,),
              title: const Text("Postgraduate Formative Assessment Test", style: TextStyle(color: Colors.black),),
              subtitle: const Text(""),
              trailing: const Icon(Icons.more_vert),
              //selected: true,


              onTap: () { Navigator.pushNamed(context, '/casereflection');},
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}