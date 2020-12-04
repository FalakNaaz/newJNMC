// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:jmnchelogbook/models/user.dart';
// class TestDatabase {
//   final String uid;
//
//   TestDatabase({this.uid});
//
//   User _userFromFirebaseUser(FirebaseUser user) {
//     return user != null ? User(uid: user.uid) : null;
//   }
//
//   CollectionReference testCollection = Firestore.instance.collection('test');
//
//   test() async
//   {
//     FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
//     User user = _userFromFirebaseUser(firebaseUser);
//     for (int i = 0; i < 4; i++) {
//       testCollection.document(user.uid).collection(
//           'testNo').document(i.toString()).setData(
//         {
//           'date': '',
//           'result': '',
//           'assessment': '',
//           'goals': '',
//         },
//       );
//     }
//   }
//
//   TestData _testDataFromSnapshot(DocumentSnapshot documentSnapshot) {
//     return TestData(
//       date: documentSnapshot.data['date'],
//       result: documentSnapshot.data['result'],
//       assessment: documentSnapshot.data['assessment'],
//       goals: documentSnapshot.data['goals'],
//     );
//   }
//
//   Stream<TestData> get testData0 {
//     return testCollection.document(uid).collection("testNo").document('0')
//         .snapshots()
//         .map(_testDataFromSnapshot);
//   }
//
//   Stream<TestData> get testData1 {
//     return testCollection.document(uid).collection("testNo").document('1')
//         .snapshots()
//         .map(_testDataFromSnapshot);
//   }
//
//   Stream<TestData> get testData2 {
//     return testCollection.document(uid).collection("testNo").document('2')
//         .snapshots()
//         .map(_testDataFromSnapshot);
//   }
//
//   Stream<TestData> get testData3 {
//     return testCollection.document(uid).collection("testNo").document('3')
//         .snapshots()
//         .map(_testDataFromSnapshot);
//   }
//   var testDataList1 = [testData0,testData1,testData2,testData3,];
//   Stream<List<TestData>> get testDataList{
//     return testDataList1;
//   }
// }