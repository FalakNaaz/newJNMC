import 'package:flutter/material.dart';

InputDecoration textInputDecoration(String hintText) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    contentPadding: EdgeInsets.all(12.0),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(273, 146, 158, 1), width: 2.0),
    ),
    hintText: hintText,
  );
}