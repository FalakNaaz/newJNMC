import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/MentorPages/summaryM.dart';
import 'package:jmnchelogbook/pages/authenticate/authenticateResident.dart';
import 'package:jmnchelogbook/pages/home/blueprint.dart';
//import 'file:///F:/my_project/JNMCH-eLogBook-master/JNMCH-eLogBook-master/newLog/lib/pages/home/rime.dart';
import 'package:jmnchelogbook/pages/home/caseReport.dart';
import 'package:jmnchelogbook/pages/home/feedback1.dart';
import 'package:jmnchelogbook/pages/home/publications.dart';
import 'package:jmnchelogbook/pages/home/rime.dart';
import 'package:jmnchelogbook/pages/home/summary.dart';
import 'package:jmnchelogbook/pages/home/uploadScreen.dart';
import 'package:jmnchelogbook/pages/home/uploads.dart';
import 'package:jmnchelogbook/services/auth.dart';
import 'pages/authenticate/registerResident.dart';
import 'pages/authenticate/loginResident.dart';
import 'pages/home/home.dart';
import 'pages/home/thesis.dart';
import 'pages/home/test.dart';
import 'pages/home/rotation.dart';
import 'pages/home/caseroutines.dart';
import 'pages/home/logofcases.dart';
import 'pages/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/CV_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    //User user = Provider.of<User>(context);
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(
              //brightness: Brightness.light,
              //primaryColor: Color.fromRGBO(146, 180, 237, 1),
              //accentColor: hexToColor(0xFCA311),
              //splashColor: hexToColor(0x3BB273),

              ),
          home: Wrapper(),
          routes: <String, WidgetBuilder>{
            '/LoginAsResident': (context) => LogInResident(),
            '/BaseApp': (context) => BaseApp(),
            '/home': (context) => MyApp2(),
            '/rotation': (context) => Rotation(),
            '/casereport': (context) => CaseReport(),
            '/caserotation': (context) => CaseroutineScreen(),
            '/logofcases': (context) => LogOfCases(),
            '/CV': (context) => CV_Screen(),
            '/publications': (context) => PublicationsScreen(),
            '/authenticate': (context) => AuthenticateResident(),
            '/imageCapture' : (context) => ImageCapture(),
            '/uploadScreen': (context) => UploadScreen(),
            '/rime': (context) => Rime(),
            '/blueprint': (context) => Blueprint(),
            '/summary': (context) => SummaryScreen(),
            '/feedback': (context) => FeedbackScreen(),
            '/summaryM': (context) => SummaryScreenM(),
          }),
    );
  }
}
