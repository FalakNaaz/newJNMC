import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/home/caseReportInfo.dart';
import 'package:jmnchelogbook/pages/home/updateCaseReport.dart';

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
          title: Text('Case Report'),
          backgroundColor: Colors.teal,
        ),
        body: CaseReportInfo(rotationNo: rotationNo),
        floatingActionButton:FloatingActionButton(
          backgroundColor:  Colors.teal,
          child: Icon(Icons.edit),
          onPressed: () => _showSettingsPanel(),
        )

    );
  }
}
