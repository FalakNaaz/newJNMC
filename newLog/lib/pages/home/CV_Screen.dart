import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/home/update_cv.dart';
import 'package:jmnchelogbook/pages/home/CV.dart';

class CV_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Scaffold(
              body: SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                  child: UpdateCV(),
                ),
              ),
            );
          });
     /* return DraggableScrollableSheet(
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            color: Colors.blue[100],
            child: ListView.builder(
              controller: scrollController,
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text('Item $index'));
              },
            ),
          );
        },
      );*/
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
