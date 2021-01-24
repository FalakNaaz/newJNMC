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
  final CollectionReference test2 = Firestore.instance.collection('test2');
  final CollectionReference rotation = Firestore.instance.collection('Rotation');
  final CollectionReference thesisCollection = Firestore.instance.collection('thesisCollection3');
  final CollectionReference caseroutineCollection = Firestore.instance.collection('caseroutineCollection');
  static List<CourseModel> FinalCoursesList = [] ;


  Future<void> createTest2(String date, String result, String asses, String reason) async{
    for(int i=0; i<4;i++)
     await test2.document(uid).collection('tabs').document(i.toString()).setData({
       'date' : date,
       'result' : result,
       'assessment' : asses,
       'reason' : reason,
     });
  }
   Future<void> createThesis(String consult, String collect, String pre) async{
    for(int i=0; i<4;i++)
     await thesisCollection.document(uid).collection('tabs').document(i.toString()).setData({
       'consult': consult,
       'collect': collect,
       'pre': pre,
     });
  }
  Future<void> createRotations(int n) async {
    for (int i = 0; i < n; i++) {
      await rotation.document(uid)
          .collection('Rotation ${i + 1}')
          .document('learning').setData({
        'date': '',
        'name': '',
        'L1' :'',
        'L2' : '',
        'L3' : '',
        'strategy': '',
      }
      );
      await rotation.document(uid)
          .collection('Rotation ${i + 1}')
          .document('log').setData({
        'date': '',
        'name': '',
        'diagnosis' :'',
        'procedure' : '',
        'level' : '',
      }
      );
      await rotation.document(uid)
          .collection('Rotation ${i + 1}')
          .document('report').setData({
        'report': '',
      }
      );
      await rotation.document(uid)
          .collection('Rotation ${i + 1}')
          .document('assessment').setData({
        'patientCare': '',
        'professionalism': '',
        'communication' :'',
      }
      );
      await rotation.document(uid)
          .collection('Rotation ${i + 1}')
          .document('reflection').setData({
        'reflection': '',
      }
      );

    }
  }
  Future<void> updateCaseRotation(int rNo,String date,String name,String l1,String l2,String l3, strategy)async{
    await rotation.document(uid)
        .collection('Rotation ${rNo.toString()}')
        .document('learning').setData({
      'date': date,
      'name': name,
      'L1' : l1,
      'L2' : l2,
      'L3' : l3,
      'strategy': strategy,
    }
    );

  }
  Future<void> updateTest2(String tabNo, String date, String result, String asses, String reason) async{
    //for(int i=1; i<=4;i++)
     await test2.document(uid).collection('tabs').document(tabNo).setData({
       'date' : date,
       'result' : result,
       'assessment' : asses,
       'reason' : reason,
     });
  }
  Future<void> updateThesis(String tabNo, String consult, String collect, String pre) async{
       await thesisCollection.document(uid).collection('tabs').document(tabNo).setData({
         'consult': consult,
         'collect': collect,
         'pre': pre,

       });
    }

  // mastersList() async
  // {
  //   // Firestore.instance.collection("you_Collection_Path").add({
  //   //   "key":'falak' //your data which will be added to the collection and collection will be created after this
  //   // }).then((_){
  //   //   print("collection created");
  //   // }).catchError((_){
  //   //   print("an error occured");
  //   // });
  //   //createTest2();
  //   print('hi master');
  //   List listOfMasters = await Firestore.instance.collection("masters")
  //       .getDocuments()
  //       .then((val) => val.documents);
  //   //test();
  //   for (int i=0; i<listOfMasters.length; i++)
  //   {
  //     Firestore.instance.collection("masters").document(
  //         listOfMasters[i].documentID.toString()).collection("courses").snapshots().listen(createListOfCourses);
  //   }
  // }
  // createListOfCourses(QuerySnapshot snapshot)async
  // {
  //   var docs = snapshot.documents;
  //   for (var Doc in docs)
  //   {
  //     FinalCoursesList.add(CourseModel.fromFireStore(Doc));
  //     print(Doc.data);
  //   }
  // }

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
    //await DatabaseService(uid:uid).createTest2('dummyData','dummyData','dummyData','dummyData',);
    //await DatabaseService(uid:uid).updateTest2('2','newData','newData','newData','newData',);
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
  // Future updateThesisData(String consult, String collect, String pre) async
  // {
  //   return await thesisCollection.document(uid).setData({
  //     'consult' : consult,
  //     'collect' : collect,
  //     'pre' : pre,
  //   });
  // }
  Future updateCaseroutineData(String pdate, String pname, String l1, String l2,
      String l3, String strategy) async {
    return await caseroutineCollection.document(uid).setData({
      'pdate': pdate,
      'pname': pname,
      'l1': l1,
      'l2': l2,
      'l3': l3,
      'strategy': strategy,
    });
  }
  // List<TestData> _testListFromSnapshot(){
  //   List<TestData> list = [];
  //   for(int i=1; i<=4; i++) {
  //     var doc = test2.document(uid).collection('tabs').document(i.toString());
  //   }
  // }
  // List<TestData> _testListFromSnapshot1(QuerySnapshot snapshot){
  //   var docSnapshots = snapshot.documents;
  //   for(int i=0; i< docSnapshots.length ; i++){
  //     var doc = docSnapshots[i].data();
  //   }
  //
  // }
  List<TestData> _testDataFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return TestData(
        date: doc.data['date'] ?? '',
        result: doc.data['result'] ?? '',
        assessment: doc.data['assessment'] ?? '',
        reason: doc.data['reason'] ?? '',
      );
    }).toList();
  }
  List<ThesisData> _thesisDataFromSnapshot(QuerySnapshot snapshot){
      return snapshot.documents.map((doc){
        return ThesisData(
          consult: doc.data['consult'] ?? '',
          collect: doc.data['collect'] ?? '',
          pre: doc.data['pre'] ?? '',
        );
      }).toList();
    }

  Learning _caseroutineDataFromSnapshot(DocumentSnapshot snapshot) {
    return Learning(
      uid: uid,
      pdate: snapshot.data['pdate'],
      pname: snapshot.data['pname'],
      l1: snapshot.data['l1'],
      l2: snapshot.data['l2'],
      l3: snapshot.data['l3'],
      strategy: snapshot.data['strategy'],
    );
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
  // TestData _testDataFromSnapshot(DocumentSnapshot snapshot){
  //   return TestData(
  //     uid: uid,
  //     date: snapshot.data['date'],
  //     result: snapshot.data['result'],
  //     assessment: snapshot.data['assessment'],
  //     goals: snapshot.data['goals'],
  //
  //   );
  // }
  // ThesisData _thesisDataFromSnapshot(DocumentSnapshot snapshot){
  //   return ThesisData(
  //     uid: uid,
  //     consult: snapshot.data['consult'],
  //     collect: snapshot.data['collect'],
  //     pre: snapshot.data['pre'],
  //   );
  // }
  Stream<List<TestData>> get listOfTestData{
    return test2.document(uid).collection('tabs').snapshots()
        .map(_testDataFromSnapshot);
  }
  Stream<List<ThesisData>> get listOfThesisData{
    return thesisCollection.document(uid).collection('tabs').snapshots()
        .map(_thesisDataFromSnapshot);
  }
  // Stream<List<Learning>> get listOfLearning{
  //   return rotation.document(uid).collection('rotation $(').snapshots()
  //       .map(_thesisDataFromSnapshot);
  // }
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
  // Stream<TestData> get testData {
  //   return testCollection.document(uid).snapshots()
  //       .map(_testDataFromSnapshot);
  // }
  // Stream<ThesisData> get thesisData{
  //   return thesisCollection.document(uid).snapshots()
  //       .map(_thesisDataFromSnapshot);
  // }
  Stream<Learning> get caseroutineData {
    return caseroutineCollection
        .document(uid)
        .snapshots()
        .map(_caseroutineDataFromSnapshot);
  }
}