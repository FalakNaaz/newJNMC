// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// class UploadScreen extends StatefulWidget {
//   final ValueListenable<String> url2;
//   UploadScreen(this.url2);
//   @override
//   _UploadScreenState createState() => _UploadScreenState();
// }
//
// class _UploadScreenState extends State<UploadScreen> {
//   var url;
//   String upload = 'Upload';
//   Future<String> printImage() async{
//       final ref = FirebaseStorage.instance.ref().child('images/falak.png');
//       // no need of the file extension, the name will do fine.
//       url = await ref.getDownloadURL();
//
//       print(url);
//       if(url!=null)
//         {
//           upload = 'Re-upload';
//         }
//
//     return url;
//   }
//   //final url2 = new ValueNotifier('');
//   @override
//   Widget build(BuildContext context) {
//         return FutureBuilder<String>(
//           future: printImage(),
//           builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//             return Scaffold(
//                 appBar: AppBar(
//                 title: Text('JNMCH eLogBook'),
//                 backgroundColor: Color.fromRGBO(273, 146, 158, 1),
//                 ),
//                 body: ValueListenableBuilder<String>(
//                 valueListenable: widget.url2,
//                 builder: (context, value, child) {
//
//                   return Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Row(
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text('Upload Image'),
//                             ),
//                             RaisedButton(
//                               color: Color.fromRGBO(273, 146, 158, 1),
//                               child: Text(
//                                 upload,
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                               onPressed: () async {
//                                 Navigator.pushNamed(context, '/imageCapture');
//                               },
//                             ),
//                             if(widget.url2 != null)
//                               Container(
//                                 padding: EdgeInsets.only(left: 20),
//                                 height: 75,
//                                 width: 75,
//                                 child: Image.network(widget.url2.toString()),
//                               ),
//
//                           ],
//
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Row(
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text('Upload file'),
//                             ),
//                             RaisedButton(
//                               color: Color.fromRGBO(273, 146, 158, 1),
//                               child: Text(
//                                 'Upload',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                               onPressed: () {},
//                             )
//                           ],
//
//                         ),
//                       ),
//
//                     ],
//                   );
//                 }
//               ),
//             );
//           },
//         );
//   }
// }
import 'package:flutter/cupertino.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

