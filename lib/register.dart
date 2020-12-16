import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathforkids/login.dart';
import 'package:sqflite/sqflite.dart';


class registerPageState extends StatefulWidget{
  @override
  RegisterPage createState() => RegisterPage();
}

class RegisterPage extends State<registerPageState>{
  String dropdownvalue = "Student";
  TextEditingController textname = new TextEditingController();
  TextEditingController textpassword = new TextEditingController();
  TextEditingController textconfirmpassword = new TextEditingController();
  TextEditingController textmail = new TextEditingController();
  TextEditingController textnick = new TextEditingController();
  TextEditingController textrole = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(31, 69, 82, 1),
        appBar: AppBar(
          title: Text(
            "Register",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: "Architect",
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle:true,
          backgroundColor: Colors.green[600],
        ),
        body: SingleChildScrollView(
          child: Container( height: MediaQuery.of(context).size.height*1.1, width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column( crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                      child: Text("Name:",
                        style: TextStyle(fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Architect",
                        ),
                      ),
                    ),
                    TextField(controller: textname, style: TextStyle(color: Colors.white, fontFamily: 'Architect'), cursorColor: Colors.white,
                      obscureText: false,
                      decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Name', focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                      child: Text("Password:",
                        style: TextStyle(fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Architect",
                        ),
                      ),
                    ),
                    TextField(controller: textpassword, style: TextStyle(color: Colors.white, fontFamily: 'Architect'), cursorColor: Colors.white,
                      obscureText: true,
                      decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Password', focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                      child: Text("Confirm Password:",
                        style: TextStyle(fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Architect",
                        ),
                      ),
                    ),
                    TextField(controller: textconfirmpassword, style: TextStyle(color: Colors.white, fontFamily: 'Architect'), cursorColor: Colors.white,
                      obscureText: true,
                      decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Confirm Password', focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                      child: Text("Mail:",
                        style: TextStyle(fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Architect",
                        ),
                      ),
                    ),
                    TextField(controller: textmail, style: TextStyle(color: Colors.white, fontFamily: 'Architect'), cursorColor: Colors.white,
                      obscureText: false,
                      decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Mail', focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                      child: Text("Nickname:",
                        style: TextStyle(fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Architect",
                        ),
                      ),
                    ),
                    TextField(controller: textnick, style: TextStyle(color: Colors.white, fontFamily: 'Architect'), cursorColor: Colors.white,
                      obscureText: false,
                      decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Nickname', focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                      ),
                    ),
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Role:",
                          style: TextStyle(fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Architect",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(value: dropdownvalue, style: TextStyle(color: Colors.green), underline: Container(height:2, color: Colors.purple),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownvalue = newValue;
                              });
                            },
                            items: <String>['Teacher','Student'].map<DropdownMenuItem<String>>((String value) { return DropdownMenuItem<String>(value: value, child: Text(value),);
                            }).toList(),),
                        )
                      ],
                    ),

                    Center(
                      child: RaisedButton(
                        onPressed: (){
                          Navigator.push(context, new MaterialPageRoute(builder: (context) => new loginPageState()));
                        },
                        color: Colors.green,
                        child: Text("Next", style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,fontFamily: 'Architect',
                        ),),
                      ),
                    )
                  ]),
            ),
          ),
        )
    );
  }
}




