import 'package:flutter/material.dart';

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