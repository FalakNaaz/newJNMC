import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;

  User({this.uid});
}

class RoleData {
  final String uid;
  final String role;

  RoleData({this.uid, this.role});
}

class ListOfMentorData {
  final String uid;
  final String email;
  final String name;

  ListOfMentorData({this.uid, this.email, this.name});
}

class MentorData {
  final String uid;
  final String email;
  final String name;

  MentorData({this.uid, this.email, this.name});
}

class ListOfResidentData {
  final String uid;
  final String email;
  final String name;

  ListOfResidentData({this.uid, this.email, this.name});
}

class ResidentData {
  final String uid;
  final String email;
  final String name;

  ResidentData({this.uid, this.email, this.name});
}

class UserData {
  final String uid;
  final String name;
  final String dob;
  final String p_add;
  final String l_add;
  final String mob;
  final String email;
  final String degreeDetailYrAdd;
  final String degreeDetailYrPass;
  final String degreeDetailCollege;
  final String degreeRecord1stProfP;
  final String degreeRecord2ndProfP;
  final String degreeRecordMidProfP;
  final String degreeRecordFinalProfP;
  final String degreeRecord1stProfM;
  final String degreeRecord2ndProfM;
  final String degreeRecordMidProfM;
  final String degreeRecordFinalProfM;

  final String internshipYrBeg;
  final String internshipYrComp;
  final String internshipCollege;
  final String other;
  final String regNo;
  final String joiningDate;
  final String appearDate;
  final String hobby;
  final String reason;
  final bool isApproved;
  final String mentorName;
  final String mentorMail;
  final bool approvalReady;

  UserData({
    this.uid,
    this.name,
    this.dob,
    this.p_add,
    this.l_add,
    this.mob,
    this.email,
    this.degreeDetailCollege,
    this.degreeDetailYrAdd,
    this.degreeDetailYrPass,
    this.degreeRecord1stProfM,
    this.degreeRecord2ndProfM,
    this.degreeRecordMidProfM,
    this.degreeRecordFinalProfM,
    this.degreeRecord1stProfP,
    this.degreeRecord2ndProfP,
    this.degreeRecordMidProfP,
    this.degreeRecordFinalProfP,
    this.internshipCollege,
    this.internshipYrBeg,
    this.internshipYrComp,
    this.other,
    this.regNo,
    this.joiningDate,
    this.appearDate,
    this.hobby,
    this.reason,
    this.isApproved,
    this.mentorName,
    this.mentorMail,
    this.approvalReady,
  });
}

class MissionData {
  String uid;
  bool agree;
  String sign;

  MissionData({this.uid, this.agree, this.sign});
}

class PublicationsData {
  String uid;
  String papers;
  String conferences;
  String social;
  String organization;
  String achievement;
  bool isApproved;
  String mentorName;
  String mentorMail;
  bool approvalReady;

  PublicationsData({this.uid,
    this.papers,
    this.conferences,
    this.social,
    this.organization,
    this.achievement,
    this.isApproved,
    this.mentorName,
    this.mentorMail,
    this.approvalReady});
}

class TestData {
  String uid;
  String date;
  String result;
  String assessment;
  String reason;
  bool isApproved;
  String mentorName;
  String mentorMail;
  bool approvalReady;

  TestData({this.uid,
    this.date,
    this.result,
    this.assessment,
    this.reason,
    this.isApproved,
    this.mentorName,
    this.mentorMail,
    this.approvalReady});
}

class PatientData {
  String uid;
  String date;
  String diagnosis;
  String level;
  String name;
  String procedure;

  PatientData({this.uid,
    this.date,
    this.diagnosis,
    this.level,
    this.name,
    this.procedure});
}

class ThesisData {
  String uid;
  String consult;
  String collect;
  String pre;
  bool isApproved;
  String mentorName;
  String mentorMail;
  bool approvalReady;

  ThesisData({this.uid,
    this.consult,
    this.collect,
    this.pre,
    this.isApproved,
    this.mentorName,
    this.mentorMail,
    this.approvalReady});
}

class Learning {
  final String uid;
  final String pdate;
  final String pname;
  final String l1;
  final String l2;
  final String l3;
  final String strategy;
  final bool isApproved;
  final String mentorName;
  final String mentorMail;
  final bool approvalReady;

  Learning({this.uid,
    this.pdate,
    this.pname,
    this.l1,
    this.l2,
    this.l3,
    this.strategy,
    this.isApproved,
    this.mentorName,
    this.mentorMail,
    this.approvalReady});
}

