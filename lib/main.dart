import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathforkids/register.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Home()
    },
  ));
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          title: Text(
            "Math for Kids",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          centerTitle:true,
          backgroundColor: Colors.green[600],
        ),
        body: Center(
          child: MyStatefulWidget(),
        )
    );
  }
}

class MyStatefulWidget extends StatefulWidget{
  MyStatefulWidget({Key key}) : super(key:key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>{
  TextEditingController textInput = new TextEditingController();
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget> [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children:[ Align(
            alignment: FractionalOffset.bottomCenter,
            child:RaisedButton(
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new ListPageState()));
              },
              color: Colors.red,
              child: Text("Register", style: TextStyle(
                fontSize: 25,
                color: Colors.black,fontFamily: 'Crimson',
              wordSpacing: 2),),
            ),
          ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children:[ Align(
            alignment: FractionalOffset.bottomCenter,
            child:RaisedButton(
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new ListPageState()));
              },
              color: Colors.red,
              child: Text("Login", style: TextStyle(
                fontSize: 25,
                color: Colors.black,fontFamily: 'Crimson',
              ),),
            ),
          ),
          ],
        ),
      ],
    );
  }
}

