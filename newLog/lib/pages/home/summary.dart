import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/summaryInfo.dart';
import 'package:jmnchelogbook/pages/home/updateSummary.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:jmnchelogbook/shared/loading.dart';
import 'package:provider/provider.dart';
class SummaryScreen extends StatelessWidget {
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
                  child: UpdateSummary(),
                ),
              ),
            );
          });
    }

    final user = Provider.of<User>(context);
    return StreamBuilder<Summary>(
        stream: DatabaseService(uid: user.uid).summaryData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Summary summaryData = snapshot.data;
            print(summaryData.isApproved);
            return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  // Here we take the value from the MyHomePage object that was created by
                  // the App.build method, and use it to set our appbar title.
                  title: Text('Summary'),
                  backgroundColor: Colors.teal,
                ),
                body: SummaryInfo(),
                floatingActionButton: (summaryData.isApproved == false) ? FloatingActionButton(
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.edit),
                  onPressed: () => _showSettingsPanel(),
                ) :  FloatingActionButton(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.edit),
                  onPressed: () {showMyDialog(context);},
                )

            );
          } else {
            return Loading();
          }
        });
  }
}

