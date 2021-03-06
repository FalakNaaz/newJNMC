import 'package:firebase_auth/firebase_auth.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String role, String name) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    await DatabaseService(uid: user.uid).createRole(role);
    if (role == 'mentor')
      await DatabaseService(uid: user.uid)
          .updateListForMentor(email, user.uid, name);
    if (role == 'resident') {
      await DatabaseService(uid: user.uid)
          .updateListForResident(email, user.uid, name);
      await DatabaseService(uid: user.uid).createTest2(
        false,
        false,
        '',
        '',
        '',
        '',
        '',
        '',
      );
      await DatabaseService(uid: user.uid).createThesis(
        'A',
        'A',
        'A',
        false,
        false,
        '',
        '',
      );
      await DatabaseService(uid: user.uid).createRotations();
      await DatabaseService(uid: user.uid).updateUserData(false, false, '', '',
          '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
      await DatabaseService(uid: user.uid).updateUserDataForMission(false, '');
      await DatabaseService(uid: user.uid)
          .updatePublicationsData(false, '', '', '', '', '', '', '', false);
      await DatabaseService(uid: user.uid).createImageVar(false);
    }
    return _userFromFirebaseUser(user);
  }

  //Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
  }

  // Send Link to change password
  Future sendPasswordRestEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }

  //Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Reset Password
  Future sendPasswordResetEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }
}

// Validators
class NameValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Name can't be empty";
    }
    if (value.length < 2) {
      return "Name must be at least 2 character long";
    }
    if (value.length > 50) {
      return "Name must be at less than 50 character long";
    }
    return null;
  }
}

class EmailValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "E-mail can't be empty!";
    }
    return null;
  }
}

class PasswordValidatorRegister {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    }
    return null;
  }
}
class PasswordValidatorLogin {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Password can't be empty, if you have forgot your password then enter the last password you remember & click on forgot password button";
    }
    return null;
  }
}
