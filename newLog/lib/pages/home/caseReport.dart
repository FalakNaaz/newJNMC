import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/caseReportInfo.dart';
import 'package:jmnchelogbook/pages/home/caseroutineInfo.dart';
import 'package:jmnchelogbook/pages/home/updateCaseReport.dart';
import 'package:jmnchelogbook/pages/home/updateCaseroutine.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class CaseReport extends StatelessWidget {
  final int rotationNo;
  CaseReport({this.rotationNo});
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
                  EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
                  child: UpdateCaseReport(rotationNo: rotationNo),
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
          backgroundColor: Color.fromRGBO(273, 146, 158, 1),
        ),
        body: CaseReportInfo(rotationNo: rotationNo),
        floatingActionButton:FloatingActionButton(
          backgroundColor:  Color.fromRGBO(273, 146, 158, 1),
          child: Icon(Icons.edit),
          onPressed: () => _showSettingsPanel(),
        )

    );
  }
}
