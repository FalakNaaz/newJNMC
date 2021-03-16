import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/MentorPages/feedback1InfoM.dart';
import 'package:jmnchelogbook/pages/home/feedback1Info.dart';
import 'package:jmnchelogbook/pages/home/summaryInfo.dart';
import 'package:jmnchelogbook/pages/home/updateFeedback.dart';
import 'package:jmnchelogbook/pages/home/updateSummary.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:jmnchelogbook/shared/loading.dart';
import 'package:provider/provider.dart';
class FeedbackScreenM extends StatelessWidget {
  final String uid;
  FeedbackScreenM({this.uid});
  Widget build(BuildContext context) {
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
                  title: Text('Feedback'),
                  backgroundColor: Colors.teal,
                ),
                body: FeedbackInfoM(uid: uid),
            );
          } else {
            return Loading();
          }
        });
  }
}

