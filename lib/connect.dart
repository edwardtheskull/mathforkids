import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathforkids/login.dart';
import 'package:mathforkids/register.dart';
import 'package:mathforkids/main.dart';
import 'package:sqflite/sqflite.dart';


class connectPageState extends StatefulWidget{
  @override
  ConnectPage createState() => ConnectPage();
}

class ConnectPage extends State<connectPageState>{
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
              children: [Expanded(child: Text("Enter code:",
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              ),
                Expanded(child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'code',
                  ),
                ),),
                Expanded(child: RaisedButton(
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new loginPageState()));
                  },
                  color: Colors.red,
                  child: Text("Connect", style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,fontFamily: 'Crimson',
                  ),),
                ),),
              ]),
        )
    );
  }
}




