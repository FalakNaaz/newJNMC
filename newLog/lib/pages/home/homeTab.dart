import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/caseroutines.dart';
import 'package:jmnchelogbook/pages/home/rotation.dart';
import 'package:jmnchelogbook/services/auth.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int num=0;
  final AuthService _auth = AuthService();

  Widget Rotations(int n){
    List<int> iconCode = [59470,59471, 59466, 59467,59468,59469,59467, ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           //Icon(IconData(59470,fontFamily: 'MaterialIcons')),
            for(int i=0; i<n; i++)
              RotationNo(Icon(IconData(iconCode[i],fontFamily:'MaterialIcons', ),), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Rotation(rotationNo: i,)),
                );
              }),


          ],
        )

  ],
      );
}
  Widget RotationNo(Icon icon, VoidCallback onPressed){

    return IconButton(
      icon:icon,
      onPressed: onPressed,
      color: Colors.teal,
      iconSize: 45,
    );
  }

@override
Widget build(BuildContext context) {
  final user = Provider.of<User>(context);
  /*Firestore.instance.collection('Rotation2')
      .document(user.uid)
      .collection('log')
      .document('Rotation0')
  .collection('allPatients')
  .document('patient1')
      .get().then((querySnapshot) {
    print('querySnapshot.data is');
    print(querySnapshot.data);
  });*/
  return SafeArea(
    child: Column(
      children: <Widget>[
        Container(
          color: Colors.teal,
          height: MediaQuery
              .of(context)
              .size
              .height / 3,
          width: MediaQuery
              .of(context)
              .size
              .height,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    // color: Colors.red[500],
                  ),
                  borderRadius:
                  BorderRadius.all(Radius.circular(30))),
              child: Center(
                child: Text(
                  "Keep your Log Book with yourselves!",
                  //alignment:Alignment(10,20),
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: "DancingScript",
                    color: Colors.teal[800],
                  ),

                ),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.teal[400],
          height: 50,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 110.0),
                  child: Text(
                    "Rotations",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold),
                  ),
                ),
               /* IconButton(
                  icon: new Icon(Icons.library_add),
                  onPressed: ()async {
                    var user = await FirebaseAuth.instance.currentUser();
                    setState(() {
                    (num<6)? num++ : num;
                  });
                    await DatabaseService(uid: user.uid).createRotations(num);
                  //print(user.uid);
                  },
                  color: Colors.white,
                  iconSize: 35,
                ),*/
              ]),
        ),
        Container(
          //color: Colors.white,
          height: 260,
          child: Rotations(6),
          /*Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: new Icon(Icons.looks_one),
                  onPressed: () {
                    Navigator.pushNamed(context, '/rotation');
                  },
                  color: Colors.teal,
                  iconSize: 45,
                ),
                IconButton(
                  icon: new Icon(Icons.looks_two),
                  onPressed: () {},
                  color: Colors.teal,
                  iconSize: 45,
                ),
                IconButton(
                  icon: new Icon(Icons.looks_3),
                  onPressed: () {},
                  color: Colors.teal,
                  iconSize: 45,
                ),
                IconButton(
                  icon: new Icon(Icons.looks_4),
                  onPressed: () {},
                  color: Colors.teal,
                  iconSize: 45,
                ),
                // IconButton(icon: new Icon(Icons.looks_5), onPressed: (){}, color: Colors.green,iconSize: 35,),
                // IconButton(icon: new Icon(Icons.looks_6), onPressed: (){}, color: Colors.green,iconSize: 35,),
              ]),*/
        ),
      ],
    ),
  );
}}
