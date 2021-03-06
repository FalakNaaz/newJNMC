import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/publicationsInfo.dart';
import 'package:jmnchelogbook/pages/home/updatePublications.dart';
import 'package:jmnchelogbook/pages/home/update_cv.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:jmnchelogbook/shared/loading.dart';
import 'package:provider/provider.dart';

class PublicationsScreen extends StatelessWidget {
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
                  child: UpdatePublications(),
                ),
              ),
            );
          });
    }

    final user = Provider.of<User>(context);
    return StreamBuilder<PublicationsData>(
        stream: DatabaseService(uid: user.uid).publicationsData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            PublicationsData publicationsData = snapshot.data;
            print(publicationsData.approvalReady);
            return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  // Here we take the value from the MyHomePage object that was created by
                  // the App.build method, and use it to set our appbar title.
                  title: Text('Publications'),
                  backgroundColor: Colors.teal,
                  /*actions: <Widget>[
                    (publicationsData.isApproved != false)
                        ? FlatButton.icon(
                            onPressed: () => _showSettingsPanel(),
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Edit Publications',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ))
                        : Icon(Icons.check_circle)
                  ],*/
                ),
                body: PublicationsInfo(),
                floatingActionButton: (publicationsData.isApproved == false) ? FloatingActionButton(
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
