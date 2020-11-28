import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class PublicationsInfo extends StatefulWidget {
  @override
  _PublicationsInfoState createState() => _PublicationsInfoState();
}

class _PublicationsInfoState extends State<PublicationsInfo> {

  Widget _createTextArea(String label, String text)
  {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Text('$label $text',
        //textAlign: TextAlign.right,
        style: TextStyle(

        ),),

    );
  }
  @override
  Widget build(BuildContext context) {
    //final Publications = Provider.of<List<Publications_model>>(context) ?? [];
    final publications = Provider.of<User>(context) ;

    // return ListView.builder(
    //   itemCount: Publications.length,
    //   itemBuilder: (context, index) {
    //     return Publications_Tile(Publications_item: Publications[index]);
    //   },
    // );
    return StreamBuilder<PublicationsData>(
        stream: DatabaseService(uid: publications.uid).publicationsData,
        builder: (context, snapshot) {
          if(snapshot.hasData)
          {
            PublicationsData publicationsData = snapshot.data;
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.fromLTRB(190.0, 10.0, 10.0, 0.0),
                        child: Text('Publications',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,

                          ),),
                      ),
                      // Text('Falak'),
                      // Text('Naz'),
                      //_createTextArea('Name', userData.name),
                      _createTextArea('Papers Published/ Communicated:', publicationsData.papers),
                      _createTextArea('Conferences/CMEs/Workshops attended: ', publicationsData.conferences),
                      _createTextArea('Outreach activity/Social Work: ', publicationsData.social),
                      _createTextArea('Organisational Experience: ', publicationsData.organization),
                      _createTextArea('Any other achievement/Awards: ', publicationsData.achievement),

                    ]),
              ),

            );

          }
          else{
            return Container();
          }

        }
    );
  }
}