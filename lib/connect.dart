import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathforkids/login.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mathforkids/SizeConfig.dart';


class connectPageState extends StatefulWidget{
  @override
  ConnectPage createState() => ConnectPage();
}

class ConnectPage extends State<connectPageState>{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(31, 69, 82, 1),
        appBar: AppBar(
          title: Text(
            "Math for Kids",
            style: TextStyle(
              fontSize: SizeConfig.AppbarFontSize,
              fontFamily: "Architect",
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle:true,
          backgroundColor: Colors.green[600],
        ),
        body:  Center(
          child: Container(width: MediaQuery.of(context).size.width*0.8,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [Row(children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Code:",
                    style: TextStyle(fontSize: SizeConfig.TextFontSize, color: Colors.white,
                        fontWeight: FontWeight.bold, fontFamily: 'Architect'
                    ),
                  ),
                ),
                ),
              ],
              ),
                Row(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(style: TextStyle(color: Colors.white, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: Colors.white, obscureText: false,
                        decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                        ),
                      ),
                    ),),
                  ],
                ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonTheme(minWidth: SizeConfig.SmallButtonWidth, height: SizeConfig.ButtonHeight,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: RaisedButton(elevation: 3,
                            onPressed: (){
                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new loginPageState()));
                            },
                            color: Colors.green[600],
                            child: Text("Connect", style: TextStyle(letterSpacing: 1,
                              fontSize: SizeConfig.ButtonTextSize,
                              color: Colors.white,fontFamily: 'Architect',)),),
                        ),
                      ),
                    ],
                  )],),
          ),
        )
    );
  }
}




