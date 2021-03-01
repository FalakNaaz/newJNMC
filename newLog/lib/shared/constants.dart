import 'package:flutter/material.dart';
Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('You can\'t edit this document!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This document has been approved by your mentor'),
              Text('If you still want to edit, tell your mentor to unapprove!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
InputDecoration textInputDecoration(String labelText) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    contentPadding: EdgeInsets.all(8.0),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(273, 146, 158, 1), width: 2.0),
    ),
    labelText: labelText,
    labelStyle: TextStyle(
      fontSize: 16.0,
      color: Color.fromRGBO(273, 146, 158, 1),
    ),
  );
}
TextStyle textStyle(){
  return TextStyle(
    fontSize: 20,
    color:  Colors.black,
  );
}
class Constants{
  Constants._();
  static const double padding =20;
  static const double avatarRadius =45;
}