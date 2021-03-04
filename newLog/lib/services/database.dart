import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/MentorPages/authMentor.dart';
import 'package:jmnchelogbook/services/auth.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference CVCollection =
      Firestore.instance.collection('CVCollection');
  final CollectionReference roleCollection =
      Firestore.instance.collection('roleCollection');
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
final CollectionReference listOfUsersCollectionForMentor =
      Firestore.instance.collection('listOfUsersCollectionForMentor');
final CollectionReference listOfUsersCollectionForResident =
      Firestore.instance.collection('listOfUsersCollectionForResident');
final CollectionReference imageVar = Firestore.instance.collection('ImageVar');
  //final CollectionReference caseroutineCollection = Firestore.instance.collection('caseroutineCollection');

  Future<void> createImageVar(bool bool)async {
  await imageVar.document(uid).setData({
    'hasImage' : bool,
  });
}
Future<bool> getImageVar()async{
  return await imageVar.document(uid).get().then((value) {
    print(value.data['hasImage']);
    return value.data['hasImage'];
  });
}
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
  Future<void> updateListForMentor(String email, String uid, String name) async {
    await listOfUsersCollectionForMentor.document(uid).setData({
      'email': email,
      'uid' : uid,
      'name' : name,
    });
  }
/*   Future<void> addResidentForMentor( String resident) async {
    await listOfUsersCollectionForMentor.document(uid).updateData({
      'resident': resident,
    });
  }*/

  Future<void> updateListForResident(String email, String uid, String name) async {
    await listOfUsersCollectionForResident.document(uid).setData({
      'email': email,
      'uid' : uid,
      'name' : name,
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
  Future<void> createRole(String role) async {
    await roleCollection.document(uid).setData({
      'role': role,
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
        'no' : 0,
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
        'antCareL': '1',
        'iCarePatientsL': '1',
        'pCarePatientsL': '1',
        'obTechL': '1',
        'gynaeTech1L': '1',
        'gynaeTech2L': '1',
        'familyPlanningL': '1',
        'accAndResL': '1',
        'respectL': '1',
        'comm1L': '1',
        'comm2L': '1',
        'informedL': '1',
        'patientSafetyL': '1',
        'systemImpL': '1',

      });
      await rotation2
          .document(uid)
          .collection('reflection')
          .document('Rotation$i')
          .setData({
        'level': '',
        'mKnowledge': '1',
        'pCare': '1',
        'professionalism': '1',
        'iCommunication': '1',
        'pImprovement': '1',
        'sImprovement': '1',
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

  Future updatePublicationsData(bool isApproved, String mentorName, String mentorMail, String papers, String conferences,
      String social, String organization, String achievement, bool approvalReady) async {
    return await publicationsCollection.document(uid).setData({

      'isApproved' : isApproved,
      'mentorName' : mentorName,
      'mentorMail' : mentorMail,
      'papers': papers,
      'conferences': conferences,
      'social': social,
      'organization': organization,
      'achievement': achievement,
      'approvalReady': approvalReady,
    });
  }
  Future updateApprovalReady( bool approvalReady) async {
    return await publicationsCollection.document(uid).updateData({
      'approvalReady': approvalReady,
    });
  }
   Future updateIsApproved( bool isApproved, String mentorName, String mentorMail) async {
    return await publicationsCollection.document(uid).updateData({
      'isApproved': isApproved,
      'mentorName' : mentorName,
      'mentorMail' : mentorMail,
    });
  }

Future updatePatientDoc(int rNo, int pNo, String date, String name, String diagnosis, String procedure, String level) async {
    return await rotation2.document(uid).collection('log').document('Rotation$rNo').updateData({
      'Patient$pNo': {
        'date': date,
        'diagnosis': diagnosis,
        'level': level,
        'name': name,
        'procedure': procedure,
      }
    });
  }
Future deletePatientDoc(int rNo, int pNo,) async {
    return await rotation2.document(uid).collection('log').document('Rotation$rNo').updateData({
      'Patient$pNo': FieldValue.delete()

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
  Future incrementPatientDoc(int rotationNo)async {
    int no ;
    await rotation2
        .document(uid)
        .collection('log')
        .document('Rotation$rotationNo').get().then((querySnapshot) {
      no = querySnapshot.data['no'];
    });
    ++no;
   // for(int i=0; i<6;i++){
   /* Firestore.instance.collection('rotation2').getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        print('result.data is');
        print(result.data);
      });
    });*/
    /*Firestore.instance.collection('Rotation2')
        .document(uid)
        .collection('log')
        .document('Rotation$rotationNo')
        .get().then((querySnapshot) {
      print('from incrementdoc querySnapshot.data is');
      print(querySnapshot.data);
    });*/
   /* Firestore.instance.collection('1collection')
        .document('1doc')
        .collection('2collection')
        .document('2doc')
        .collection('3collection')
        .document('3doc')
        .get().then((querySnapshot) {
      print('querySnapshot.data is');
      print(querySnapshot.data);
    });*/
   /* Firestore.instance.collection('rotation2')
        .document(uid)
        .collection('learning')
        .document('Rotation0')
        //.collection('allPatients')
        //.document('patient1')
        .get().then((querySnapshot) {
      print('querySnapshot.data is');
      print(querySnapshot.data);
    });*/
      return await rotation2
          .document(uid)
          .collection('log')
          .document('Rotation$rotationNo')
          .updateData({
        'no': no,
        'Patient$no': {
          'date': '',
          'name': '',
          'diagnosis': '',
          'procedure': '',
          'level': '',
        }
      });
    //}

  }
/*Future updatePatientNo(int rotationNo) async {
  int no ;
  await rotation2
      .document(uid)
      .collection('log')
      .document('Rotation$rotationNo').get().then((querySnapshot) {
    no = querySnapshot.data['no'];
  });
  ++no;
  incrementPatientDoc(rotationNo, no);
    return await rotation2
        .document(uid)
        .collection('log')
        .document('Rotation$rotationNo')
        .updateData({
      'no': no,
    });
  }*/

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
  List<ListOfMentorData> _listOfMentorDataFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return ListOfMentorData(
        email: doc.data['email'] ?? '',
        uid: doc.data['uid'] ?? '',
        name: doc.data['name'] ?? '',

      );
    }).toList();
  }
   List<ListOfResidentData> _listOfResidentDataFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return ListOfResidentData(
        email: doc.data['email'] ?? '',
        uid: doc.data['uid'] ?? '',
        name: doc.data['name'] ?? '',

      );
    }).toList();
  }
 ResidentData _residentDataFromSnapshot(DocumentSnapshot snapshot){
      return ResidentData(
        uid: snapshot.data['uid'] ??'',
        email: snapshot.data['email'] ?? '',
        name: snapshot.data['name'] ?? '',

      );
  }
 MentorData _mentorDataFromSnapshot(DocumentSnapshot snapshot){
      return MentorData(
        uid: snapshot.data['uid'] ??'',
        email: snapshot.data['email'] ?? '',
        name: snapshot.data['name'] ?? '',

      );
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
 /* List<PatientData> _patientDataFromSnapshotIntermediate(QuerySnapshot snapshot){
    print('from immediate');
    return snapshot.documents.map((doc){
      print(doc.data['Patient1']['date']);
      return PatientData(
        date: doc.data['date'] ?? '',
        diagnosis: doc.data['diagnosis'] ?? '',
        level: doc.data['level'] ?? '',
        name: doc.data['name'] ?? '',
        procedure: doc.data['procedure'] ?? '',
      );
    }).toList();
  }*/
 /* List<List<PatientData>> _patientDataFromSnapshot(QuerySnapshot snapshot) {
    *//*Firestore.instance.collection('1collection')
        .document('1doc')
     .collection('2collection')
     .document('2doc')
         .collection('3collection')
         .document('3doc')
        .get().then((querySnapshot) {
       print('querySnapshot.data is');
       print(querySnapshot.data);
    });*//*
    return snapshot.documents.map((doc1) {
      print('doc outsideeee: ${doc1.data['allPatients']}');

      return doc1.data['allPatients'].snapshots.map(_patientDataFromSnapshotIntermediate);
    }).toList();
  }*/


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
 /* List<PatientNo> _patientNoDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return PatientNo(
        no: doc.data['no'] ?? '',
      );
    }).toList();
  }*/

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
RoleData _roleDataFromSnapshot(DocumentSnapshot snapshot){
    return RoleData(
      uid: uid,
      role: snapshot.data['role'],
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
      isApproved: snapshot.data['isApproved'],
      mentorName: snapshot.data['mentorName'],
      mentorMail: snapshot.data['mentorMail'],
      approvalReady: snapshot.data['approvalReady'],

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
  /*Stream<String> get url {
    bool isImage = getImageVar();
    if (isImage) {
      final ref =
      FirebaseStorage.instance.ref().child('images/$uid.jpeg');
      url = await ref.getDownloadURL();
    }
    else{
      url = null;
    }
  }*/
  Stream<List<ThesisData>> get listOfThesisData {
    return thesisCollection
        .document(uid)
        .collection('tabs')
        .snapshots()
        .map(_thesisDataFromSnapshot);
  }
 Stream<List<ListOfMentorData>> get listOfMentorData {
    return listOfUsersCollectionForMentor
        .snapshots()
        .map(_listOfMentorDataFromSnapshot);
  }
Stream<List<ListOfResidentData>> get listOfResidentData {
    return listOfUsersCollectionForResident
        .snapshots()
        .map(_listOfResidentDataFromSnapshot);
  }
Stream<ResidentData> get residentData {
    return listOfUsersCollectionForResident
        .document(uid).snapshots()
        .map(_residentDataFromSnapshot);
}
Stream<MentorData> get mentorData {
    return listOfUsersCollectionForMentor
        .document(uid).snapshots()
        .map(_mentorDataFromSnapshot);
}

  Stream<List<Learning>> get listOfLearningData {
    return rotation2
        .document(uid)
        .collection('learning')
        .snapshots()
        .map(_learningDataFromSnapshot);
  }
  Stream<QuerySnapshot> get listOfPatientData {
    //Stream<List<List<PatientData>>> colRef;
    //for(int i=0; i<6;i++){
      /*colRef.toSet() =*/
    return rotation2
          .document(uid)
          .collection('log')
          .snapshots();
    /*rotation2
    .document(uid)
        .collection("log")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('f.data is ${f.data}'));
    });*/
   /* return rotation2
        .document(uid)
        .collection('log')
        //.document('Rotation0')
        //.collection('allPatients')
        .snapshots()
        .map(_patientDataFromSnapshot);*/
   //return colRef;
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
/*Stream<List<PatientNo>> get listOfPatientNo {
    return rotation2
        .document(uid)
        .collection('log')
        .snapshots()
        .map(_patientNoDataFromSnapshot);
  }*/

// get user doc stream
  Stream<UserData> get userData {
    return CVCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
  Stream<RoleData> get roleData {
    return roleCollection.document(uid).snapshots().map(_roleDataFromSnapshot);
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
