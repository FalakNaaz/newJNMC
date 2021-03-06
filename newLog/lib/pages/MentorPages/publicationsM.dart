import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/MentorPages/publicationsInfoM.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/loading.dart';

class PublicationsScreenM extends StatelessWidget {
  final String uid;
  PublicationsScreenM({this.uid});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PublicationsData>(
        stream: DatabaseService(uid: uid).publicationsData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            PublicationsData publicationsData = snapshot.data;
            print(publicationsData.approvalReady);
            return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  title: Text('Publications'),
                  backgroundColor: Colors.teal,
                ),
                body: PublicationsInfoM(uid: uid),

            );
          } else {
            return Loading();
          }
        });
  }
}
