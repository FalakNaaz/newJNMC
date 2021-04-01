import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jmnchelogbook/services/auth.dart';
import 'package:jmnchelogbook/services/database.dart';
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
  String role = '';
  String _error;
  bool loading = false;
  String key = '';

  @override
  void initState(){
    super.initState();
    role = "Choose your role";
  }

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
    var residentKey = await DatabaseService().getResidentSecurityKey();
    var mentorKey = await DatabaseService().getMentorSecurityKey();
    if (validate()) {
      try {
        if(role == 'resident'){
          if(key != residentKey){
            throw new Exception('Security key for resident not matched');
          }
        } else{
          if(key != mentorKey){
            throw new Exception('Security key for mentor not matched');
          }
        }
         await _auth.registerWithEmailAndPassword(email, password,role, name);
      }catch (e) {
        setState(() {
          _error = e.message;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return loading? Loading() :Scaffold(
      resizeToAvoidBottomInset : true,
      backgroundColor: Colors.teal,

      body: SingleChildScrollView(

        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: _height * 0.025),
              showAlert(),
              SizedBox(height: _height * 0.06),
              buildHeader(),
              SizedBox(height: _height *0.05),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40),
                child: TextFormField(
                  validator: NameValidator.validate,
                  style: TextStyle(fontSize: 18.0),
                  decoration: buildSignUpInputDecoration("Name"),
                  onSaved: (value) => name = value,
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                ),
              ),
              SizedBox(height: _height *0.05),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40),
                child: TextFormField(
                  validator: EmailValidator.validate,
                  style: TextStyle(fontSize: 18.0),
                  decoration: buildSignUpInputDecoration("Email"),
                  onSaved: (value) => email = value,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
              ),
              SizedBox(height: _height *0.05),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40),
                child: TextFormField(

                  validator: PasswordValidatorRegister.validate,
                  style: TextStyle(fontSize: 18.0),
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
              SizedBox(height: _height *0.05),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40),
                child: TextFormField(
                  validator: (val) => val != password ? 'Confirm password doesn\'t match' : null,
                  style: TextStyle(fontSize: 18.0),
                  decoration: buildSignUpInputDecoration("Confirm Password"),
                  obscureText: true,
                  onSaved: (value) => confirmPassword = value,
                  onChanged: (val) {
                    setState(() {
                      confirmPassword = val;
                    });
                  },
                ),
              ),
              SizedBox(height: _height *0.05),
              Container(
                width: _width*0.80,
                height: _height*0.1,
                color: Colors.teal,
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: new DropdownButtonFormField<String>(
                      validator: (val) => val == 'Choose your role' ? 'Choose your role' : null,
                      iconEnabledColor: Colors.white,
                      iconSize: 35,
                      value:role,
                      items:
                      <String>['Choose your role', 'resident', 'mentor',].map((String value) {
                        return new DropdownMenuItem<String>(

                          value: value,
                          child: new Text(value,style: TextStyle(color: Colors.white,fontSize: 18.0),),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState(() {
                          role = newValueSelected;
                        });
                      },
                      dropdownColor: Colors.teal,
                    ),
                  ),
                ),
              ),
              SizedBox(height: _height *0.05),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40),
                child: TextFormField(
                  validator: (val) => val == '' ? 'Security key can\'t be empty ' : null,
                  style: TextStyle(fontSize: 18.0),
                  decoration: buildSignUpInputDecoration("Security Key"),
                  obscureText: true,
                  onSaved: (value) => key = value,
                  onChanged: (val) {
                    setState(() {
                      key = val;
                    });
                  },
                ),
              ),
              SizedBox(height:_height*0.05),

              ButtonTheme(
                minWidth: 150,
                height: 50,
                child: RaisedButton(onPressed: submit,
                    color: Colors.greenAccent,
                    child:
                    Text(
                      'Submit',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,),
                    ),
                  /*  shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Color.fromRGBO(146, 180, 237, 1))
                    )*/
                ),
              ),

              // SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ButtonTheme(
                  minWidth: 200,
                  height: 50,
                  child: FlatButton(
                      child: Text('Already have an account? Sign In!', style: TextStyle(
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
    if (_error!= null) {
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
            Expanded(child: AutoSizeText(_error, maxLines: 3,)),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _error = null;
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
    return AutoSizeText("Register",
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
      errorMaxLines: 2,
      errorStyle: TextStyle(
        fontSize: 12.0,
      ),
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