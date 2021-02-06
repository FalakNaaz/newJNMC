import 'package:firebase_auth/firebase_auth.dart';
class Mentor{
  final String uid;
  Mentor({this.uid});
}
class MentorAuthService{
  final FirebaseAuth _auth2 = FirebaseAuth.instance;

  //create user obj based on firebase user
  Mentor _mentorFromFirebaseUser(FirebaseUser user)
  {
    return user != null ? Mentor(uid: user.uid) : null;
  }
  //auth change user stream
  Stream<Mentor> get mentor{
    return _auth2.onAuthStateChanged
    //.map((FirebaseMentor user) => _userFromFirebaseMentor(user));
        .map(_mentorFromFirebaseUser);
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async
  {
    try{
      AuthResult result = await _auth2.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //await DatabaseService(uid:user.uid).mastersList();

      return _mentorFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async
  {
    try{
      AuthResult result = await _auth2.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _mentorFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async{
    try{
      return await _auth2.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}