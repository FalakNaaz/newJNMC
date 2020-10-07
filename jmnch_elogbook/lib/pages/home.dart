import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'baseApp.dart';
import 'login.dart';

class MyApp2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'JNMCH eLogBook'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(273, 146, 158, 1),
        leading: IconButton(
          onPressed: () {},
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
            color: Color.fromRGBO(146, 180, 237, 1),
            height: 50,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 110.0),
                child: Text("Rotations",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontFamily: 'JosefinSans', fontWeight: FontWeight.bold),
                ),
              ),

              IconButton(icon: new Icon(Icons.library_add), onPressed: (){}, color: Colors.white,iconSize: 35,),
            ]),

          ),
          Container(
            color: Colors.white,
            height: 260,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(icon: new Icon(Icons.looks_one), onPressed: (){}, color: Color.fromRGBO(146, 180, 237, 1),iconSize: 45,),
                  IconButton(icon: new Icon(Icons.looks_two), onPressed: (){},  color: Color.fromRGBO(146, 180, 237, 1),iconSize: 45,),
                  IconButton(icon: new Icon(Icons.looks_3), onPressed: (){}, color: Color.fromRGBO(146, 180, 237, 1),iconSize: 45,),
                  IconButton(icon: new Icon(Icons.looks_4), onPressed: (){}, color: Color.fromRGBO(146, 180, 237, 1),iconSize: 45,),
                  // IconButton(icon: new Icon(Icons.looks_5), onPressed: (){}, color: Colors.green,iconSize: 35,),
                  // IconButton(icon: new Icon(Icons.looks_6), onPressed: (){}, color: Colors.green,iconSize: 35,),
                ]),

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
                      IconButton(icon: new Icon(Icons.edit), onPressed: (){}, color: Colors.white,iconSize: 33),
                      Text("Thesis",),
                    ],
                  ),
                  Column( // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      IconButton(icon: new Icon(Icons.assignment), onPressed: (){}, color: Colors.white,iconSize: 33),
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
