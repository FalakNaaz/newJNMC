import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/shared/constants.dart';
import 'package:provider/provider.dart';

class UpdatePublications extends StatefulWidget {
  @override
  _UpdatePublicationsState createState() => _UpdatePublicationsState();
}

class _UpdatePublicationsState extends State<UpdatePublications> {
  final _formKey = GlobalKey<FormState>();

  //form values
  String _currentpapers;
  String _currentconferences;
  String _currentsocial;
  String _currentorganization;
  String _currentachievement;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context) ;

    return StreamBuilder<PublicationsData>(
        stream: DatabaseService(uid: user?.uid).publicationsData,
        builder: (context, snapshot) {
          if(snapshot.hasData)
          {
            PublicationsData publicationsData = snapshot.data;
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Update your Publications info',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration(' Papers Published/ Communicated: '),
                      maxLines: 4,
                      initialValue: publicationsData.papers,
                      validator: (val) => val.isEmpty ? 'Please enter papers detail' : null,
                      onChanged: (val) => setState(() => _currentpapers = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Conferences/CMEs/Workshops attended:'),
                      maxLines: 4,
                      initialValue: publicationsData.conferences,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter conferences'
                          : null,
                      onChanged: (val) => setState(() => _currentconferences = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Outreach activity/Social Work:'),
                      maxLines: 4,
                      initialValue: publicationsData.social,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter Outreach activity/Social Work:'
                          : null,
                      onChanged: (val) => setState(() => _currentsocial = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Organisational Experience:'),
                      maxLines: 4,
                      initialValue: publicationsData.organization,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter Organisational Experience:'
                          : null,
                      onChanged: (val) => setState(() => _currentorganization = val),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration('Any other achievement/Awards: '),
                      maxLines: 4,
                      initialValue: publicationsData.achievement,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Any other achievement/Awards'
                          : null,
                      onChanged: (val) => setState(() => _currentachievement = val),
                    ),
                    SizedBox(height: 20.0,),

                    RaisedButton(
                      color: Colors.teal,
                      child: Text(
                        'update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                         if (_formKey.currentState.validate())
                        {
                          await DatabaseService(uid: user.uid).updatePublicationsData(
                            false,
                            publicationsData.mentorName,
                            publicationsData.mentorMail,
                            _currentpapers ?? publicationsData.papers,
                            _currentconferences ?? publicationsData.conferences,
                            _currentsocial ?? publicationsData.social,
                            _currentorganization ?? publicationsData.organization,
                            _currentachievement ?? publicationsData.achievement,
                            publicationsData.approvalReady,

                          );
                          Navigator.pop(context);
                        }
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