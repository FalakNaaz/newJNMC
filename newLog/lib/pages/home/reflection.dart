import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/home/reflectionInfo.dart';
import 'package:jmnchelogbook/pages/home/updateReflection.dart';

class Reflection extends StatelessWidget {
  final int rotationNo;
  Reflection({this.rotationNo});
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                  child: UpdateReflection(rotationNo: rotationNo),
                ),
              ),
            );
          });
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Reflection'),
          backgroundColor: Colors.teal,
        ),
        body: ReflectionInfo(rotationNo: rotationNo),
        floatingActionButton:FloatingActionButton(
          backgroundColor:  Colors.teal,
          child: Icon(Icons.edit),
          onPressed: () => _showSettingsPanel(),
        )

    );
  }
}
