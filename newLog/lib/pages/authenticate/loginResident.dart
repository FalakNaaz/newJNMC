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
    setState(()=>loading = true);
    if (validate()) {
      try {
         await _auth.signInWithEmailAndPassword(email, password);
      }
      catch (e) {
        print(e);
        setState(() {
          loading = false;
          warning = e.message;
        });
      }
    }
  }

  void forgetPassword() async {
    if (validate()) {
      try {
         await _auth.sendPasswordRestEmail(email);
        warning = "Password reset link has been sent to $email";
        setState(() {

        });
      }
      catch (e) {
        //print(e);
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
      resizeToAvoidBottomInset: true,
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
                padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 40),
                child: TextFormField(
                  validator: EmailValidator.validate,
                  style: TextStyle(fontSize: 18.0),
                  decoration: buildSignInInputDecoration("Email"),
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
                padding:const EdgeInsets.symmetric(vertical: 25.0, horizontal: 40),
                child: TextFormField(
                  validator: PasswordValidatorLogin.validate,
                  style: TextStyle(fontSize: 18.0),
                  decoration: buildSignInInputDecoration("Password"),
                  obscureText: true,
                  onSaved: (value) => password = value,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
              ),
              SizedBox(height: _height *0.03),

              Padding(
                padding: const EdgeInsets.all(0),
                child: ButtonTheme(
                  minWidth: 170,
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
                          fontSize: 18,),
                      ),

                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              ButtonTheme(
                minWidth: 170,
                height: 50,
                child: RaisedButton(
                    onPressed:() {
                      forgetPassword();
                    },
                    color: Colors.greenAccent,
                    child:
                    Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,),
                    ),

                ),
              ),
              // SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 30,),
                child: ButtonTheme(
                  child: FlatButton(
                      child: Text('Need an account? Register !', style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,)),
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

  buildSignInInputDecoration(String s) {
    return InputDecoration(
      errorMaxLines: 3,
      hintText: s,
      filled: true,
      fillColor: Colors.white,
      focusColor: Colors.white,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0)),
      contentPadding: const EdgeInsets.only(
          left: 18.0, bottom: 10.0, top: 10.0),
    );
  }
}