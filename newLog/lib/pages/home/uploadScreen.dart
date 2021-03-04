import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/uploads.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatefulWidget {
  final String uid;

  UploadScreen({this.uid});

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  var url;
  String upload = 'Upload';

  callback(_url) {
    setState(() {
      url = _url;
    });
  }

  Future<String> printImage(BuildContext context) async {
    final user = Provider.of<User>(context);
    try {
      var isImage = await DatabaseService(uid: user.uid).getImageVar();
      if (isImage) {
        final ref =
            FirebaseStorage.instance.ref().child('images/${widget.uid}.jpeg');
        url = await ref.getDownloadURL();
      } else {
        url = null;
      }
    } on Exception catch (exception) {
      print(
          "Exception: $exception"); // only executed if error is of type Exception
    } catch (error) {
      print(
          "Error: $error"); // executed for errors of all types other than Exception
    }
    if (url != null) {
      upload = 'Re-upload';
    }

    return url;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: printImage(context),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text('JNMCH eLogBook'),
            backgroundColor: Color.fromRGBO(273, 146, 158, 1),
          ),
          body: url == null
              ? FlatButton(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Tap to upload Profile picture',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey),
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageCapture(
                            uid: widget.uid, url: url, callback: callback)),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 150.0,
                      backgroundImage: NetworkImage(url),
                      backgroundColor: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            color: Color.fromRGBO(273, 146, 158, 1),
                            child: Text(
                              'Remove',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              await DatabaseService(uid: widget.uid)
                                  .createImageVar(false);
                              setState(() {
                                FirebaseStorage(
                                        storageBucket:
                                            'gs://newlog-1fde7.appspot.com')
                                    .ref()
                                    .child('images/${widget.uid}.jpeg')
                                    .delete();
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RaisedButton(
                            color: Color.fromRGBO(273, 146, 158, 1),
                            child: Text(
                              'Re-upload',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ImageCapture(
                                        uid: widget.uid,
                                        url: url,
                                        callback: callback)),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
