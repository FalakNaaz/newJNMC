import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';


class CaseReport extends StatefulWidget {
  @override
  _CaseReportState createState() => _CaseReportState();
}

class _CaseReportState extends State<CaseReport> {

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
            child: Center(child: Text("Case Report", style: TextStyle(fontSize: 18, color: Colors.amber, fontWeight: FontWeight.bold),)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Write a case report of an interestingcase you managed/helped during the current posting which maybe:",style: TextStyle(fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("1. A rare disease, uncommon problem.", style: TextStyle(fontSize: 18),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("2. A rare preentation of a common disearse.", style: TextStyle(fontSize: 18),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("3. A uncommon management off a commom problem.", style: TextStyle(fontSize: 18),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("4. An important clinical lesson.", style: TextStyle(fontSize: 18),),
          ),
          Row(
            children: <Widget>[
              Container(
               ),
              
            ],
          ),
          ListTile(
            title: Text("Case Reort", style: TextStyle(fontSize: 20),),
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