import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/pages/home/logOfCasesInfo.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class LogOfCases extends StatefulWidget {
  final int rotationNo;
  LogOfCases({this.rotationNo});
  @override
  _LogOfCasesState createState() => _LogOfCasesState();
}

class _LogOfCasesState extends State<LogOfCases> {
  String text = '';
  bool shouldDisplay = false;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  Widget _buildTextBoxField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: 10,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Case Report',
          hintText: 'Write....',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
  Widget _buildTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Text',
          hintText: 'Write...',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
  Widget _buildTextProcedureField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Procedure',
          hintText: 'Write...',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
  Widget _buildTextDiagnosisField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Diagnosis',
          hintText: 'Write...',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('JNMCH eLogBook'),
        backgroundColor: Colors.teal,
      ),
    body: LogOfCasesInfo(rotationNo: widget.rotationNo),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: IconButton(icon: Icon(Icons.add,),),
        onPressed: ()async {await DatabaseService(uid:user.uid).incrementPatientDoc(widget.rotationNo);},
      ),
    );
  }
}
