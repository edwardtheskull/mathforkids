import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathforkids/studenthome.dart';
import 'package:mathforkids/studentresults.dart';
import 'package:mathforkids/teacherhome.dart';
import 'package:sqflite/sqflite.dart';


class learnQPageState extends StatefulWidget{
  @override
  LearnQPage createState() => LearnQPage();
}

class LearnQPage extends State<learnQPageState>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(31, 69, 82, 1),
          appBar: AppBar(
            title: Text(
              "Math for Kids",
              style: TextStyle(
                fontSize: 30,
                fontFamily: "Architect",
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle:true,
            backgroundColor: Colors.green[600],
          ),
          body:  Container(
            child: Column(
                children: [Row(children: [
                  Expanded(child: Text("Addition",
                    style: TextStyle(fontSize: 20, color: Colors.white,
                        fontWeight: FontWeight.bold, fontFamily: 'Architect'
                    ),
                  ),
                  ),
                ],
                ),
                  Row(
                    children: [ButtonTheme(minWidth: MediaQuery.of(context).size.width*0.955, height: MediaQuery.of(context).size.height/8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(elevation: 3,
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentPageState()));
                          },
                          color: Colors.transparent,
                          child: Text("Addition - Easy", style: TextStyle(letterSpacing: 1,
                            fontSize: 20,
                            color: Colors.white,fontFamily: 'Architect',)),),
                      ),
                    )],
                  ),
                  Row(
                    children: [ButtonTheme(minWidth: MediaQuery.of(context).size.width*0.955, height: MediaQuery.of(context).size.height/8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(elevation: 3,
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentPageState()));
                          },
                          color: Colors.transparent,
                          child: Text("Addition - Easy", style: TextStyle(letterSpacing: 1,
                            fontSize: 20,
                            color: Colors.white,fontFamily: 'Architect',)),),
                      ),
                    )],
                  ),
                  Row(
                    children: [ButtonTheme(minWidth: MediaQuery.of(context).size.width*0.955, height: MediaQuery.of(context).size.height/8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(elevation: 3,
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentPageState()));
                          },
                          color: Colors.transparent,
                          child: Text("Addition - Normal", style: TextStyle(letterSpacing: 1,
                            fontSize: 20,
                            color: Colors.white,fontFamily: 'Architect',)),),
                      ),
                    )],
                  ),
                  Row(
                    children: [ButtonTheme(minWidth: MediaQuery.of(context).size.width*0.955, height: MediaQuery.of(context).size.height/8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(elevation: 3,
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentPageState()));
                          },
                          color: Colors.transparent,
                          child: Text("Addition - Normal", style: TextStyle(letterSpacing: 1,
                            fontSize: 20,
                            color: Colors.white,fontFamily: 'Architect',)),),
                      ),
                    )],
                  ),
                  Row(
                    children: [ButtonTheme(minWidth: MediaQuery.of(context).size.width*0.955, height: MediaQuery.of(context).size.height/8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(elevation: 3,
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentPageState()));
                          },
                          color: Colors.transparent,
                          child: Text("Addition - Hard", style: TextStyle(letterSpacing: 1,
                            fontSize: 20,
                            color: Colors.white,fontFamily: 'Architect',)),),
                      ),
                    )],
                  ),

                ]),
          )
      ),
    );
  }
}




