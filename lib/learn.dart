import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathforkids/learnQuestions.dart';
import 'package:mathforkids/studenthome.dart';
import 'package:mathforkids/studentresults.dart';
import 'package:mathforkids/teacherhome.dart';
import 'package:sqflite/sqflite.dart';


class learnPageState extends StatefulWidget{
  @override
  LearnPage createState() => LearnPage();
}

class LearnPage extends State<learnPageState>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(31, 69, 82, 1),
        appBar: AppBar(
          title: Text(
            "Learn",
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
            children: [Row(mainAxisAlignment: MainAxisAlignment.center, children: [ButtonTheme(minWidth: MediaQuery.of(context).size.width/4.0, height: MediaQuery.of(context).size.width/4.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(elevation: 2,
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnQPageState()));
                  },
                  color: Colors.green[600],
                  child: Text("+", style: TextStyle(letterSpacing: 1,
                      fontSize: 50,
                      color: Colors.white,fontFamily: 'Architect')),),
              ),
            ),
              ButtonTheme(minWidth: MediaQuery.of(context).size.width/4.0, height: MediaQuery.of(context).size.width/4.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RaisedButton(elevation: 3,
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnQPageState()));
                    },
                    color: Colors.green[600],
                    child: Text("-", style: TextStyle(letterSpacing: 1,
                      fontSize: 50,
                      color: Colors.white,fontFamily: 'Architect',)),),
                ),
              ),
            ],
            ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [ButtonTheme(minWidth: MediaQuery.of(context).size.width/4.0, height: MediaQuery.of(context).size.width/4.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RaisedButton(elevation: 2,
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnQPageState()));
                    },
                    color: Colors.green[600],
                    child: Text("x", style: TextStyle(letterSpacing: 1,
                        fontSize: 50,
                        color: Colors.white,fontFamily: 'Architect')),),
                ),
              ),
                ButtonTheme(minWidth: MediaQuery.of(context).size.width/4.0, height: MediaQuery.of(context).size.width/4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(elevation: 3,
                      onPressed: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnQPageState()));
                      },
                      color: Colors.green[600],
                      child: Text("/", style: TextStyle(letterSpacing: 1,
                        fontSize: 50,
                        color: Colors.white,fontFamily: 'Architect',)),),
                  ),
                ),
              ],
              ),
            ])
    );
  }
}
