import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/services/auth.dart';
import 'package:jmnchelogbook/shared/loading.dart';
import '';
import 'package:jmnchelogbook/pages/authenticate/authenticateResident.dart';

import '../wrapper.dart';

class ForgetPassword extends StatefulWidget {

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool loading = false;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
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
         await _auth.sendPasswordRestEmail(email);
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
    final _height = MediaQuery
        .of(context)
        .size
        .height;

    final _width = MediaQuery
        .of(context)
        .size
        .width;
    return loading ? Loading : Scaffold(
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

              SizedBox(height: _height * 0.01),

              Padding(
                padding: const EdgeInsets.all(0),
                child: ButtonTheme(
                  minWidth: 200,
                  height: 50,
                  child: RaisedButton(
                      onPressed: () {
                        setState((){
                          warning = "Check your email to change your password";

                        });
                        submit();

                      },

                      color: Colors.greenAccent,
                      child:
                      Text(
                        'Submit',
                        style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,),
                      )
                      ,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                              color: Color.fromRGBO(146, 180, 237, 1))
                      )
                  ),
                ),
              ),
              FlatButton(
                child: Text("Sign In", style:  TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.pushNamed(context,'/LoginAsResident');
                },
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
    return AutoSizeText("Reset Password",
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