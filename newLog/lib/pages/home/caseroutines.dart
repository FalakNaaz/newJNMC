import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';


class CaseRoutine extends StatefulWidget {
  @override
  _CaseRoutineState createState() => _CaseRoutineState();
}

class _CaseRoutineState extends State<CaseRoutine> {
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
   Widget _buildNameField(){
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: TextField(
        keyboardType: TextInputType.number,
         decoration: InputDecoration(
            labelText: 'Name',
            hintText: 'Perceptor Name',
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
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
         ),
       ),
     ); 
   }

   Widget _buildTextBoxField(){
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: TextField(
         maxLines: 10,
        keyboardType: TextInputType.text,
         decoration: InputDecoration(
            labelText: 'Info',
            hintText: 'Write....',
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
            child: Text('Rone',
            style: TextStyle(fontSize: 20),),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Show profile',
            onPressed: (){},
          ),
          
        ]
      ),
    body: 

    Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
            child: Center(child: Text("Learning Objectives and Learning Contract", style: TextStyle(fontSize: 18, color: Colors.amber, fontWeight: FontWeight.bold),)),
          ),
          Text("  1. Date of posting",style: TextStyle(fontSize: 20),),
          Row(
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
          ListTile(
            title: Text("2.Preceptor's Name", style: TextStyle(fontSize: 20),),
          ),
          _buildNameField(),
          ListTile(
            title: Text("Three things I want to learn during this rotation:", style: TextStyle(fontSize: 20),),
          ),
           _buildTextField(),
           _buildTextField(),
           _buildTextField(),
          ListTile(
            title: Text("My Strategy for accomplishing above goal?", style: TextStyle(fontSize: 20),),
          ),
          _buildTextBoxField(),
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