import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'login.dart';

class BaseApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: 350,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Icon1.png'), fit: BoxFit.fill )),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: <Widget>[
              IconButton(icon: Icon(Icons.person), onPressed: () {},),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 4, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Enrollment Number'
                    ),
                  ),
                ),
              )
            ],),
          ),
          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: ButtonTheme(
              minWidth: 200,
              height: 50,
              child: RaisedButton(onPressed: () {
                Navigator.pushNamed(context, '');
              },
                color: Color.fromRGBO(146, 180, 237, 1),
                child:
                Text(
                  'Send Login Details',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: ButtonTheme(
              minWidth: 200,
              height: 50,
              child: RaisedButton(onPressed: () {
                Navigator.pushNamed(context, '/LoginAsResident');
              },
                color: Color.fromRGBO(273, 146, 158, 1),
                child:
                Text(
                  'LogIn As Resident',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
