import 'package:cloud_firestore/cloud_firestore.dart';

class User
{
  final String uid;
  User({this.uid});

}
class UserData{
  final String uid;
  final String name;
  final String dob;
  final String p_add;
  final String l_add;
  final String mob;
  final String email;
  final String degreeDetail;
  final String degreeRecord;
  final String iDetail;
  final String other;
  final String regNo;
  final String joiningDate;
  final String appearDate;
  final String hobby;
  final String reason;


  UserData({this.uid, this.name, this.dob, this.p_add,
    this.l_add, this.mob, this.email, this.degreeDetail, this.degreeRecord,
    this.iDetail, this.other, this.regNo, this.joiningDate,this.appearDate,
    this.hobby,this.reason});
}
class MissionData{
  String uid;
  bool agree;
  String sign;
  MissionData({this.uid, this.agree, this.sign});
}
class PublicationsData{
  String uid;
  String papers;
  String conferences;
  String social;
  String organization;
  String achievement;
  PublicationsData({this.uid, this.papers, this.conferences, this.social, this.organization, this.achievement});
}
class Trying{
  String field1;
  String field2;
  String field3;
  String field4;
  Trying({this.field1,this.field2,this.field3,this.field4});

}
class CourseModel {
  String course_name;
  String price;
  String details;
  String pic_url;
  String master_name;
  String master_email;
  String course_uid;
  CourseModel({this.details,this.course_name,this.pic_url,this.price,this.master_name,this.master_email,this.course_uid});
  factory CourseModel.fromFireStore(DocumentSnapshot doc)
  {
    Map data = doc.data ;
    return CourseModel(
      course_name: data['course_name'],
      master_name: data['master_name'],
      master_email: data['master_email'],
      course_uid: doc.documentID,
      pic_url: data['pic_url'],
      details: data['details'],
      price: data['price'],
    );
  }
}
class TestData{
  String uid;
  String date;
  String result;
  String assessment;
  String reason;
  TestData({this.uid,this.date, this.result, this.assessment,this.reason});

}
class ThesisData{
  String uid;
  String consult;
  String collect;
  String pre;
  ThesisData({this.uid,this.consult, this.collect, this.pre});
}
class Learning {
  final String uid;
  final String pdate;
  final String pname;
  final String l1;
  final String l2;
  final String l3;
  final String strategy;

  Learning(
      {this.uid,
        this.pdate,
        this.pname,
        this.l1,
        this.l2,
        this.l3,
        this.strategy});
}
