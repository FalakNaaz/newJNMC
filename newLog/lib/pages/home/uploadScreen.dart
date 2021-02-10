import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jmnchelogbook/pages/home/uploads.dart';
import 'package:link/link.dart';
import 'package:url_launcher/url_launcher.dart';

class UploadScreen extends StatefulWidget {
  final String uid;

  UploadScreen({this.uid});

  /*final ValueListenable<String> url2;

  UploadScreen(this.url2);*/

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  var url2 = 'hi';
  var url;
  String upload = 'Upload';
  //var url;
  callback(_url) {
    print("urrrl: $url2");
    setState(() {
      url2 = _url;
      url = _url;
      print("urlllllll: $url2");
    });
  }
  Future<String> printImage() async {
    final ref =
        FirebaseStorage.instance.ref().child('images/${widget.uid}.jpeg');
    // no need of the file extension, the name will do fine.
     url = await ref.getDownloadURL();
    print('images/${widget.uid}.jpeg');
    print(url);
    if (url != null) {
      upload = 'Re-upload';
    }

    return url;
  }
  void _showErrorSnackBar() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Oops... the URL couldn\'t be opened!'),
      ),
    );
  }

  //final url2 = new ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: printImage(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text('JNMCH eLogBook'),
            backgroundColor: Color.fromRGBO(273, 146, 158, 1),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Upload Image'),
                    ),
                    RaisedButton(
                      color: Color.fromRGBO(273, 146, 158, 1),
                      child: Text(
                        upload,
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ImageCapture(uid: widget.uid, url: url2, callback: callback)),
                        );
                      },
                    ),
                    if(url != null)
                    Link(
                      child: Text(
                        'See uploaded image',
                        style: TextStyle(
                          decoration:
                          TextDecoration.underline, // add add underline in text
                        ),
                      ),
                      url: url,
                      onError: _showErrorSnackBar,
                    ),

                    /* if(widget.url2 != null)
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          height: 75,
                          width: 75,
                          child: Image.network(widget.url2.toString()),
                        ),*/
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Upload file'),
                    ),
                    RaisedButton(
                      color: Color.fromRGBO(273, 146, 158, 1),
                      child: Text(
                        'Upload',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    )
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
