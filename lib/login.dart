import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathforkids/studenthome.dart';
import 'package:mathforkids/studentresults.dart';
import 'package:mathforkids/teacherhome.dart';
import 'package:sqflite/sqflite.dart';


class loginPageState extends StatefulWidget{
  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<loginPageState>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(31, 69, 82, 1),
          appBar: AppBar(
            title: Text(
              "Login",
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
                    Expanded(child: Text("email/username:",
                      style: TextStyle(fontSize: 20, color: Colors.white,
                          fontWeight: FontWeight.bold, fontFamily: 'Architect'
                      ),
                    ),
                    ),
                  ],
                ),
                  Row(
                    children: [
                      Expanded(child: TextField(style: TextStyle(color: Colors.white, fontFamily: 'Architect'), cursorColor: Colors.white, obscureText: false,
                        decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                          labelText: 'email/username', focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                        ),
                      ),),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text("Password:",
                        style: TextStyle(fontSize: 20, color: Colors.white,
                            fontWeight: FontWeight.bold, fontFamily: 'Architect'
                        ),
                      ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: TextField(style: TextStyle(color: Colors.white, fontFamily: 'Architect'), cursorColor: Colors.white,
                        obscureText: true,
                        decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Password', focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                        ),
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: ButtonTheme(minWidth: MediaQuery.of(context).size.width/2.2, height: MediaQuery.of(context).size.height/8,
                          child: RaisedButton(elevation: 3,
                            onPressed: (){
                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new teacherPageState()));
                            },
                            color: Colors.green[600],
                            child: Text("Next", style: TextStyle(letterSpacing: 1,
                              fontSize: 25,
                              color: Colors.white,fontFamily: 'Architect',)),),
                        ),
                      )],
                      ),
                    ],
                  ),
                ]),
          )
      ),
    );
  }
}




