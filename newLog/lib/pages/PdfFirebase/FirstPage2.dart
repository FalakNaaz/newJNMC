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

class FirstPage2 extends StatefulWidget {
  @override
  _FirstPage2State createState() => _FirstPage2State();
}

class _FirstPage2State extends State<FirstPage2> {
  List<Modal> itemList = List();
  var _progress;
  int i = 0;
  User user;
  bool inProgress = false;
  var mainReference;
  String _text = "My File";
  TextEditingController _c;

  @override
  initState() {
    _c = new TextEditingController();
    _progress = -1.0;
    super.initState();
  }

  _displaySnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  Future dialog(File file, String fileName, BuildContext context) async {
    await showDialog(
        child: new Dialog(
          //insetPadding: EdgeInsets.symmetric(vertical: 50.0,horizontal: 80.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          //elevation: 0,
          //backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new TextField(
                    decoration: new InputDecoration(
                      hintText: "File Name",
                    ),
                    controller: _c,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(
                    minWidth: 100,
                    height: 50,
                    child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            this._text = _c.text;
                            savePdf(file.readAsBytesSync(), fileName, context);
                            Navigator.pop(context);
                          });
                        },
                        color: Colors.teal,
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          //side: BorderSide(color: Color.fromRGBO(146, 180, 237, 1))
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        context: context);
    return this._text;
  }

  Future<void> _showMyDialog(
      BuildContext context1, String fileUrl, int index) async {
    return showDialog<void>(
      context: context,
      //barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to delete this document?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.teal),
              ),
              onPressed: () {
                deleteFireBaseStorageItem(context1, fileUrl, index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void deleteFireBaseStorageItem(
      BuildContext context, String fileUrl, int index) {
    FirebaseStorage.instance.getReferenceFromUrl(fileUrl).then((reference) {
      reference.delete();
      mainReference =
          FirebaseDatabase.instance.reference().child(user.uid + '/');
      mainReference.once().then((DataSnapshot snap) {
        var data = snap.value;
        data.forEach((key, value) {
          if (value['PDF'] == itemList[index].link)
            FirebaseDatabase.instance
                .reference()
                .child(user.uid + '/' + key)
                .remove();
        });
      });
      _displaySnackBar(context, 'file deleted successfully');
      _displaySnackBar(context,
          'If you don\'t see your file deleted here, press back and come again');
    }).catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    print(_progress);
    user = Provider.of<User>(context);
    //initStateFunction();
    //print('setState() called');
    mainReference = FirebaseDatabase.instance.reference().child(user.uid + '/');
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
        //Text('Uploading ${(_progress * 100).toStringAsFixed(2)} %'),
      ),
      body: itemList.length == 0
          ? (_progress < 1.00 && _progress >= 0.0) ?
                LinearProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                  value: _progress,
                  semanticsLabel: 'Text',
                ):
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Nothing to display',
                    style:
                        TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                )
          : Column(
              children: [
                if(_progress < 1.00 && _progress >= 0.0)...[
                LinearProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                  value: _progress,
                  semanticsLabel: 'Text',
                ),
                  Text('Uploading file...'),
                ],
                Expanded(
                  child: ListView.builder(
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
                          //onLongPress:() => _showMyDialog(context, itemList[index].link,index),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.cyan[50],
                              shadowColor: Colors.blueGrey,
                              child: ListTile(
                                leading: Icon(
                                  Icons.menu_book,
                                  size: 35,
                                  color: Colors.teal,
                                ),
                                title: Text(
                                  itemList[index].name.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text('Tap to view'),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.teal,
                                  ),
                                  onPressed: () {
                                    _showMyDialog(
                                        context, itemList[index].link, index);
                                  },
                                ),
                                //selected: true,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () {
            getPdfAndUpload(context);
            //dialog();
            //print(_text);
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.teal,
        ),
      ),
    );
  }

  Future getPdfAndUpload(BuildContext context) async {
    var rng = new Random();
    String randomName = "";
    for (var i = 0; i < 20; i++) {
      //generate
      //print(rng.nextInt(100));
      randomName += rng.nextInt(100).toString();
    }
    File file = await FilePicker.getFile(
      type: FileType.custom,
    );
    String fileName = '${randomName}.pdf';
    if (file != null) await dialog(file, fileName, context);
    //function call
    //print(fileName);
    //print('${file.readAsBytesSync()}');
  }

  Future savePdf(List<int> asset, String name, BuildContext context) async {
    //print(user.uid);
    StorageReference reference =
        FirebaseStorage.instance.ref().child(user.uid + '/' + name);
    StorageUploadTask uploadTask = reference.putData(asset);
    uploadTask.events.listen((event) {
      setState(() {
        _progress = event.snapshot.bytesTransferred.toDouble() /
            event.snapshot.totalByteCount.toDouble();
      });
    }).onError((error) {
      // do something to handle error
    });
    String url = await (await uploadTask.onComplete).ref.getDownloadURL();
    //inProgress = await (await uploadTask.isInProgress);

    //String _filename = dialog();
    documentFileUpload(url, context, this._text);
    return url;
    //function call
  }

  String CreateCryptoRandomString([int length = 32]) {
    //generate key
    final Random _random = Random.secure();
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    return base64Url.encode(values);
  }

  void documentFileUpload(String str, BuildContext context, String _filename) {
    var data = {
      //store data
      "PDF": str,
      "fileName": _filename,
    };
    mainReference.child(CreateCryptoRandomString()).set(data).then((v) {
      //print("Stored Successfully");
    });
    _displaySnackBar(context, 'File uploaded successfully');
    _displaySnackBar(context,
        'If you don\'t see your uploaded file here, press back and come again!');
    //Scaffold.of(context).showSnackBar(snackBar);
    setState(() {});
  }
/* @override
  void initState(){
    initStateFunction();
  }*/
}
