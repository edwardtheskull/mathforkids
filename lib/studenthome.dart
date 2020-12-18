import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathforkids/DispStudTestRes.dart';
import 'package:mathforkids/connect.dart';
import 'package:mathforkids/learn.dart';
import 'package:mathforkids/login.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mathforkids/SizeConfig.dart';


class studentPageState extends StatefulWidget{
  @override
  StudentPage createState() => StudentPage();
}

class StudentPage extends State<studentPageState>{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(31, 69, 82, 1),
        appBar: AppBar(
          title: Text(
            "Math for Kids",
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 3.5,
              fontFamily: "Architect",
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle:true,
          backgroundColor: Colors.green[600],
        ),
        body:  Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [Row(mainAxisAlignment: MainAxisAlignment.center, children: [ButtonTheme(minWidth: MediaQuery.of(context).size.width/1.6, height: MediaQuery.of(context).size.height/8,
              child: RaisedButton(elevation: 2,
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new connectPageState()));
                },
                color: Colors.green[600],
                child: Text("Join quiz", style: TextStyle(letterSpacing: 1,
                    fontSize: SizeConfig.safeBlockHorizontal * 7,
                    color: Colors.white,fontFamily: 'Architect')),),
            )],
            ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ButtonTheme(minWidth: MediaQuery.of(context).size.width/1.6, height: MediaQuery.of(context).size.height/8,
                  child: RaisedButton(elevation: 3,
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new connectPageState()));
                    },
                    color: Colors.green[600],
                    child: Text("Class", style: TextStyle(letterSpacing: 1,
                      fontSize: SizeConfig.safeBlockHorizontal * 7,
                      color: Colors.white,fontFamily: 'Architect',)),),
                ),
              )],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ButtonTheme(minWidth: MediaQuery.of(context).size.width/1.6, height: MediaQuery.of(context).size.height/8,
                  child: RaisedButton(elevation: 3,
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new DispStudTestResState()));
                    },
                    color: Colors.green[600],
                    child: Text("Previous quizzes", style: TextStyle(letterSpacing: 1,
                      fontSize: SizeConfig.safeBlockHorizontal * 7,
                      color: Colors.white,fontFamily: 'Architect',)),),
                ),
              )],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ButtonTheme(minWidth: MediaQuery.of(context).size.width/1.6, height: MediaQuery.of(context).size.height/8,
                  child: RaisedButton(elevation: 3,
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnPageState()));
                    },
                    color: Colors.green[600],
                    child: Text("Learn", style: TextStyle(letterSpacing: 1,
                      fontSize: SizeConfig.safeBlockHorizontal * 7,
                      color: Colors.white,fontFamily: 'Architect',)),),
                ),
              )],
              ),
            ])
    );
  }
}


