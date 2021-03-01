import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/MentorPages/AdminHomePage.dart';
import 'package:jmnchelogbook/pages/MentorPages/MentorHomePage.dart';
import 'package:jmnchelogbook/pages/PdfFirebase/FirstPage2.dart';
import 'package:jmnchelogbook/pages/authenticate/authenticateResident.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    return StreamBuilder<RoleData>(
        stream: DatabaseService(uid: user?.uid).roleData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //print(snapshot.data.role);
            if(user!=null){
              if((snapshot.data.role == 'mentor') ){
                return MentorHomePage();
              }
              else if((snapshot.data.role == 'admin')){
                return AdminHomePage();
              }
              else{
                return MyApp2();
              }
            } else {
              return AuthenticateResident();
            }
          } else {
            return (user == null) ? AuthenticateResident() : Loading();
          }
        });
  }
}
