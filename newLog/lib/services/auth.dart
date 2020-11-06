import 'package:firebase_auth/firebase_auth.dart';
import 'package:jmnchelogbook/models/user.dart';
class AuthService{
    final FirebaseAuth _auth = FirebaseAuth.instance;

    //create user obj based on firebase user
    User _userFromFirebaseUser(FirebaseUser user)
    {
      return user != null ? User(uid: user.uid) : null;
    }
    //sign in anon
  /*  Future signInAnon() async {
      try{
        AuthResult result = await _auth.signInAnonymously();
        FirebaseUser user = result.user;
        return _userFromFirebaseUser(user);
      }catch(e){
        print(e.toString());
        return null;
      }
    }*/

    //register with email and password
    Future registerWithEmailAndPassword(String email, String password) async
    {
      try{
        AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        return _userFromFirebaseUser(user);
      }catch(e){
        print(e.toString());
        return null;
      }
    }

    //sign in with email and password
    Future signInWithEmailAndPassword(String email, String password) async
    {
      try{
        AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        return _userFromFirebaseUser(user);
      }catch(e){
        print(e.toString());
        return null;
      }
    }
}