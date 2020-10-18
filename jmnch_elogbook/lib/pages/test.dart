import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'baseApp.dart';
import 'login.dart';


class Test extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
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
      body: SafeArea(
        child: Column(children: <Widget>[
          Container(
            color: Color.fromRGBO(273, 146, 158, 1),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(146, 180, 237, 1),
                    border: Border.all(
                      // color: Colors.red[500],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(
                  child: Text(
                    "Keep your Log Book with yourselves!",
                    //alignment:Alignment(10,20),
                    style: TextStyle(fontSize: 27, fontFamily: "DancingScript",),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 310,
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
                    Column(
                      children: <Widget>[
                        Text('Grading: Poor- E, Satisfactory- D, Average- C, Good- B, Very Good- A',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.red),),
                        Row(
                          children: <Widget>[
                            Text('Periodic Consultation with Mentor',
                              style: TextStyle(color: Colors.black, fontSize: 20,letterSpacing: 1),),
                            new DropdownButton<String>(
                              items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),

                          ],
                        ), Row(
                          children: <Widget>[
                            Text('Regular Collection of Data',
                              style: TextStyle(color: Colors.black, fontSize: 20,letterSpacing: 1),),
                            new DropdownButton<String>(
                              items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),

                          ],
                        ), Row(
                          children: <Widget>[
                            Text('Departmental Presentation',
                              style: TextStyle(color: Colors.black, fontSize: 20,letterSpacing: 1),),
                            new DropdownButton<String>(
                              items: <String>['A', 'B', 'C', 'D','E'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},
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
