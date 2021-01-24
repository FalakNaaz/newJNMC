import 'package:flutter/material.dart';
import 'package:jmnchelogbook/shared/buttons.dart';

class SignInPage extends StatelessWidget {
  SignInPage({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JNMCH eLogBook'),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Sign In',
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.w300,
                fontSize: 65,
              ),),
            SizedBox(height: 35,),
            CustomButton(text: 'Sign In as a Resident', onPressed: ()=> Navigator.pushNamed(context, '/authenticate')),
            SizedBox(height:8.0),
            CustomButton(text: 'Sign In as a Mentor', onPressed: () => Navigator.pushNamed(context,'/mentorSignIn')),
          ],
        ),
      ),
    );
  }
}