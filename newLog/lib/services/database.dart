import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/auth.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference CVCollection =
      Firestore.instance.collection('CVCollection');
  final CollectionReference missionCollection =
      Firestore.instance.collection('missionCollection');
  final CollectionReference publicationsCollection =
      Firestore.instance.collection('publicationsCollection');

  //final CollectionReference testCollection = Firestore.instance.collection('testCollection');
  final CollectionReference test2 = Firestore.instance.collection('test2');
  final CollectionReference rotation2 =
      Firestore.instance.collection('Rotation2');
  final CollectionReference thesisCollection =
      Firestore.instance.collection('thesisCollection3');

  //final CollectionReference caseroutineCollection = Firestore.instance.collection('caseroutineCollection');

  Future<void> createTest2(
      String date, String result, String asses, String reason) async {
    for (int i = 0; i < 4; i++)
      await test2
          .document(uid)
          .collection('tabs')
          .document(i.toString())
          .setData({
        'date': date,
        'result': result,
        'assessment': asses,
        'reason': reason,
      });
  }

  Future<void> createThesis(String consult, String collect, String pre) async {
    for (int i = 0; i < 4; i++)
      await thesisCollection
          .document(uid)
          .collection('tabs')
          .document(i.toString())
          .setData({
        'consult': consult,
        'collect': collect,
        'pre': pre,
      });
  }

  Future<void> createRotations() async {
    for (int i = 0; i < 6; i++) {
      //await rotation2.document(uid).setData({'text': 'dummy'});
      await rotation2
          .document(uid)
          .collection('learning')
          .document('Rotation$i')
          .setData({
        'pdate': '',
        'pname': '',
        'l1': '',
        'l2': '',
        'l3': '',
        'strategy': '',
      });
      await rotation2
          .document(uid)
          .collection('log')
          .document('Rotation$i')
          .setData({
        'date': '',
        'name': '',
        'diagnosis': '',
        'procedure': '',
        'level': '',
      });
      await rotation2
          .document(uid)
          .collection('report')
          .document('Rotation$i')
          .setData({
        'reportText': '',
      });
      await rotation2
          .document(uid)
          .collection('assessment')
          .document('Rotation$i')
          .setData({
        'antCareL': 'antCareL',
        'iCarePatientsL': 'antCarePatientsL',
      });
      await rotation2
          .document(uid)
          .collection('reflection')
          .document('Rotation$i')
          .setData({
        'level': '',
        'mKnowledge': '',
        'pCare': '',
        'professionalism': '',
        'iCommunication': '',
        'pImprovement': '',
        'sImprovement': '',
      });
    }
  }

  Future<void> updateTest2(String tabNo, String date, String result,
      String asses, String reason) async {
    //for(int i=1; i<=4;i++)
    await test2.document(uid).collection('tabs').document(tabNo).setData({
      'date': date,
      'result': result,
      'assessment': asses,
      'reason': reason,
    });
  }

  Future<void> updateThesis(
      String tabNo, String consult, String collect, String pre) async {
    await thesisCollection
        .document(uid)
        .collection('tabs')
        .document(tabNo)
        .setData({
      'consult': consult,
      'collect': collect,
      'pre': pre,
    });
  }

  Future updateUserData(
      String name,
      String dob,
      String p_add,
      String l_add,
      String mob,
      String email,
      String degreeDetail,
      String degreeRecord,
      String iDetail,
      String other,
      String regNo,
      String joiningDate,
      String appearDate,
      String hobby,
      String reason) async {
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

  Future updateUserDataForMission(bool agree, String sign) async {
    return await missionCollection.document(uid).setData({
      'agree': agree,
      'sign': sign,
    });
  }

  Future updatePublicationsData(String papers, String conferences,
      String publications, String organization, String achievement) async {
    return await publicationsCollection.document(uid).setData({
      'papers': papers,
      'conferences': conferences,
      'publications': publications,
      'organization': organization,
      'achievement': achievement,
    });
  }

  /*Future updateTestData(String date, String result, String assessment, String goals) async
  {
    //await DatabaseService(uid:uid).createTest2('dummyData','dummyData','dummyData','dummyData',);
    //await DatabaseService(uid:uid).updateTest2('2','newData','newData','newData','newData',);
    return await testCollection.document(uid).setData({
      'date' : date,
      'result' : result,
      'assessment' : assessment,
      'goals' : goals,
    });
  }*/
  Future updateCaseroutineData(int rotationNo, String pdate, String pname,
      String l1, String l2, String l3, String strategy) async {
    return await rotation2
        .document(uid)
        .collection('learning')
        .document('Rotation$rotationNo')
        .setData({
      'pdate': pdate,
      'pname': pname,
      'l1': l1,
      'l2': l2,
      'l3': l3,
      'strategy': strategy,
    });
  }

  Future updateEndRotation(
      int rotationNo,
      String antCareL,
      String iCarePatientsL,
      String pCarePatientsL,
      String obTechL,
      String gynaeTech1L,
      String gynaeTech2L,
      String familyPlanningL,
      String accAndResL,
      String respectL,
      String comm1L,
      String comm2L,
      String informedL,
      String patientSafetyL,
      String systemImpL,
      String antCareR,
      String iCarePatientsR,
      String pCarePatientsR,
      String obTechR,
      String gynaeTech1R,
      String gynaeTech2R,
      String familyPlanningR,
      String accAndResR,
      String respectR,
      String comm1R,
      String comm2R,
      String informedR,
      String patientSafetyR,
      String systemImpR) async {
    return await rotation2
        .document(uid)
        .collection('assessment')
        .document('Rotation$rotationNo')
        .setData({
       'antCareL' : antCareL,
       'iCarePatientsL': iCarePatientsL,
       'pCarePatientsL': pCarePatientsL,
       'obTechL': obTechL,
       'gynaeTech1L': gynaeTech1L,
       'gynaeTech2L': gynaeTech2L,
       'familyPlanningL': familyPlanningL,
       'accAndResL': accAndResL,
       'respectL': respectL,
       'comm1L': comm1L,
       'comm2L': comm2L,
       'informedL': informedL,
       'patientSafetyL': patientSafetyL,
       'systemImpL': systemImpL,
       'antCareR': antCareR,
       'iCarePatientsR': iCarePatientsR,
       'pCarePatientsR': pCarePatientsR,
       'obTechR': obTechR,
       'gynaeTech1R': gynaeTech1R,
       'gynaeTech2R': gynaeTech2R,
       'familyPlanningR': familyPlanningR,
       'accAndResR': accAndResR,
       'respectR': respectR,
       'comm1R': comm1R,
       'comm2R': comm2R,
       'informedR': informedR,
       'patientSafetyR': patientSafetyR,
       'systemImpR': systemImpR,

    });
  }

  Future updateReflectionData(
    int rotationNo,
    String level,
    String mKnowledge,
    String pCare,
    String professionalism,
    String iCommunication,
    String pImprovement,
    String sImprovement,
  ) async {
    return await rotation2
        .document(uid)
        .collection('reflection')
        .document('Rotation$rotationNo')
        .setData({
      'level': level,
      'mKnowledge': mKnowledge,
      'pCare': pCare,
      'professionalism': professionalism,
      'iCommunication': iCommunication,
      'pImprovement': pImprovement,
      'sImprovement': sImprovement,
    });
  }

  Future updateReport(int rotationNo, String reportText) async {
    return await rotation2
        .document(uid)
        .collection('report')
        .document('Rotation$rotationNo')
        .setData({
      'reportText': reportText,
    });
  }

  List<TestData> _testDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return TestData(
        date: doc.data['date'] ?? '',
        result: doc.data['result'] ?? '',
        assessment: doc.data['assessment'] ?? '',
        reason: doc.data['reason'] ?? '',
      );
    }).toList();
  }

  List<ThesisData> _thesisDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ThesisData(
        consult: doc.data['consult'] ?? '',
        collect: doc.data['collect'] ?? '',
        pre: doc.data['pre'] ?? '',
      );
    }).toList();
  }

  List<Learning> _learningDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Learning(
        pdate: doc.data['pdate'] ?? '',
        pname: doc.data['pname'] ?? '',
        l1: doc.data['l1'] ?? '',
        l2: doc.data['l2'] ?? '',
        l3: doc.data['l3'] ?? '',
        strategy: doc.data['strategy'] ?? '',
      );
    }).toList();
  }
 List<EndRotation> _endRotationFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return EndRotation(
        antCareL: doc.data['antCareL'] ?? '',
        iCarePatientsL: doc.data['iCarePatientsL'] ?? '',
        pCarePatientsL: doc.data['pCarePatientsL'] ?? '',
        obTechL: doc.data['obTechL'] ?? '',
        gynaeTech1L: doc.data['gynaeTech1L'] ?? '',
        gynaeTech2L: doc.data['gynaeTech2L'] ?? '',
        familyPlanningL: doc.data['familyPlanningL'] ?? '',
        accAndResL: doc.data['accAndResL'] ?? '',
        respectL: doc.data['respectL'] ?? '',
        comm1L: doc.data['comm1L'] ?? '',
        comm2L: doc.data['comm2L'] ?? '',
        informedL: doc.data['informedL'] ?? '',
        patientSafetyL: doc.data['patientSafetyL'] ?? '',
        systemImpL: doc.data['systemImpL'] ?? '',
        antCareR: doc.data['antCareR'] ?? '',
        iCarePatientsR: doc.data['iCarePatientsR'] ?? '',
        pCarePatientsR: doc.data['pCarePatientsR'] ?? '',
        obTechR: doc.data['obTechR'] ?? '',
        gynaeTech1R: doc.data['gynaeTech1R'] ?? '',
        gynaeTech2R: doc.data['gynaeTech2R'] ?? '',
        familyPlanningR: doc.data['familyPlanningR'] ?? '',
        accAndResR: doc.data['accAndResR'] ?? '',
        respectR: doc.data['respectR'] ?? '',
        comm1R: doc.data['comm1R'] ?? '',
        comm2R: doc.data['comm2R'] ?? '',
        informedR: doc.data['informedR'] ?? '',
        patientSafetyR: doc.data['patientSafetyR'] ?? '',
        systemImpR: doc.data['systemImpR'] ?? '',


      );
    }).toList();
  }

  List<ReflectionData1> _reflectionDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ReflectionData1(
        level: doc.data['level'] ?? '',
        mKnowledge: doc.data['mKnowledge'] ?? '',
        pCare: doc.data['pCare'] ?? '',
        professionalism: doc.data['professionalism'] ?? '',
        iCommunication: doc.data['iCommunication'] ?? '',
        pImprovement: doc.data['pImprovement'] ?? '',
        sImprovement: doc.data['sImprovement'] ?? '',
      );
    }).toList();
  }

  List<Report> _reportDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Report(
        reportText: doc.data['reportText'] ?? '',
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

  Stream<List<TestData>> get listOfTestData {
    return test2
        .document(uid)
        .collection('tabs')
        .snapshots()
        .map(_testDataFromSnapshot);
  }

  Stream<List<ThesisData>> get listOfThesisData {
    return thesisCollection
        .document(uid)
        .collection('tabs')
        .snapshots()
        .map(_thesisDataFromSnapshot);
  }

  Stream<List<Learning>> get listOfLearningData {
    return rotation2
        .document(uid)
        .collection('learning')
        .snapshots()
        .map(_learningDataFromSnapshot);
  }
   Stream<List<EndRotation>> get listOfEndRotation {
    return rotation2
        .document(uid)
        .collection('assessment')
        .snapshots()
        .map(_endRotationFromSnapshot);
  }

  Stream<List<Report>> get listOfReportData {
    return rotation2
        .document(uid)
        .collection('report')
        .snapshots()
        .map(_reportDataFromSnapshot);
  }

  Stream<List<ReflectionData1>> get listOfReflectionData {
    return rotation2
        .document(uid)
        .collection('reflection')
        .snapshots()
        .map(_reflectionDataFromSnapshot);
  }

// get user doc stream
  Stream<UserData> get userData {
    return CVCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  Stream<MissionData> get missionData {
    return missionCollection
        .document(uid)
        .snapshots()
        .map(_missionDataFromSnapshot);
  }

  Stream<PublicationsData> get publicationsData {
    return publicationsCollection
        .document(uid)
        .snapshots()
        .map(_publicationsDataFromSnapshot);
  }

/*List<Stream<Learning>> get caseroutineData1 {
  final List<CollectionReference> rotationNo = [Firestore.instance.collection(
      'Rotation').document(uid).collection('Rotation1'),
  Firestore.instance.collection(
      'Rotation').document(uid).collection('Rotation2'),
  Firestore.instance.collection(
      'Rotation').document(uid).collection('Rotation3'),
  Firestore.instance.collection(
      'Rotation').document(uid).collection('Rotation4'),
  Firestore.instance.collection(
      'Rotation').document(uid).collection('Rotation5'),
  Firestore.instance.collection(
      'Rotation').document(uid).collection('Rotation6'),

  ];
  return rotationNo.map((oneRotation)=>oneRotation
      .document('learning')
      .snapshots()
      .map(_caseroutineDataFromSnapshot)).toList();

}*/
}
