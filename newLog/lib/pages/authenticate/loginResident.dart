/*
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:jmnchelogbook/services/auth.dart';
class LogInResident extends StatefulWidget{
  @override
  _LogInResidentState createState() => _LogInResidentState();
}

class _LogInResidentState extends State<LogInResident> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: 330,
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
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: <Widget>[
              IconButton(icon: Icon(Icons.https), onPressed: () {},),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 4, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Password'
                    ),
                  ),
                ),
              )
            ],),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ButtonTheme(
              minWidth: 200,
              height: 50,
              child: RaisedButton(onPressed: () async {

               // Navigator.pushNamed(context, '/home');
                final AuthService _auth = AuthService();
                dynamic result = await _auth.signInAnon();
                if(result == null)
                 {
                   print('error signing in');
                 }
                else
                  {
                    print('signed in');
                    print(result.uid);
                    Navigator.pushNamed(context, '/home');
                  }

              },
                color: Color.fromRGBO(146, 180, 237, 1),
                child:
                Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),
                ),
              ),
            ),
          ),
        ],
    );
  }
}

*/



/*
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
*/
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:jmnchelogbook/services/auth.dart';
import 'package:jmnchelogbook/shared/loading.dart';

class LogInResident extends StatefulWidget {
  final Function toggleView;
  final Function toggleScreen;
  LogInResident({this.toggleView, this.toggleScreen});
  @override
  _LogInResidentState createState() => _LogInResidentState();
}

class _LogInResidentState extends State<LogInResident> {
  bool loading = false;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return  loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
      ),*/
      body: Container(
        //padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              //SizedBox(height: 30.0),
              Container(
                height: 20,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Icon1.png'), fit: BoxFit.fill )),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ButtonTheme(
                  minWidth: 200,
                  height: 50,
                  child: RaisedButton(
                      color: Color.fromRGBO(146, 180, 237, 1),
                      child: Text('Switch to mentor',  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,)),
                      onPressed: () {
                        widget.toggleScreen();
                      }
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                decoration: InputDecoration(
                    hintText: 'Email ID'
                ),
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.length < 6 ? 'Enter a password 6+ char long' : null,
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 10.0),
              Text(error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),

              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(0),
                child: ButtonTheme(
                  minWidth: 200,
                  height: 50,
                  child: RaisedButton(onPressed: () async {
                    if(_formKey.currentState.validate())
                    {
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);

                      //print('valid');
                      if(result == null)
                      {
                        setState(() =>
                        error = 'Incorrect email or password!');
                        loading = false;
                      }else {
                        //Navigator.pushNamed(context, '/home');
                      }
                    }

                    // Navigator.pushNamed(context, '/home');
                  /*  final AuthService _auth = AuthService();
                    dynamic result = await _auth.signInAnon();
                    if(result == null)
                    {
                      print('error signing in');
                    }
                    else
                    {
                      print('signed in');
                      print(result.uid);
                      print(password);
                      print(email);
                      Navigator.pushNamed(context, '/home');
                    }*/

                  },
                    color: Color.fromRGBO(146, 180, 237, 1),
                    child:
                    Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),
                    ),
                  ),
                ),
              ),
             // SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ButtonTheme(
                  minWidth: 200,
                  height: 50,
                  child: RaisedButton(
                      color: Color.fromRGBO(146, 180, 237, 1),
                      child: Text('Register',  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,)),
                      onPressed: () {
                        widget.toggleView();
                      }
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}