import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jmnchelogbook/pages/home/uploadScreen.dart';
import 'package:jmnchelogbook/services/database.dart';

class nav extends StatefulWidget {
  final String uid;
  String url;
  Function(String) callback;

  nav({this.uid, this.url, this.callback});

/*final url2 = new ValueNotifier('');
  //nav(this.url2);
  UploadScreen(url2: widget.url2);*/

  @override
  _navState createState() => _navState();
}

class _navState extends State<nav> {
  //ValueListenable<String> url2;
  Future fn() async {
    final ref =
        FirebaseStorage.instance.ref().child('images/${widget.uid}.jpeg');
    // no need of the file extension, the name will do fine.
    widget.url = await ref.getDownloadURL();
    widget.callback(widget.url);
    await DatabaseService(uid: widget.uid).createImageVar(true);
    //widget.callback('from ');
  }

  void initState() {
    super.initState();
    fn();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
/*class UpdateURL{

}*/

/// Widget to capture and crop the image
class ImageCapture extends StatefulWidget {
  final String uid;
  String url;
  Function(String) callback;
  ImageCapture({this.uid, this.url, this.callback});

  createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  /// Active image file
  File _imageFile;

  /// Cropper plugin
  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: _imageFile.path,
        // ratioX: 1.0,
        // ratioY: 1.0,
        // maxWidth: 512,
        // maxHeight: 512,
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white,
        toolbarTitle: 'Crop It');

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  /// Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  /// Remove image
  void _clear() {
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(),
      body:  (_imageFile != null) ?
      ListView(
        children: <Widget>[

            Container(
                padding: EdgeInsets.all(32), child: Image.file(_imageFile)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  color: Colors.white,
                  child: Icon(Icons.crop),
                  onPressed: _cropImage,
                ),
                FlatButton(
                  color: Colors.white,
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Uploader(
                uid: widget.uid,
                file: _imageFile,
                url: widget.url,
                callback: widget.callback,
              ),
            ),
          ]
      )
    : SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 75.0),
                    child: RaisedButton(
                      color: Colors.teal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Take photo from camera',
                            style: TextStyle(color: Colors.white),
                          ),
                          IconButton(icon: Icon(Icons.photo_camera, color: Colors.white,), onPressed: null),
                        ],
                      ),
                      onPressed: ()  {_pickImage(ImageSource.camera);},
                    ),
                  ),
                  SizedBox(height:10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 75.0),
                    child: RaisedButton(
                      color: Colors.teal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Take photo from gallery',
                            style: TextStyle(color: Colors.white),
                          ),
                          IconButton(icon: Icon(Icons.photo_library, color: Colors.white,), onPressed: null),
                        ],
                      ),
                      onPressed: ()  {_pickImage(ImageSource.gallery);},
                    ),
                  ),

                ],
              ),
            )

    );
  }
}

/// Widget used to handle the management of
class Uploader extends StatefulWidget {
  final String uid;
  final File file;
  String url;
  Function(String) callback;

  Uploader({Key key, this.uid, this.file, this.url, this.callback})
      : super(key: key);

  createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  File file;

  var url1;

  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://newlog-1fde7.appspot.com');

  StorageUploadTask _uploadTask;

  _startUpload() {
    String filePath = 'images/${widget.uid}.jpeg';

    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (context, snapshot) {
            var event = snapshot?.data?.snapshot;
            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;

            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_uploadTask.isComplete)
                    // Text('🎉🎉🎉',
                    //     style: TextStyle(
                    //         color: Colors.greenAccent,
                    //         height: 2,
                    //         fontSize: 30)),
                    nav(
                      uid: widget.uid,
                      url: widget.url,
                      callback: widget.callback,
                    ),
                  if (_uploadTask.isPaused)
                    FlatButton(
                      child: Icon(Icons.play_arrow, size: 50),
                      onPressed: _uploadTask.resume,
                    ),
                  if (_uploadTask.isInProgress)
                    FlatButton(
                      child: Icon(Icons.pause, size: 50),
                      onPressed: _uploadTask.pause,
                    ),
                  LinearProgressIndicator(value: progressPercent),
                  Text(
                    '${(progressPercent * 100).toStringAsFixed(2)} % ',
                    style: TextStyle(fontSize: 50),
                  ),
                ]);
          });
    } else {
      return Column(
        children: [
          FlatButton.icon(
              color: Colors.teal,
              label: Text('Upload to LogBook'),
              icon: Icon(Icons.cloud_upload),
              onPressed: _startUpload),
          /* if(url1!=null)
          Container(
            child: Image.network(url1),
          ),*/
        ],
      );
    }
  }
}
