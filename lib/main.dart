import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

class ListPageState extends StatefulWidget{
  @override
  ListPage createState() => ListPage();
}

String dropdownvalue = "Teacher";

class ListPage extends State<ListPageState>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text(
          "Register",
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
          children: [Expanded(child: Text("Name:",
          style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold
          ),
         ),
        ),
          Expanded(child: TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
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
          Expanded(child: Text("Confirm Password:",
            style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          ),
            Expanded(child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirm Password',
              ),
            ),),
          Expanded(child: Text("mail:",
            style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          ),
            Expanded(child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'mail',
              ),
            ),),
          Expanded(child: Text("Alias:",
            style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          ),
            Expanded(child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Alias',
              ),
            ),),
          Expanded(child: Text("Role:",
            style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          ),
          Expanded(child: DropdownButton<String>(value: dropdownvalue, style: TextStyle(color: Colors.indigo), underline: Container(height:2, color: Colors.purple),
            onChanged: (String newValue) {
              setState(() {
                dropdownvalue = newValue;
              });
            },
            items: <String>['Teacher', 'Student'].map<DropdownMenuItem<String>>((String value) { return DropdownMenuItem<String>(value: value, child: Text(value),);
    }).toList(),))]),
      ));
  }
}




