import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class CaseroutineInfo extends StatefulWidget {
  @override
  _CaseroutineInfoState createState() => _CaseroutineInfoState();
}

class _CaseroutineInfoState extends State<CaseroutineInfo> {
  Widget _createTextArea(String label, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Text(
        '$label $text',
        //textAlign: TextAlign.right,
        style: TextStyle(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final Publications = Provider.of<List<Publications_model>>(context) ?? [];
    final caseroutine = Provider.of<User>(context);

    // return ListView.builder(
    //   itemCount: Publications.length,
    //   itemBuilder: (context, index) {
    //     return Publications_Tile(Publications_item: Publications[index]);
    //   },
    // );
    return StreamBuilder<CaseroutineData>(
        stream: DatabaseService(uid: caseroutine.uid).caseroutineData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            CaseroutineData caseroutineData = snapshot.data;
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding:
                        const EdgeInsets.fromLTRB(190.0, 10.0, 10.0, 0.0),
                        child: Text(
                          'Case Rotation',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Text('Falak'),
                      // Text('Naz'),
                      //_createTextArea('Name', userData.name),
                      _createTextArea('Date:', caseroutineData.pdate),
                      _createTextArea('Name ', caseroutineData.pname),
                      _createTextArea('L1 ', caseroutineData.l1),
                      _createTextArea('L2', caseroutineData.l2),
                      _createTextArea('L3', caseroutineData.l3),
                      _createTextArea('Strategy', caseroutineData.strategy),
                    ]),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}