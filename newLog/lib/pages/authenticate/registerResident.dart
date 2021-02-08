import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jmnchelogbook/services/auth.dart';
import 'package:jmnchelogbook/shared/loading.dart';

class BaseApp extends StatefulWidget {
  final Function toggleView;
  BaseApp({this.toggleView});
  @override
  _BaseAppState createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  // text field state
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String role='';
  String error = '';
  bool loading = false;

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
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter your full name' : null,
                decoration: InputDecoration(
                    hintText: 'Full Name'
                ),
                onChanged: (val) {
                  setState(() => name = val);
                },
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
              TextFormField(
                validator: (val) => val != password ? 'confirm password doesn\'t match' : null,
                decoration: InputDecoration(
                    hintText: 'Confirm Password'
                ),
                obscureText: true,
                onChanged: (val) {
                  setState(() => confirmPassword = val);
                },
              ),
              SizedBox(height: 10.0),

              TextFormField(
                validator: (val) => val.length <= 0 ? 'Role cannot be empty' : null,
                decoration: InputDecoration(
                    hintText: 'role'
                ),
                onChanged: (val) {
                  setState(() => role = val);
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
                    // Navigator.pushNamed(context, '/home');
                    /*final AuthService _auth = AuthService();
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
                    if(_formKey.currentState.validate())
                      {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password,role, name);
                        if(result == null)
                          {
                            setState(() => error = 'Please supply valid email');
                            loading = false;
                          }else {
                          //Navigator.pushNamed(context, '/home');
                        }
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

              // SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ButtonTheme(
                  minWidth: 200,
                  height: 50,
                  child: RaisedButton(
                      color: Color.fromRGBO(146, 180, 237, 1),
                      child: Text('Login',  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,)),
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