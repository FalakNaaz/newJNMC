import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';

class UpdateCV extends StatefulWidget {
  @override
  _UpdateCVState createState() => _UpdateCVState();
}

class _UpdateCVState extends State<UpdateCV> {
  final _formKey = GlobalKey<FormState>();

  //form values
  String _currentName;
  String _currentdob;
  String _currentp_add;
  String _currentl_add;
  String _currentmob;
  String _currentemail;
  String _currentother;
  String _currentregNo;
  String _currentjoiningDate;
  String _currentappearDate;
  String _currenthobby;
  String _currentreason;
  String _currentdegreeDetailYrAdd;
  String _currentdegreeDetailYrPass;
  String _currentdegreeDetailCollege;
  String _currentdegreeRecord1stProfP;
  String _currentdegreeRecord2ndProfP;
  String _currentdegreeRecordMidProfP;
  String _currentdegreeRecordFinalProfP;
  String _currentdegreeRecord1stProfM;
  String _currentdegreeRecord2ndProfM;
  String _currentdegreeRecordMidProfM;
  String _currentdegreeRecordFinalProfM;
  String _currentinternshipYrBeg;
  String _currentinternshipYrComp;
  String _currentinternshipCollege;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Update your CV',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Name'),
                      initialValue: userData.name,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter a name' : null,
                      onChanged: (val) => setState(() => _currentName = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Date of Birth'),
                      initialValue: userData.dob,
                      validator: (val) => val.isEmpty
                          ? 'Please enter your date of birth'
                          : null,
                      onChanged: (val) => setState(() => _currentdob = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Permanent Address'),
                      maxLines: 4,
                      initialValue: userData.p_add,
                      validator: (val) => val.isEmpty
                          ? 'Please enter your permanent address'
                          : null,
                      onChanged: (val) => setState(() => _currentp_add = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Local Address'),
                      maxLines: 4,
                      initialValue: userData.l_add,
                      validator: (val) => val.isEmpty
                          ? 'Please enter your local address'
                          : null,
                      onChanged: (val) => setState(() => _currentl_add = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Mobile Number'),
                      initialValue: userData.mob,
                      validator: (val) => val.isEmpty
                          ? 'Please enter your mobile number'
                          : null,
                      onChanged: (val) => setState(() => _currentmob = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Email Address'),
                      initialValue: userData.email,
                      validator: (val) => val.isEmpty
                          ? 'Please enter your email address'
                          : null,
                      onChanged: (val) => setState(() => _currentemail = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Enter MBBS degree details:'),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Year of admission'),
                      initialValue: userData.degreeDetailYrAdd,
                      validator: (val) => val.isEmpty
                          ? 'Please enter year of admission!'
                          : null,
                      onChanged: (val) =>
                          setState(() => _currentdegreeDetailYrAdd = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Year of passing'),
                      initialValue: userData.degreeDetailYrPass,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter year of passing' : null,
                      onChanged: (val) =>
                          setState(() => _currentdegreeDetailYrPass = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('College / University'),
                      initialValue: userData.degreeDetailCollege,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter college' : null,
                      onChanged: (val) =>
                          setState(() => _currentdegreeDetailCollege = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Enter MBBS Record details:'),
                     SizedBox(
                      height: 20.0,
                    ),

                    TextFormField(
                      decoration: textInputDecoration('1st Prof Percentage'),
                      initialValue: userData.degreeRecord1stProfP,
                      validator: (val) => val.isEmpty
                          ? 'Please enter 1st Prof Percentage'
                          : null,
                      onChanged: (val) =>
                          setState(() => _currentdegreeRecord1stProfP = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          '1st Prof medals or any distinctions'),
                      initialValue: userData.degreeRecord1stProfM,
                      validator: (val) => val.isEmpty
                          ? 'Please enter 1st Prof medals or any distinctions'
                          : null,
                      onChanged: (val) =>
                          setState(() => _currentdegreeRecord1stProfM = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('2nd Prof Percentage'),
                      initialValue: userData.degreeRecord2ndProfP,
                      validator: (val) => val.isEmpty
                          ? 'Please enter 2nd Prof Percentage'
                          : null,
                      onChanged: (val) =>
                          setState(() => _currentdegreeRecord2ndProfP = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          '2nd Prof medals or any distinctions'),
                      initialValue: userData.degreeRecord2ndProfM,
                      validator: (val) => val.isEmpty
                          ? 'Please enter 2nd Prof medals or any distinctions'
                          : null,
                      onChanged: (val) =>
                          setState(() => _currentdegreeRecord2ndProfM = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Mid Prof Percentage'),
                      initialValue: userData.degreeRecordMidProfP,
                      validator: (val) => val.isEmpty
                          ? 'Please enter Mid Prof Percentage'
                          : null,
                      onChanged: (val) =>
                          setState(() => _currentdegreeRecordMidProfP = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Mid Prof medals or any distinctions'),
                      initialValue: userData.degreeRecordMidProfM,
                      validator: (val) => val.isEmpty
                          ? 'Please enter mid Prof medals or any distinctions'
                          : null,
                      onChanged: (val) =>
                          setState(() => _currentdegreeRecordMidProfM = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Final Prof Percentage'),
                      initialValue: userData.degreeRecordFinalProfP,
                      validator: (val) => val.isEmpty
                          ? 'Please enter final Prof Percentage'
                          : null,
                      onChanged: (val) =>
                          setState(() => _currentdegreeRecordFinalProfP = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Final Prof medals or any distinctions'),
                      initialValue: userData.degreeRecordFinalProfM,
                      validator: (val) => val.isEmpty
                          ? 'Please enter final Prof medals or any distinctions'
                          : null,
                      onChanged: (val) =>
                          setState(() => _currentdegreeRecordFinalProfM = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Enter internship details:'),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration('Month / Year of beginning'),
                      initialValue: userData.internshipYrBeg,
                      validator: (val) => val.isEmpty
                          ? 'Please enter Month / Year of beginning'
                          : null,
                      onChanged: (val) =>
                          setState(() => _currentinternshipYrBeg = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration('Month / Year of completion'),
                      initialValue: userData.internshipYrComp,
                      validator: (val) => val.isEmpty
                          ? 'Please enter Month / Year of completion'
                          : null,
                      onChanged: (val) =>
                          setState(() => _currentinternshipYrComp = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration('College & Hospital'),
                      initialValue: userData.internshipCollege,
                      validator: (val) => val.isEmpty
                          ? 'Please enter College & Hospital'
                          : null,
                      onChanged: (val) =>
                          setState(() => _currentinternshipCollege = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Other Experience'),
                      maxLines: 4,
                      initialValue: userData.other,
                      validator: (val) => val.isEmpty
                          ? 'Please enter your other experience'
                          : null,
                      onChanged: (val) => setState(() => _currentother = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Medical Council Registration No. & Date'),
                      initialValue: userData.regNo,
                      validator: (val) => val.isEmpty
                          ? 'Please enter your registration number'
                          : null,
                      onChanged: (val) => setState(() => _currentregNo = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Month & Year of Joining the Course'),
                      initialValue: userData.joiningDate,
                      validator: (val) => val.isEmpty
                          ? 'Please enter your date of joining'
                          : null,
                      onChanged: (val) =>
                          setState(() => _currentjoiningDate = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Month & Year of appearing for the Degree / Diploma examination'),
                      initialValue: userData.appearDate,
                      validator: (val) => val.isEmpty
                          ? 'Please enter your date of appearing'
                          : null,
                      onChanged: (val) =>
                          setState(() => _currentappearDate = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Special Interest / Hobbies and Extra Curricular  Activities'),
                      maxLines: 4,
                      initialValue: userData.hobby,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter your hobby' : null,
                      onChanged: (val) => setState(() => _currenthobby = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration(
                          'Why I want to be an Obstetrics and Gynaecology Specialist?'),
                      maxLines: 20,
                      initialValue: userData.reason,
                      validator: (val) => val.isEmpty
                          ? 'Please enter the reason to be a gynaecologist'
                          : null,
                      onChanged: (val) => setState(() => _currentreason = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Colors.teal,
                      child: Text(
                        'update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        // if (_formKey.currentState.validate())
                        {
                          //await DatabaseService(uid: user.uid).mastersList();
                          //await DatabaseService(uid: user.uid).updateTestData();
                          await DatabaseService(uid: user.uid).updateUserData(
                            userData.approvalReady,
                            userData.isApproved,
                            userData.mentorName ?? '',
                            userData.mentorMail ?? '',
                            _currentName ?? userData.name,
                            _currentdob ?? userData.dob,
                            _currentp_add ?? userData.p_add,
                            _currentl_add ?? userData.l_add,
                            _currentmob ?? userData.mob,
                            _currentemail ?? userData.email,
                            _currentdegreeDetailYrAdd ??
                                userData.degreeDetailYrAdd,
                            _currentdegreeDetailYrPass ??
                                userData.degreeDetailYrPass,
                            _currentdegreeDetailCollege ??
                                userData.degreeDetailCollege,
                            _currentdegreeRecord1stProfP ??
                                userData.degreeRecord1stProfP,
                            _currentdegreeRecord2ndProfP ??
                                userData.degreeRecord2ndProfP,
                            _currentdegreeRecordMidProfP ??
                                userData.degreeRecordMidProfP,
                            _currentdegreeRecordFinalProfP ??
                                userData.degreeRecordFinalProfP,
                            _currentdegreeRecord1stProfM ??
                                userData.degreeRecord1stProfM,
                            _currentdegreeRecord2ndProfM ??
                                userData.degreeRecord2ndProfM,
                            _currentdegreeRecordMidProfM ??
                                userData.degreeRecordMidProfM,
                            _currentdegreeRecordFinalProfM ??
                                userData.degreeRecordFinalProfM,
                            _currentinternshipYrBeg ?? userData.internshipYrBeg,
                            _currentinternshipYrComp ??
                                userData.internshipYrComp,
                            _currentinternshipCollege ??
                                userData.internshipCollege,
                            _currentother ?? userData.other,
                            _currentregNo ?? userData.regNo,
                            _currentjoiningDate ?? userData.joiningDate,
                            _currentappearDate ?? userData.appearDate,
                            _currenthobby ?? userData.hobby,
                            _currentreason ?? userData.reason,
                          );
                          Navigator.pop(context);
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