class Report {
  final String uid;
  final String reportText;
  final bool isApproved;
  final String mentorName;
  final String mentorMail;
  final bool approvalReady;

  Report({this.uid,
    this.reportText,
    this.isApproved,
    this.mentorName,
    this.mentorMail,
    this.approvalReady});
}

class ReflectionData1 {
  final String uid;
  final String level;
  final String mKnowledge;
  final String pCare;
  final String professionalism;
  final String iCommunication;
  final String pImprovement;
  final String sImprovement;
  final bool isApproved;
  final String mentorName;
  final String mentorMail;
  final bool approvalReady;

  ReflectionData1({this.uid,
    this.level,
    this.mKnowledge,
    this.pCare,
    this.professionalism,
    this.iCommunication,
    this.pImprovement,
    this.sImprovement,
    this.isApproved,
    this.mentorName,
    this.mentorMail,
    this.approvalReady});
}

class EndRotation {
  final String uid;
  final String antCareL;
  final String iCarePatientsL;
  final String pCarePatientsL;
  final String obTechL;
  final String gynaeTech1L;
  final String gynaeTech2L;
  final String familyPlanningL;
  final String accAndResL;
  final String respectL;
  final String comm1L;
  final String comm2L;
  final String informedL;
  final String patientSafetyL;
  final String systemImpL;
  final String antCareR;
  final String iCarePatientsR;
  final String pCarePatientsR;
  final String obTechR;
  final String gynaeTech1R;
  final String gynaeTech2R;
  final String familyPlanningR;
  final String accAndResR;
  final String respectR;
  final String comm1R;
  final String comm2R;
  final String informedR;
  final String patientSafetyR;
  final String systemImpR;
  final bool isApproved;
  final String mentorName;
  final String mentorMail;
  final bool approvalReady;

  EndRotation({this.uid,
    this.antCareL,
    this.iCarePatientsL,
    this.pCarePatientsL,
    this.obTechL,
    this.gynaeTech1L,
    this.gynaeTech2L,
    this.familyPlanningL,
    this.accAndResL,
    this.respectL,
    this.comm1L,
    this.comm2L,
    this.informedL,
    this.patientSafetyL,
    this.systemImpL,
    this.antCareR,
    this.iCarePatientsR,
    this.pCarePatientsR,
    this.obTechR,
    this.gynaeTech1R,
    this.gynaeTech2R,
    this.familyPlanningR,
    this.accAndResR,
    this.respectR,
    this.comm1R,
    this.comm2R,
    this.informedR,
    this.patientSafetyR,
    this.systemImpR,
    this.isApproved,
    this.mentorName,
    this.mentorMail,
    this.approvalReady});
}

class PatientNo {
  final int no;

  PatientNo({this.no});
}

class Summary {
  final String uid;
  final String name;
  final String course;
  final String duration;
  final String majorP;
  final String majorA;
  final String minorP;
  final String minorA;
  final String seminarP;
  final String seminarA;
  final String caseP;
  final String caseA;
  final String ugC;
  final String ugA;
  final String pHV;
  final String conferences;
  final String other;
  final bool isApproved;
  final String mentorName;
  final String mentorMail;
  final bool approvalReady;

  Summary(
      {this.uid,this.name, this.course, this.duration, this.majorP, this.majorA, this.minorP,
        this.minorA, this.seminarP, this.seminarA, this.caseP, this.caseA, this.ugC, this.ugA, this.pHV, this.conferences, this.other, this.isApproved,
        this.mentorName,
        this.mentorMail,
        this.approvalReady});
}
class Feedback1{
  final String uid;
  final String patients1;
  final String nursing1;
  final String under1;
  final String inter1;
  final String senior1;
  final String junior1;
  final String patients2;
  final String nursing2;
  final String under2;
  final String inter2;
  final String senior2;
  final String junior2;
  final String patients3;
  final String nursing3;
  final String under3;
  final String inter3;
  final String senior3;
  final String junior3;
  final bool isApproved;
  final String mentorName;
  final String mentorMail;
  final bool approvalReady;
  Feedback1({this.uid,this.patients1, this.nursing1, this.under1,this.inter1, this.senior1, this.junior1,
    this.patients2, this.nursing2, this.under2,this.inter2, this.senior2, this.junior2,
    this.patients3, this.nursing3, this.under3,this.inter3, this.senior3, this.junior3,
  this.isApproved,this.mentorName,this.mentorMail,this.approvalReady});

}
