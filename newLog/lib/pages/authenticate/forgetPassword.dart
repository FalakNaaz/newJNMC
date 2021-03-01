import 'package:flutter/material.dart';
import 'package:jmnchelogbook/services/auth.dart';
import 'package:jmnchelogbook/shared/loading.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool loading = false;
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    final _width = MediaQuery.of(context).size.width;
    return loading ? Loading: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(),

    );
  }
}
