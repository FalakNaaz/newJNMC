import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/PdfFirebase/Modal.dart';
import 'package:jmnchelogbook/pages/PdfFirebase/secondPage.dart';
import 'package:provider/provider.dart';

class FirstPage2M extends StatefulWidget {
  final String uid;

  FirstPage2M({this.uid});

  @override
  _FirstPage2MState createState() => _FirstPage2MState();
}

class _FirstPage2MState extends State<FirstPage2M> {
  List<Modal> itemList = List();
  int i = 0;

  //User user;
  var mainReference;

  @override
  Widget build(BuildContext context) {
    //user = Provider.of<User>(context);
    //initStateFunction();
    //print('setState() called');
    mainReference =
        FirebaseDatabase.instance.reference().child(widget.uid + '/');
    mainReference.once().then((DataSnapshot snap) {
      var data = snap.value;
      itemList.clear();
      //print('data=$data');
      if (data != null)
        data.forEach((key, value) {
          Modal m = new Modal(value['PDF'], value['fileName']);
          itemList.add(m);
        });
      //print(" from above build value is ${itemList.length}");
      if (i == 0) {
        setState(() {});
        i++;
      }
    });
    //Future.delayed(const Duration(milliseconds: 5000), () {});
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Upload your PDF here",
        ),
      ),
      body: itemList.length == 0
          ? Align(
              alignment: Alignment.center,
              child: Text(
                'Nothing to display',
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                //print(index);
                //print(" from scaffold value is ${itemList.length}");
                return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: GestureDetector(
                      onTap: () {
                        String passData = itemList[index].link;
                        //print("passdata: $passData");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewPdf(
                                      passData: passData,
                                    ),
                                settings: RouteSettings()));
                      },
                     /* child: Stack(
                        children: <Widget>[
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/bg.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 140,
                              child: Card(
                                margin: EdgeInsets.all(18),
                                elevation: 7.0,
                                child: Center(
                                  child: Text(itemList[index].name.toString()),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),*/
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.cyan[50],
                          shadowColor: Colors.blueGrey,
                          child:ListTile(
                              leading:  Icon(Icons.menu_book, size: 35, color: Colors.teal,),
                              title: Text(itemList[index].name.toString(), style: TextStyle(color: Colors.black),),
                              subtitle: Text('Tap to view'),
                              //trailing:  IconButton(icon: Icon(Icons.more_vert, size: 30, color: Colors.teal,), onPressed: ,),
                              //selected: true,
                          ),

                        ),
                      ),
                    ));
              },
            ),
    );
  }
}
