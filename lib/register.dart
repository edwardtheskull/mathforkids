import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathforkids/login.dart';
import 'package:sqflite/sqflite.dart';


class registerPageState extends StatefulWidget{
  @override
  RegisterPage createState() => RegisterPage();
}

String dropdownvalue = "Teacher";

class RegisterPage extends State<registerPageState>{
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
                  }).toList(),)
                ),
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




