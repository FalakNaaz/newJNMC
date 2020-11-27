import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/CV_model.dart';

class CV_Tile extends StatelessWidget {
  final CV_model CV_item;
  CV_Tile({this.CV_item});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.red,
          ),
          title: Text(CV_item.name),
          subtitle: Text(CV_item.facultyno),
        ),
      ),
    );
  }
}
