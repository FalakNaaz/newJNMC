import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';


class LogOfCases extends StatefulWidget {
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

   Widget _buildTextBoxField(){
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: TextField(
         maxLines: 10,
        keyboardType: TextInputType.text,
         decoration: InputDecoration(
            labelText: 'Case Report',
            hintText: 'Write....',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
         ),
       ),
     ); 
   }

    Widget _buildTextField(){
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: TextField(
        keyboardType: TextInputType.text,
         decoration: InputDecoration(
            labelText: 'Text',
            hintText: 'Write...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
         ),
       ),
     ); 
   }

    Widget _buildTextProcedureField(){
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: TextField(
        keyboardType: TextInputType.text,
         decoration: InputDecoration(
            labelText: 'Procedure',
            hintText: 'Write...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
         ),
       ),
     ); 
   }

    Widget _buildTextDiagnosisField(){
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: TextField(
        keyboardType: TextInputType.text,
         decoration: InputDecoration(
            labelText: 'Diagnosis',
            hintText: 'Write...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
         ),
       ),
     ); 
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JNMCH eLogBook'),
        backgroundColor: Color.fromRGBO(273, 146, 158, 1),
      ),
    body: 

    Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
            child: Center(child: Text("Log of Cases/Procedures", style: TextStyle(fontSize: 18, color: Colors.amber, fontWeight: FontWeight.bold),)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("The case logs ensure that each of you acquires a reasonably equivalent educational experience and a sufficient volume of procedures. It helps assess the breadth and depth of your clinical experience gained during residency so that the quality of surgical education can be easily monitored and optimized. While no minimum number of procedures has been determined, it is important that you document all procedures either as a surgeon or as assistant. Simply observing a case or washing for a case does not ensure that you have learned. Therefore we have used different milestones/levels for helping you assess yourself, make an objective assessment about how much you have learned and what remains to be learned. We are sharing these with you to help you understand the levels of competencies you need to master as you move ahead with your training.",style: TextStyle(fontSize: 20,), textAlign: TextAlign.justify,),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            child: Center(child: Text("Operation/Procedure Record", style: TextStyle(fontSize: 18, color: Colors.amber, fontWeight: FontWeight.bold),)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 0.8, 0.0),
            child: Text("1. Date", style: TextStyle(fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
               
                Container(
                   padding: EdgeInsets.all(5.0),
                  child: IconButton(
                    onPressed: () => _selectDate(context),
                    color: Color.fromRGBO(146, 180, 237, 1),
                    icon: Icon(Icons.perm_contact_calendar),
                    iconSize: 30,

                  ),
                 ),
                 
                  Text("${selectedDate.toLocal()}".split(' ')[0]),
                
              ],
            ),
          ),
          ListTile(
            title: Text("Patient name/Age/CADs", style: TextStyle(fontSize: 20),),
          ),
          _buildTextField(),

          ListTile(
            title: Text("Diagnosis", style: TextStyle(fontSize: 20),),
          ),
          _buildTextDiagnosisField(),

          ListTile(
            title: Text("Procedure", style: TextStyle(fontSize: 20),),
          ),
          _buildTextProcedureField(),

          ListTile(
            title: Text("Level Achieved", style: TextStyle(fontSize: 20),),
          ),
          _buildTextField(),


          Column(
        
            children: [
              ButtonTheme(padding: const EdgeInsets.all(20),
                child: ButtonTheme(
                
                  child: RaisedButton(onPressed: () {

                    Navigator.pushNamed(context, '/rotation');
                  },
                    color: Color.fromRGBO(146, 180, 237, 1),
                    child:
                    Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
        
        ),
    )
      
    );
  }
}