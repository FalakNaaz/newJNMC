import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';

class UpdateEndRotation extends StatefulWidget {
  final int rotationNo;

  UpdateEndRotation({this.rotationNo});

  @override
  _UpdateEndRotationState createState() => _UpdateEndRotationState();
}

class _UpdateEndRotationState extends State<UpdateEndRotation> {
  final _formKey = GlobalKey<FormState>();

  //form values
  String _currentantCareL;
  String _currentiCarePatientsL;
  String _currentpCarePatientsL;
  String _currentobTechL;
  String _currentgynaeTech1L;
  String _currentgynaeTech2L;
  String _currentfamilyPlanningL;
  String _currentaccAndResL;
  String _currentrespectL;
  String _currentcomm1L;
  String _currentcomm2L;
  String _currentinformedL;
  String _currentpatientSafetyL;
  String _currentsystemImpL;
  String _currentantCareR;
  String _currentiCarePatientsR;
  String _currentpCarePatientsR;
  String _currentobTechR;
  String _currentgynaeTech1R;
  String _currentgynaeTech2R;
  String _currentfamilyPlanningR;
  String _currentaccAndResR;
  String _currentrespectR;
  String _currentcomm1R;
  String _currentcomm2R;
  String _currentinformedR;
  String _currentpatientSafetyR;
  String _currentsystemImpR;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<List<EndRotation>>(
        stream: DatabaseService(uid: user.uid).listOfEndRotation,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<EndRotation> listOfEndRotation = snapshot.data;
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Category: Patient Care',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Competency: Antepartum Care and Complications of Pregnancy',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level: ',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.normal),
                        ),
                        DropdownButton<String>(
                          value: _currentantCareL ??
                              listOfEndRotation[widget.rotationNo].antCareL,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentantCareL = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4', '5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: 175,
                          child: TextFormField(
                            decoration: textInputDecoration(' Remarks '),
                            maxLines: 1,
                            initialValue:
                                listOfEndRotation[widget.rotationNo].antCareR,
                            validator: (val) =>
                                val.isEmpty ? 'Please enter the remarks' : null,
                            onChanged: (val) =>
                                setState(() => _currentantCareR = val),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Competency: 	Care of Patients in the Intrapartum Period',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level: ',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.normal),
                        ),
                        DropdownButton<String>(
                          value: _currentiCarePatientsL ??
                              listOfEndRotation[widget.rotationNo].iCarePatientsL,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentiCarePatientsL = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4', '5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: 175,
                          child: TextFormField(
                            decoration: textInputDecoration(' Remarks '),
                            maxLines: 1,
                            initialValue:
                                listOfEndRotation[widget.rotationNo].antCareR,
                            validator: (val) =>
                                val.isEmpty ? 'Please enter the remarks' : null,
                            onChanged: (val) =>
                                setState(() => _currentiCarePatientsR = val),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Competency:	Care of Patients in the Postpartum Period',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level: ',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.normal),
                        ),
                        DropdownButton<String>(
                          value: _currentpCarePatientsL ??
                              listOfEndRotation[widget.rotationNo].pCarePatientsL,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentpCarePatientsL = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4', '5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: 175,
                          child: TextFormField(
                            decoration: textInputDecoration(' Remarks '),
                            maxLines: 1,
                            initialValue:
                                listOfEndRotation[widget.rotationNo].patientSafetyR,
                            validator: (val) =>
                                val.isEmpty ? 'Please enter the remarks' : null,
                            onChanged: (val) =>
                                setState(() => _currentpCarePatientsR = val),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Competency: 	Obstetrical Technical Skills',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level: ',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.normal),
                        ),
                        DropdownButton<String>(
                          value: _currentobTechL ??
                              listOfEndRotation[widget.rotationNo].obTechL,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentobTechL = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4', '5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: 175,
                          child: TextFormField(
                            decoration: textInputDecoration(' Remarks '),
                            maxLines: 1,
                            initialValue:
                                listOfEndRotation[widget.rotationNo].obTechR,
                            validator: (val) =>
                                val.isEmpty ? 'Please enter the remarks' : null,
                            onChanged: (val) =>
                                setState(() => _currentobTechR = val),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Competency: 	Gynecology Technical Skills: Laparotomyand vaginal surgery (e.g., abdominal Hysterectomy, Myomectomy, Adnexectomy, Vaginal Hysterectomy, Colporrhaphy, Mid-urethral Sling)		',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level: ',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.normal),
                        ),
                        DropdownButton<String>(
                          value: _currentgynaeTech1L ??
                              listOfEndRotation[widget.rotationNo].gynaeTech1L,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentgynaeTech1L = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4', '5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: 175,
                          child: TextFormField(
                            decoration: textInputDecoration(' Remarks '),
                            maxLines: 1,
                            initialValue:
                                listOfEndRotation[widget.rotationNo].gynaeTech1R,
                            validator: (val) =>
                                val.isEmpty ? 'Please enter the remarks' : null,
                            onChanged: (val) =>
                                setState(() => _currentgynaeTech1R = val),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Competency:	Gynecology Technical Skills: Endoscopy (Laparoscopy, Hysteroscopy, Cystoscopy)		',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level: ',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.normal),
                        ),
                        DropdownButton<String>(
                          value: _currentgynaeTech2L ??
                              listOfEndRotation[widget.rotationNo].gynaeTech2L,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentgynaeTech2L = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4', '5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: 175,
                          child: TextFormField(
                            decoration: textInputDecoration(' Remarks '),
                            maxLines: 1,
                            initialValue:
                                listOfEndRotation[widget.rotationNo].gynaeTech2R,
                            validator: (val) =>
                                val.isEmpty ? 'Please enter the remarks' : null,
                            onChanged: (val) =>
                                setState(() => _currentgynaeTech2R = val),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Competency: 	Family Planning',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level: ',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.normal),
                        ),
                        DropdownButton<String>(
                          value: _currentfamilyPlanningL ??
                              listOfEndRotation[widget.rotationNo].familyPlanningL,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentfamilyPlanningL = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4', '5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: 175,
                          child: TextFormField(
                            decoration: textInputDecoration(' Remarks '),
                            maxLines: 1,
                            initialValue:
                                listOfEndRotation[widget.rotationNo].familyPlanningR,
                            validator: (val) =>
                                val.isEmpty ? 'Please enter the remarks' : null,
                            onChanged: (val) =>
                                setState(() => _currentfamilyPlanningR = val),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Category: Professionalism',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Competency: Professionalism	Accountability and Responsiveness to the Needs of Patients, Society, and the Profession	',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level: ',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.normal),
                        ),
                        DropdownButton<String>(
                          value: _currentaccAndResL ??
                              listOfEndRotation[widget.rotationNo].accAndResL,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentaccAndResL = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4', '5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: 175,
                          child: TextFormField(
                            decoration: textInputDecoration(' Remarks '),
                            maxLines: 1,
                            initialValue:
                            listOfEndRotation[widget.rotationNo].accAndResR,
                            validator: (val) =>
                            val.isEmpty ? 'Please enter the remarks' : null,
                            onChanged: (val) =>
                                setState(() => _currentaccAndResR = val),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Competency: 		Respect for Patient Privacy, Autonomy, Patient-Physician Relationship		',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level: ',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.normal),
                        ),
                        DropdownButton<String>(
                          value: _currentrespectL ??
                              listOfEndRotation[widget.rotationNo].respectL,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentrespectL = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4', '5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: 175,
                          child: TextFormField(
                            decoration: textInputDecoration(' Remarks '),
                            maxLines: 1,
                            initialValue:
                            listOfEndRotation[widget.rotationNo].respectR,
                            validator: (val) =>
                            val.isEmpty ? 'Please enter the remarks' : null,
                            onChanged: (val) =>
                                setState(() => _currentrespectR = val),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Category: Interpersonal and Communication Skills	Communication with Patients and Families',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Competency: Interpersonal and Communication Skills	Communication with Patients and Families',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level: ',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.normal),
                        ),
                        DropdownButton<String>(
                          value: _currentcomm1L ??
                              listOfEndRotation[widget.rotationNo].comm1L,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentcomm1L = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4', '5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: 175,
                          child: TextFormField(
                            decoration: textInputDecoration(' Remarks '),
                            maxLines: 1,
                            initialValue:
                            listOfEndRotation[widget.rotationNo].comm1R,
                            validator: (val) =>
                            val.isEmpty ? 'Please enter the remarks' : null,
                            onChanged: (val) =>
                                setState(() => _currentcomm1R = val),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Competency: 	Communication with Physicians and Other Health Professionals and Teamwork		',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level: ',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.normal),
                        ),
                        DropdownButton<String>(
                          value: _currentcomm2L ??
                              listOfEndRotation[widget.rotationNo].comm2L,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentcomm2L = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4', '5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: 175,
                          child: TextFormField(
                            decoration: textInputDecoration(' Remarks '),
                            maxLines: 1,
                            initialValue:
                            listOfEndRotation[widget.rotationNo].comm2R,
                            validator: (val) =>
                            val.isEmpty ? 'Please enter the remarks' : null,
                            onChanged: (val) =>
                                setState(() => _currentcomm2R = val),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Competency:	Informed Consent and Shared Decision Making		',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level: ',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.normal),
                        ),
                        DropdownButton<String>(
                          value: _currentinformedL ??
                              listOfEndRotation[widget.rotationNo].informedL,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentinformedL = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4', '5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: 175,
                          child: TextFormField(
                            decoration: textInputDecoration(' Remarks '),
                            maxLines: 1,
                            initialValue:
                            listOfEndRotation[widget.rotationNo].informedR,
                            validator: (val) =>
                            val.isEmpty ? 'Please enter the remarks' : null,
                            onChanged: (val) =>
                                setState(() => _currentinformedR = val),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Category: Practice-based Learning',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Competency: Patient Safety and Systems Approach to Medical Errors: Participates in identifying system errors and implementing potential systems solutions',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level: ',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.normal),
                        ),
                        DropdownButton<String>(
                          value: _currentpatientSafetyL ??
                              listOfEndRotation[widget.rotationNo].patientSafetyL,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentpatientSafetyL = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4', '5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: 175,
                          child: TextFormField(
                            decoration: textInputDecoration(' Remarks '),
                            maxLines: 1,
                            initialValue:
                            listOfEndRotation[widget.rotationNo].patientSafetyR,
                            validator: (val) =>
                            val.isEmpty ? 'Please enter the remarks' : null,
                            onChanged: (val) =>
                                setState(() => _currentpatientSafetyR = val),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),Text(
                      'Category: System-based Practice ',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Competency: Systems improvement: Cost-effective Care and Patient Advocacy',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level: ',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.normal),
                        ),
                        DropdownButton<String>(
                          value: _currentsystemImpL ??
                              listOfEndRotation[widget.rotationNo].systemImpL,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          iconEnabledColor: Colors.teal,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              this._currentsystemImpL = newValue;
                            });
                          },
                          items: <String>['1', '2', '3', '4', '5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: 175,
                          child: TextFormField(
                            decoration: textInputDecoration(' Remarks '),
                            maxLines: 1,
                            initialValue:
                            listOfEndRotation[widget.rotationNo].systemImpR,
                            validator: (val) =>
                            val.isEmpty ? 'Please enter the remarks' : null,
                            onChanged: (val) =>
                                setState(() => _currentsystemImpR = val),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    RaisedButton(
                      color: Colors.teal,
                      child: Text(
                        'update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                         if (_formKey.currentState.validate())
                        {
                          await DatabaseService(uid: user.uid)
                              .updateEndRotation(
                            widget.rotationNo,
                            _currentantCareL ?? listOfEndRotation[widget.rotationNo].antCareL,
                            _currentiCarePatientsL ?? listOfEndRotation[widget.rotationNo].iCarePatientsL,
                            _currentpCarePatientsL ?? listOfEndRotation[widget.rotationNo].pCarePatientsL,
                            _currentobTechL ?? listOfEndRotation[widget.rotationNo].obTechL,
                            _currentgynaeTech1L ?? listOfEndRotation[widget.rotationNo].gynaeTech1L,
                            _currentgynaeTech2L ?? listOfEndRotation[widget.rotationNo].gynaeTech2L,
                            _currentfamilyPlanningL ?? listOfEndRotation[widget.rotationNo].familyPlanningL,
                            _currentaccAndResL ?? listOfEndRotation[widget.rotationNo].accAndResL,
                            _currentrespectL ?? listOfEndRotation[widget.rotationNo].respectL,
                            _currentcomm1L ?? listOfEndRotation[widget.rotationNo].comm1L,
                            _currentcomm2L ?? listOfEndRotation[widget.rotationNo].comm2L,
                            _currentinformedL ?? listOfEndRotation[widget.rotationNo].informedL,
                            _currentpatientSafetyL ?? listOfEndRotation[widget.rotationNo].patientSafetyL,
                            _currentsystemImpL ?? listOfEndRotation[widget.rotationNo].systemImpL,
                             _currentantCareR ?? listOfEndRotation[widget.rotationNo].antCareR,
                            _currentiCarePatientsR ?? listOfEndRotation[widget.rotationNo].iCarePatientsR,
                            _currentpCarePatientsR ?? listOfEndRotation[widget.rotationNo].pCarePatientsR,
                            _currentobTechR ?? listOfEndRotation[widget.rotationNo].obTechR,
                            _currentgynaeTech1R ?? listOfEndRotation[widget.rotationNo].gynaeTech1R,
                            _currentgynaeTech2R ?? listOfEndRotation[widget.rotationNo].gynaeTech2R,
                            _currentfamilyPlanningR ?? listOfEndRotation[widget.rotationNo].familyPlanningR,
                            _currentaccAndResR ?? listOfEndRotation[widget.rotationNo].accAndResR,
                            _currentrespectR ?? listOfEndRotation[widget.rotationNo].respectR,
                            _currentcomm1R ?? listOfEndRotation[widget.rotationNo].comm1R,
                            _currentcomm2R ?? listOfEndRotation[widget.rotationNo].comm2R,
                            _currentinformedR ?? listOfEndRotation[widget.rotationNo].informedR,
                            _currentpatientSafetyR ?? listOfEndRotation[widget.rotationNo].patientSafetyR,
                            _currentsystemImpR ?? listOfEndRotation[widget.rotationNo].systemImpR,


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
