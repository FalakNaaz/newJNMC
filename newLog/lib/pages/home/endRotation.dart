import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/home/endRotationInfo.dart';
import 'package:jmnchelogbook/pages/home/updateEndRotation.dart';

class EndRotation extends StatelessWidget {
  final int rotationNo;
  EndRotation({this.rotationNo});
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
                  child: UpdateEndRotation(rotationNo: rotationNo),
                ),
              ),
            );
          });
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('JNMCH eLogBook'),
          backgroundColor: Colors.teal,
        ),
        body: EndRotationInfo(rotationNo: rotationNo),
        floatingActionButton:FloatingActionButton(
          backgroundColor:  Colors.teal,
          child: Icon(Icons.edit),
          onPressed: () => _showSettingsPanel(),
        )

    );
  }
}
