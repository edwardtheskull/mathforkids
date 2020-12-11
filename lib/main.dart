import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathforkids/login.dart';
import 'package:mathforkids/register.dart';
import 'package:mathforkids/register.dart';
import 'package:sqflite/sqflite.dart';

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
    return Container(
      decoration: BoxDecoration(
        image:DecorationImage(image: AssetImage('images/test.jpg'),
          fit: BoxFit.cover,),),
      child: Scaffold(
          backgroundColor: Colors.transparent,
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
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new loginPageState()));
                    },
                    color: Colors.red,
                    child: Text("Login", style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,fontFamily: 'Crimson',
                    ),),
                  ),),
                  Expanded(child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new registerPageState()));
                    },
                    color: Colors.red,
                    child: Text("Registration", style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,fontFamily: 'Crimson',
                    ),),
                  ),)
                ]),
          )
      ),
    );
  }
}


