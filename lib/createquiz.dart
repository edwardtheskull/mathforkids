import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathforkids/connect.dart';
import 'package:mathforkids/login.dart';
import 'package:mathforkids/register.dart';
import 'package:mathforkids/main.dart';
import 'package:mathforkids/studentresults.dart';


class createquizPageState extends StatefulWidget{
  @override
  createquizPage createState() => createquizPage();
}

String dropdownvalue = "Multiplication";

class createquizPage extends State<createquizPageState>{
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
              children: [ Expanded(child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Choose Category',
                ),
              ),),
                Expanded(child: DropdownButton<String>(value: dropdownvalue, style: TextStyle(color: Colors.indigo), underline: Container(height:2, color: Colors.purple),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownvalue = newValue;
                    });
                  },
                  items: <String>['Multiplication', 'Division', 'Subtraction', 'Addition'].map<DropdownMenuItem<String>>((String value) { return DropdownMenuItem<String>(value: value, child: Text(value),);
                  }).toList(),)
                ),
                Expanded(child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number of Questions',
                  ),
                ),),
                Expanded(child: RaisedButton(
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new connectPageState()));
                  },
                  color: Colors.red,
                  child: Text("Next Page", style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,fontFamily: 'Crimson',
                  ),),
                ),)
              ]),
        )
    );
  }
}




