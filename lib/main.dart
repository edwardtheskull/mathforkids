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
          body:  Container(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, padding: const EdgeInsets.only(left:100),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [Row(children: [ButtonTheme(minWidth: MediaQuery.of(context).size.width/2.2, height: MediaQuery.of(context).size.height/8,
                child: RaisedButton(elevation: 2,
            onPressed: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new loginPageState()));
          },
                color: Colors.green[600],
                child: Text("Login", style: TextStyle(letterSpacing: 1,
                  fontSize: 25,
                  color: Colors.black,fontFamily: 'Crimson')),),
              )],
              ),
                Row(children: [Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ButtonTheme(minWidth: MediaQuery.of(context).size.width/2.2, height: MediaQuery.of(context).size.height/8,
                    child: RaisedButton(elevation: 3,
                      onPressed: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => new registerPageState()));
                      },
                      color: Colors.green[600],
                      child: Text("Register", style: TextStyle(letterSpacing: 1,
                          fontSize: 25,
                          color: Colors.black,fontFamily: 'Crimson')),),
                  ),
                )],
                ),
              ],
            )
          )
      ),
    );
  }
}


