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
  String _currentdegreeDetail;
  String _currentdegreeRecord;
  String _currentiDetail;
  String _currentother;
  String _currentregNo;
  String _currentjoiningDate;
  String _currentappearDate;
  String _currenthobby;
  String _currentreason;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context) ;

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData)
          {
            UserData userData = snapshot.data;
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Update your CV',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Name'),
                      initialValue: userData.name,
                      validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                      onChanged: (val) => setState(() => _currentName = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Date of Birth'),
                      initialValue: userData.dob,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter your date of birth'
                          : null,
                      onChanged: (val) => setState(() => _currentdob = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Permanent Address'),
                      maxLines: 4,
                      initialValue: userData.p_add,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter your permanent address'
                          : null,
                      onChanged: (val) => setState(() => _currentp_add = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Local Address'),
                      maxLines: 4,
                      initialValue: userData.l_add,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter your local address'
                          : null,
                      onChanged: (val) => setState(() => _currentl_add = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Mobile Number'),
                      initialValue: userData.mob,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter your mobile number'
                          : null,
                      onChanged: (val) => setState(() => _currentmob = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Email Address'),
                      initialValue: userData.email,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter your email address'
                          : null,
                      onChanged: (val) => setState(() => _currentemail = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('MBBS Degree Detail(Year of Addmission, Year of Passing, College/University)'),
                      maxLines: 4,
                      initialValue: userData.degreeDetail,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter details of your degree'
                          : null,
                      onChanged: (val) => setState(() => _currentdegreeDetail = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('MBBS Record(1st Prof, 2nd Prof, Mid prof and Final Prof Percetages, medals or any distinctions)'),
                      initialValue: userData.degreeRecord,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter record of your degree'
                          : null,
                      onChanged: (val) => setState(() => _currentdegreeRecord = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Internship: Month / Year of beginning, Month / Year of completion, College & Hospital'),
                      maxLines: 4,
                      initialValue: userData.iDetail,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter your internship detail'
                          : null,
                      onChanged: (val) => setState(() => _currentiDetail = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Other Experience'),
                      maxLines: 4,
                      initialValue: userData.other,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter your other experience'
                          : null,
                      onChanged: (val) => setState(() => _currentother = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Medical Council Registration No. & Date'),
                      maxLines: 2,
                      initialValue: userData.regNo,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter your registration number'
                          : null,
                      onChanged: (val) => setState(() => _currentregNo = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Month & Year of Joining the Course'),
                      initialValue: userData.joiningDate,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter your date of joining'
                          : null,
                      onChanged: (val) => setState(() => _currentjoiningDate = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Month & Year of appearing for the Degree / Diploma examination'),
                      initialValue: userData.appearDate,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter your date of appearing'
                          : null,
                      onChanged: (val) => setState(() => _currentappearDate = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Special Interest / Hobbies and Extra Curricular  Activities'),
                      maxLines: 4,
                      initialValue: userData.hobby,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter your hobby'
                          : null,
                      onChanged: (val) => setState(() => _currenthobby = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Why I want to be an Obstetrics and Gynaecology Specialist?'),
                      maxLines: 20,
                      initialValue: userData.reason,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter the reason to be a gynaecologist'
                          : null,
                      onChanged: (val) => setState(() => _currentreason = val),
                    ),
                    SizedBox(height: 20.0,),
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
                             _currentdegreeDetail ?? userData.degreeDetail,
                             _currentdegreeRecord ?? userData.degreeRecord,
                             _currentiDetail ?? userData.iDetail,
                             _currentother ?? userData.other,
                             _currentregNo ?? userData.regNo,
                             _currentjoiningDate ?? userData.joiningDate,
                             _currentappearDate ?? userData.appearDate,
                             _currenthobby ?? userData.hobby,
                             _currentreason ?? userData.reason,

                          );
                          Navigator.pop(context);
                        }
                        // print(_currentName);
                        // print(_currentEnrl);
                        // print(_currentFacultyno);
                      },
                    )
                  ],
                ),
              ),
            );
          }
        else
          {
            return Container();
          }


      }
    );
  }
}