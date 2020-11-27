import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jmnchelogbook/models/CV_model.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/mission.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference CVCollection = Firestore.instance.collection('CVCollection');
  final CollectionReference missionCollection = Firestore.instance.collection('missionCollection');

  Future updateUserData(String name, String dob, String p_add, String l_add,
      String mob, String email, String degreeDetail, String degreeRecord,
      String iDetail, String other, String regNo, String joiningDate,
      String appearDate, String hobby,) async
  {
    return await CVCollection.document(uid).setData({
      'name': name,
      'dob': dob,
      'p_add': p_add,
      'l_add': l_add,
      'mob': mob,
      'email': email,
      'degreeDetail': degreeDetail,
      'degreeRecord': degreeRecord,
      'iDetail': iDetail,
      'other': other,
      'regNo': regNo,
      'joiningDate': joiningDate,
      'appearDate': appearDate,
      'hobby': hobby,
    });
  }
  Future updateUserDataForMission( bool agree, String sign) async
  {
    return await missionCollection.document(uid).setData({
      'agree': agree,
      'sign' : sign,
    });
  }

  //CV list from snapshot
  List<CV_model> _CVListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return CV_model(
        name: doc.data['name'] ?? '',
        enrl: doc.data['enrl'] ?? '',
        facultyno: doc.data['facultyno'] ?? '',
      );
    }).toList();
  }

  //userdata from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      dob: snapshot.data['dob'],
      p_add: snapshot.data['p_add'],
      l_add: snapshot.data['l_add'],
      mob: snapshot.data['mob'],
      email: snapshot.data['email'],
      degreeDetail: snapshot.data['degreeDetail'],
      degreeRecord: snapshot.data['degreeRecord'],
      iDetail: snapshot.data['iDetail'],
      other: snapshot.data['other'],
      regNo: snapshot.data['regNo'],
      joiningDate: snapshot.data['joiningDate'],
      appearDate: snapshot.data['appearDate'],
      hobby: snapshot.data['hobby'],

    );
  }
  //missiondata from snapshot
  MissionData _missionDataFromSnapshot(DocumentSnapshot snapshot){
    return MissionData(
      uid: uid,
      agree: snapshot.data['agree'],
      sign: snapshot.data['sign'],
    );
  }

  //get CVCollection stream
  Stream<List<CV_model>> get CV {
    return CVCollection.snapshots()
        .map(_CVListFromSnapshot);
  }

// get user doc stream
  Stream<UserData> get userData {
    return CVCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }
  Stream<MissionData> get missionData {
    return missionCollection.document(uid).snapshots()
        .map(_missionDataFromSnapshot);
  }
}