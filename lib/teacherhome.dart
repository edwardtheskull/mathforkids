import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathforkids/connect.dart';
import 'package:mathforkids/createquiz.dart';
import 'package:mathforkids/login.dart';
import 'package:mathforkids/register.dart';
import 'package:mathforkids/main.dart';
import 'package:mathforkids/studentresults.dart';


class teacherPageState extends StatefulWidget{
  @override
  teacherPage createState() => teacherPage();
}

class teacherPage extends State<teacherPageState>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          title: Text(
            "Math for Kids",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "Crimson",
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle:true,
          backgroundColor: Colors.green[600],
        ),
        body:  Center(
          child: Column( mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start,
              children: [Expanded(child: RaisedButton(
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new connectPageState()));
                  },
                  color: Colors.red,
                  child: Text("Join Quiz", style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,fontFamily: 'Crimson',
                  ),),
                ),),
                Expanded(child: RaisedButton(
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new createquizPageState()));
                  },
                  color: Colors.red,
                  child: Text("Create Quiz", style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,fontFamily: 'Crimson',
                  ),),
                ),),
                Expanded(child: RaisedButton(
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentresultPageState()));
                  },
                  color: Colors.red,
                  child: Text("Student results from Quiz", style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,fontFamily: 'Crimson',
                  ),),
                ),)
              ]),
        )
    );
  }
}




