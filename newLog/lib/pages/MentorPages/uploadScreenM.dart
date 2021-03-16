import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/home/uploads.dart';
import 'package:jmnchelogbook/services/database.dart';

class UploadScreenM extends StatefulWidget {
  final String uid;
  UploadScreenM({this.uid});

  @override
  _UploadScreenMState createState() => _UploadScreenMState();
}

class _UploadScreenMState extends State<UploadScreenM> {
  var url;
  String upload = 'Upload';

  callback(_url) {
    setState(() {
      url = _url;
    });
  }


  Future<String> printImage(BuildContext context) async {
    //final user = Provider.of<User>(context);
    try {

      var isImage = await DatabaseService(uid: widget.uid).getImageVar();
      if (isImage) {
        final ref =
        FirebaseStorage.instance.ref().child('images/${widget.uid}.jpeg');
        url = await ref.getDownloadURL();
        //print('url=$url');
      } else {
        url = 'noUrl';
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
    void _onLoading() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                new Text("Loading"),
              ],
            ),
          );
        },
      );
      /*new Future.delayed(new Duration(seconds: 3), () {
        Navigator.pop(context); //pop dialog
        _login();
      });*/
    }
    print(widget.uid);
    return FutureBuilder<String>(
      future: printImage(context),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile Picture'),
            backgroundColor: Colors.teal,
          ),
          body: (snapshot.hasData) ?
          url == 'noUrl'
              ? Align(
                alignment: Alignment.center,
                child: Text(
                  'No profile picture uploaded yet!',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.grey),
                ),
              )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                height: 300,
                width: 300,
                child: Image.network(url),
                ),
              ),
            ],
          ) :
        Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal),)),
        );
      },
    );
  }
}
