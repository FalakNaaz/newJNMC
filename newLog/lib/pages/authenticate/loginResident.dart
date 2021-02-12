import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:jmnchelogbook/services/auth.dart';
import 'package:jmnchelogbook/shared/loading.dart';

class LogInResident extends StatefulWidget {
  final Function toggleView;
  LogInResident({this.toggleView});
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
  String hint = '';
  String warning;


  bool validate(){
    final form = _formKey.currentState;
    form.save();
    if(form.validate()){
      form.save();
      return true;
    }else{
      return false;
    }
  }
  void submit() async {
    if (validate()) {
      try {
          String uid = await _auth.signInWithEmailAndPassword(email, password);
          print("Signed in with Id $uid");
        }
      catch (e) {
        print(e);
        setState(() {
          warning = e.message;
        });
      }
    }
  }

  void forgetPassword() async {
    if (validate()) {
      try {
        String uid = await _auth.sendPasswordRestEmail(email);
        warning = "Password reset lik has been sent to $email";
      }
      catch (e) {
        print(e);
        setState(() {
          warning = e.message;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: _height * 0.025),
                showAlert(),
                SizedBox(height: _height * 0.2),
                buildHeader(),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    validator: EmailValidator.validate,
                    style: TextStyle(fontSize: 22.0),
                    decoration: buildSignUpInputDecoration("Email"),
                    onSaved: (value) => email = value,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                ),
                SizedBox(height: _height *0.01),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    validator: PasswordValidator.validate,
                    style: TextStyle(fontSize: 22.0),
                    decoration: buildSignUpInputDecoration("Password"),
                    obscureText: true,
                    onSaved: (value) => password = value,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                ),
                SizedBox(height: _height *0.01),

                Padding(
                  padding: const EdgeInsets.all(0),
                  child: ButtonTheme(
                    minWidth: 200,
                    height: 50,
                    child: RaisedButton(
                      onPressed:() {
                        submit();
                      },
                      color: Colors.greenAccent,
                      child:
                      Text(
                        'Submit',
                        style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Color.fromRGBO(146, 180, 237, 1))
                      )
                    ),
                  ),
                ),

                FlatButton(
                  child: Text("Forget Password?", style:  TextStyle(color: Colors.white),),
                  onPressed: () {
                      forgetPassword();

                  },
                ),
                // SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30,),
                  child: ButtonTheme(
                    child: FlatButton(
                        child: Text('Need an account? Register !', style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,)),
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

  showAlert() {
    if (warning != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(child: AutoSizeText(warning, maxLines: 3,)),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      warning = null;
                    });
                  }
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(height: 0,);
  }

  buildHeader() {
    return AutoSizeText("Sign In",
        maxLines: 1,
        textAlign: TextAlign.center,
        style: (TextStyle(
          fontSize: 45.0,
          color: Colors.white,
        )
        )
    );
  }

  buildSignUpInputDecoration(String s) {
    return InputDecoration(
      hintText: s,
      filled: true,
      fillColor: Colors.white,
      focusColor: Colors.white,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0)),
      contentPadding: const EdgeInsets.only(
          left: 20.0, bottom: 10.0, top: 10.0),
    );
  }
}