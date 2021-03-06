import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
            SizedBox(height: 20.0,),
            Text('Loading...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),),
          ],
        ),
      ),
    );
  }
}
