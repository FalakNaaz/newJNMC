import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/home/update_cv.dart';
import 'package:jmnchelogbook/pages/home/CV.dart';

class CV_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                child: UpdateCV(),
              ),
            );
          });
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Curriculum Vitae'),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () => _showSettingsPanel(),
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              label: Text(
                'Edit CV',
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
        ],
      ),
      body: CV_Info(),
    );
  }
}
