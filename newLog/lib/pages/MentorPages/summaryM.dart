import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/MentorPages/summaryInfoM.dart';
import 'package:jmnchelogbook/pages/home/summaryInfo.dart';
import 'package:jmnchelogbook/pages/home/updateSummary.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:jmnchelogbook/shared/loading.dart';
import 'package:provider/provider.dart';
class SummaryScreenM extends StatelessWidget {
  final String uid;
  SummaryScreenM({this.uid});
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    return StreamBuilder<Summary>(
        stream: DatabaseService(uid: uid).summaryData,
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
                body: SummaryInfoM(uid: uid,),

            );
          } else {
            return Loading();
          }
        });
  }
}

