import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathforkids/connect.dart';
import 'package:mathforkids/createquiz.dart';
import 'package:mathforkids/studentresults.dart';
import 'package:sqflite/sqflite.dart';

class teacherPageState extends StatefulWidget{
  @override
  teacherPage createState() => teacherPage();
}

class teacherPage extends State<teacherPageState>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body:  Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [Row(mainAxisAlignment: MainAxisAlignment.center, children: [ButtonTheme(minWidth: MediaQuery.of(context).size.width/1.8, height: MediaQuery.of(context).size.height/8,
              child: RaisedButton(elevation: 2,
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new connectPageState()));
                },
                color: Colors.green[600],
                child: Text("Test Quiz", style: TextStyle(letterSpacing: 1,
                    fontSize: 25,
                    color: Colors.white,fontFamily: 'Architect')),),
            )],
            ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ButtonTheme(minWidth: MediaQuery.of(context).size.width/1.8, height: MediaQuery.of(context).size.height/8,
                  child: RaisedButton(elevation: 3,
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new createquizPageState()));
                    },
                    color: Colors.green[600],
                    child: Text("Create Quiz", style: TextStyle(letterSpacing: 1,
                      fontSize: 25,
                      color: Colors.white,fontFamily: 'Architect',)),),
                ),
              )],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ButtonTheme(minWidth: MediaQuery.of(context).size.width/1.8, height: MediaQuery.of(context).size.height/8,
                  child: RaisedButton(elevation: 3,
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentresultPageState()));
                    },
                    color: Colors.green[600],
                    child: Text("Teacher Page", style: TextStyle(letterSpacing: 1,
                      fontSize: 25,
                      color: Colors.white,fontFamily: 'Architect',)),),
                ),
              )],
              ),
            ])
    );
  }
}




