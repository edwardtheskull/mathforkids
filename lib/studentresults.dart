import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathforkids/connect.dart';
import 'package:mathforkids/login.dart';


class studentresultPageState extends StatefulWidget{
  @override
  studentresultPage createState() => studentresultPage();
}

class studentresultPage extends State<studentresultPageState>{
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
              children: [Expanded(child: Text("Previous Quizzes",
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              ),
              ]),
        )
    );
  }
}




