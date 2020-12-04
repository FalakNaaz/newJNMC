import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/auth.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference CVCollection = Firestore.instance.collection(
      'CVCollection');
  final CollectionReference missionCollection = Firestore.instance.collection(
      'missionCollection');
  final CollectionReference publicationsCollection = Firestore.instance
      .collection('publicationsCollection');
  final CollectionReference testCollection = Firestore.instance.collection('testCollection');
  final CollectionReference thesisCollection = Firestore.instance.collection('thesisCollection');
  //final CollectionReference tryingSubCollection = Firestore.instance.collection('tryingCollection').document(uid.toString()).collection('subCollection');
  //final databaseReference = Firestore.instance;
  //databaseReference.collection('main collection name').document(uid).collection('string name').document().setData();
  static List<CourseModel> FinalCoursesList = [] ;
  // print() {
  //   for(int i=0; i<FinalCoursesList.length; i++)
  //     {
  //
  //     }
  // }
  // Future updateTestCollection(String name)async
  // {
  //   List list_of_masters = await Firestore.instance.collection("masters")
  //       .getDocuments()
  //       .then((val) => val.documents);
  //   for (int i=0; i<list_of_masters.length; i++)
  //   {
  //     Firestore.instance.collection("masters").document(
  //         list_of_masters[i].documentID.toString()).collection("courses").snapshots().listen(CreateListofCourses);
  //   }
  // }

  MastersList() async
  {
    List list_of_masters = await Firestore.instance.collection("masters")
        .getDocuments()
        .then((val) => val.documents);
    //test();
    for (int i=0; i<list_of_masters.length; i++)
    {
      Firestore.instance.collection("masters").document(
          list_of_masters[i].documentID.toString()).collection("courses").snapshots().listen(CreateListofCourses);
    }
  }
  CreateListofCourses(QuerySnapshot snapshot)async
  {
    var docs = snapshot.documents;
    for (var Doc in docs)
    {
      FinalCoursesList.add(CourseModel.fromFireStore(Doc));
      print(Doc.data);
    }
  }

  Future updateUserData(String name, String dob, String p_add, String l_add,
      String mob, String email, String degreeDetail, String degreeRecord,
      String iDetail, String other, String regNo, String joiningDate,
      String appearDate, String hobby, String reason) async
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
      'reason': reason,
    });
  }

  Future updateUserDataForMission(bool agree, String sign) async
  {
    return await missionCollection.document(uid).setData({
      'agree': agree,
      'sign': sign,
    });
  }
Future updatePublicationsData(String papers, String conferences, String publications, String organization, String achievement) async
  {
    return await publicationsCollection.document(uid).setData({
      'papers': papers,
      'conferences': conferences,
      'publications': publications,
      'organization': organization,
      'achievement': achievement,

    });
  }
Future updateTestData(String date, String result, String assessment, String goals) async
{
  return await testCollection.document(uid).setData({
    'date' : date,
    'result' : result,
    'assessment' : assessment,
    'goals' : goals,
  });
}
  // //CV list from snapshot
  // List<CV_model> _CVListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc) {
  //     return CV_model(
  //       name: doc.data['name'] ?? '',
  //       enrl: doc.data['enrl'] ?? '',
  //       facultyno: doc.data['facultyno'] ?? '',
  //     );
  //   }).toList();
  // }
  Future updateThesisData(String consult, String collect, String pre) async
  {
    return await thesisCollection.document(uid).setData({
      'consult' : consult,
      'collect' : collect,
      'pre' : pre,
    });
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
      reason: snapshot.data['reason'],

    );
  }

  //publication data from snapshot
  PublicationsData _publicationsDataFromSnapshot(DocumentSnapshot snapshot) {
    return PublicationsData(
      uid: uid,
      papers: snapshot.data['papers'],
      conferences: snapshot.data['conferences'],
      social: snapshot.data['social'],
      organization: snapshot.data['organization'],
      achievement: snapshot.data['achievement'],
    );
  }

  //missiondata from snapshot
  MissionData _missionDataFromSnapshot(DocumentSnapshot snapshot) {
    return MissionData(
      uid: uid,
      agree: snapshot.data['agree'],
      sign: snapshot.data['sign'],
    );
  }
  TestData _testDataFromSnapshot(DocumentSnapshot snapshot){
    return TestData(
      uid: uid,
      date: snapshot.data['date'],
       result: snapshot.data['result'],
       assessment: snapshot.data['assessment'],
       goals: snapshot.data['goals'],

    );
  }
  ThesisData _thesisDataFromSnapshot(DocumentSnapshot snapshot){
    return ThesisData(
      uid: uid,
      consult: snapshot.data['consult'],
      collect: snapshot.data['collect'],
      pre: snapshot.data['pre'],
    );
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

  Stream<PublicationsData> get publicationsData {
    return publicationsCollection.document(uid).snapshots()
        .map(_publicationsDataFromSnapshot);
  }
   Stream<TestData> get testData {
    return testCollection.document(uid).snapshots()
        .map(_testDataFromSnapshot);
  }
  Stream<ThesisData> get thesisData{
    return thesisCollection.document(uid).snapshots()
        .map(_thesisDataFromSnapshot);
  }
}