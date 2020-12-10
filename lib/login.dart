import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class loginPageState extends StatefulWidget{
  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<loginPageState>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          title: Text(
            "Login",
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
              children: [Expanded(child: Text("email/username:",
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              ),
                Expanded(child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email/username',
                  ),
                ),),
                Expanded(child: Text("Password:",
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                ),
                Expanded(child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),),

                Expanded(child: RaisedButton(
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new loginPageState()));
                  },
                  color: Colors.red,
                  child: Text("Next", style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,fontFamily: 'Crimson',
                  ),),
                ),)
              ]),
        )
    );
  }
}




