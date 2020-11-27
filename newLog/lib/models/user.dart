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


  UserData({this.uid, this.name, this.dob, this.p_add,
    this.l_add, this.mob, this.email, this.degreeDetail, this.degreeRecord,
    this.iDetail, this.other, this.regNo, this.joiningDate,this.appearDate,
    this.hobby,});
}
class MissionData{
  String uid;
  bool agree;
  String sign;
  MissionData({this.uid, this.agree, this.sign});
}