import 'dart:core' as hack;

class User {
  final hack.String uid;
  User({this.uid});
}

class UserData {
  final hack.String uid;
  final hack.String name;
  final hack.String dob;
  final hack.String p_add;
  final hack.String l_add;
  final hack.String mob;
  final hack.String email;
  final hack.String degreeDetail;
  final hack.String degreeRecord;
  final hack.String iDetail;
  final hack.String other;
  final hack.String regNo;
  final hack.String joiningDate;
  final hack.String appearDate;
  final hack.String hobby;
  final hack.String reason;

  UserData(
      {this.uid,
      this.name,
      this.dob,
      this.p_add,
      this.l_add,
      this.mob,
      this.email,
      this.degreeDetail,
      this.degreeRecord,
      this.iDetail,
      this.other,
      this.regNo,
      this.joiningDate,
      this.appearDate,
      this.hobby,
      this.reason});
}

class MissionData {
  final hack.String uid;
  final hack.bool agree;
  final hack.String sign;
  MissionData({this.uid, this.agree, this.sign});
}

class PublicationsData {
  final hack.String uid;
  final hack.String papers;
  final hack.String conferences;
  final hack.String social;
  final hack.String organization;
  final hack.String achievement;
  PublicationsData(
      {this.uid,
      this.papers,
      this.conferences,
      this.social,
      this.organization,
      this.achievement});
}

class CaseroutineData {
  final hack.String uid;
  final hack.String pdate;
  final hack.String pname;
  final hack.String l1;
  final hack.String l2;
  final hack.String l3;
  final hack.String strategy;

  CaseroutineData(
      {this.uid,
      this.pdate,
      this.pname,
      this.l1,
      this.l2,
      this.l3,
      this.strategy});
}
