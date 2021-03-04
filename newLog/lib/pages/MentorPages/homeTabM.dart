import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/MentorPages/rotationM.dart';
import 'package:jmnchelogbook/pages/home/rotation.dart';

class HomeTabM extends StatefulWidget {
  final String uid;
  HomeTabM({this.uid});
  @override
  _HomeTabMState createState() => _HomeTabMState();
}

class _HomeTabMState extends State<HomeTabM> {
  int num = 0;

  Widget Rotations(int n) {
    List<int> iconCode = [
      59470,
      59471,
      59466,
      59467,
      59468,
      59469,
      59467,
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (int i = 0; i < n; i++)
              RotationNo(
                  Icon(
                    IconData(
                      iconCode[i],
                      fontFamily: 'MaterialIcons',
                    ),
                  ), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RotationM(uid: widget.uid,
                        rotationNo: i,
                      )),
                );
              }),
          ],
        )
      ],
    );
  }

  Widget RotationNo(Icon icon, VoidCallback onPressed) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      color: Colors.teal,
      iconSize: 45,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.teal,
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      // color: Colors.red[500],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
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
                    padding:
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 110.0),
                    child: Text(
                      "Rotations",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
          ),
          Container(
            //color: Colors.white,
            height: 260,
            child: Rotations(6),
          ),
        ],
      ),
    );
  }
}
