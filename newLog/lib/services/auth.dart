import 'package:firebase_auth/firebase_auth.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user)
  {
    return user != null ? User(uid: user.uid) : null;
  }
  //auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async
  {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //await DatabaseService(uid:user.uid).mastersList();
      await DatabaseService(uid:user.uid).createTest2('','','','',);
      await DatabaseService(uid:user.uid).createThesis('A','A','A',);
      await DatabaseService(uid:user.uid).updateUserData('', '', '', '','','','','','','','','','','','');
      await DatabaseService(uid:user.uid).updateUserDataForMission(false,'');
      await DatabaseService(uid:user.uid).updatePublicationsData('', '', '','','');
      await DatabaseService(uid: user.uid).updateTestData('','','','');
      //await DatabaseService(uid: user.uid).updateThesisData('A','A','A');
      await DatabaseService(uid: user.uid).updateCaseroutineData('', '', '', '', '', '');
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

  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}