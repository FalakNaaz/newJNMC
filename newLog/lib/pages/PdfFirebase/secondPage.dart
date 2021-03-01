import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class ViewPdf extends StatefulWidget {
  final String passData;
  ViewPdf({this.passData});
  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  PDFDocument doc;
  @override
  Widget build(BuildContext context) {
    //get data from first class
    /*String data = ModalRoute.of(context).settings.arguments;
    print("data: $data");*/
    ViewNow() async {
      doc = await PDFDocument.fromURL(
          widget.passData);
      setState(() {

      });
    }
    print('url: ${widget.passData}');
    print('doc: $doc');


    Widget Loading(){
      ViewNow();
      if(doc==null){
        //return
        return Center(
          child: SizedBox(
            child: CircularProgressIndicator(),
            width: 30,
            height: 30,
          ),
        );
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("View PDF documents"),
      ),
      body: doc==null?Loading():PDFViewer(document: doc),
    );
  }
}
