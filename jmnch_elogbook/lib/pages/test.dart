import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'baseApp.dart';
import 'login.dart';


class Test extends StatefulWidget  {

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
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
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('JNMCH eLogBook'),
        backgroundColor: Color.fromRGBO(273, 146, 158, 1),
        leading: IconButton(
          onPressed: () {Navigator.pushNamed(context, '/LoginAsResident');},
          icon: Icon(Icons.view_headline),
        ),

      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[

          Container(
            height: 538,
            child:DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar:AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Formative Assessment Tests'),
                  backgroundColor: Color.fromRGBO(273, 146, 158, 1),
                  bottom: TabBar(
                    tabs: [
                      Tab(text: 'Test 1'),
                      Tab(text: 'Test 2'),
                      Tab(text: 'Test 3'),
                      Tab(text: 'Test 4'),
                    ],
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                  ),
                ),
                body: TabBarView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Date of Test'),
                        Text('Result'),
                        Text('Self Assessment. How  did I perform?'),
                        Text('Reflections: Reasons for level of performance'),
                        Text('Future Goals'),
                    ]),
                    ListView(
                      children: [
                        Row(
                          //mainAxisSize: MainAxisSize.min,
                         // crossAxisAlignment: CrossAxisAlignment.baseline,
                         // textBaseline: TextBaseline.ideographic,
                          children: <Widget>[
                            //Text("${selectedDate.toLocal()}".split(' ')[0]),
                            //SizedBox(width: 20.0,),
                            Text('Date:      ', style: TextStyle(fontSize: 25),),
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
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.baseline,
                          //textBaseline: TextBaseline.ideographic,
                         // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('Result:     ', style: TextStyle(fontSize: 25),),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width: 150.0,
                              height:50,
                              margin: const EdgeInsets.only(right: 0, left: 0),
                              child:TextField(
                                onChanged: (value) {
                                  setState(() {
                                    text = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: 'Enter result',
                                  counterText: "",
                                  fillColor: Colors.white,
                                  border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                    borderSide: new BorderSide(
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            FlatButton(onPressed: () {
                              setState(() {
                                shouldDisplay = !shouldDisplay;
                              });
                            },// child: Text('Submit')
                               ),
                            shouldDisplay ? Text(text) : Spacer()
                          ],


                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('''Self Ass-\nessment: ''', style: TextStyle(fontSize: 25),),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width: 300.0,
                              //height:65,
                              margin: const EdgeInsets.only(right: 0, left: 0),
                              child:TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  labelText: '''Self Assessment: How did I\nperform? Grade yourself from good,\nsatisfactory, poor''',
                                  counterText: "",
                                  fillColor: Colors.white,
                                  border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                    borderSide: new BorderSide(
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],


                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('''Reflectio- \nns:''', style: TextStyle(fontSize: 25),),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width: 300.0,
                              //height:65,
                              margin: const EdgeInsets.only(right: 0, left: 0),
                              child:TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  labelText: '''Reflection: Reasons for level of\nperformance''',
                                  counterText: "",
                                  fillColor: Colors.white,
                                  border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                    borderSide: new BorderSide(
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],


                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('''Future G- \noals: ''', style: TextStyle(fontSize: 25),),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width: 300.0,
                              //height:65,
                              margin: const EdgeInsets.only(right: 0, left: 0),
                              child:TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  labelText: '''Future Goals''',
                                  counterText: "",
                                  fillColor: Colors.white,
                                  border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                    borderSide: new BorderSide(
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],


                        ),
                      ],
                    ),
                    Text(''),
                    Text(''),
                  ],
                ),
              ),
            ),

          ),
          Container(
            color:  Color.fromRGBO(273, 146, 158, 1),
            height: 65,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column( // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      IconButton(icon: new Icon(Icons.home), onPressed: (){}, color: Colors.white,iconSize: 33),
                      Text("Home",),
                    ],
                  ),
                  Column( // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      IconButton(icon: new Icon(Icons.verified_user), onPressed: (){}, color: Colors.white,iconSize: 33),
                      Text("Mission",),
                    ],
                  ),
                  Column( // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      IconButton(icon: new Icon(Icons.edit), onPressed: (){Navigator.pushNamed(context, '/thesis');}, color: Colors.white,iconSize: 33),
                      Text("Thesis",),
                    ],
                  ),
                  Column( // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      IconButton(
                          icon: new Icon(Icons.assignment),
                          onPressed: (){
                            Navigator.pushNamed(context, '/test');
                          },
                          color: Colors.white,iconSize: 33),
                      Text("Test",),
                    ],
                  ),

                  //IconButton(icon: new Icon(Icons.verified_user), onPressed: (){}, color: Colors.pink,iconSize: 45,),
                  //IconButton(icon: new Icon(Icons.edit), onPressed: (){}, color: Colors.pink,iconSize: 45,),
                  // IconButton(icon: new Icon(Icons.assignment), onPressed: (){}, color: Colors.pink,iconSize: 45,),
                ]),
          ),

        ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
