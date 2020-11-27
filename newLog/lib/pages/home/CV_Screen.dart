import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/CV_model.dart';
import 'package:jmnchelogbook/pages/home/update_cv.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';
import 'package:jmnchelogbook/pages/home/CV.dart';


class CV_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: UpdateCV(),
        );
      });
    }
    return StreamProvider<List<CV_model>>.value(
      value: DatabaseService().CV,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text('JNMCH eLogBook'),
            backgroundColor: Color.fromRGBO(273, 146, 158, 1),
            actions:<Widget> [
              FlatButton.icon(
                  onPressed: () => _showSettingsPanel(),
                  icon: Icon(Icons.edit, color: Colors.white,),
                  label: Text('Edit CV',
                  style: TextStyle( color: Colors.white,),)),

            ],
          ),
        body: CV_Info(),
      ),
    );
  }
}