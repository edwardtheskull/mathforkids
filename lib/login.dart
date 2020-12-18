import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathforkids/studenthome.dart';
import 'package:mathforkids/studentresults.dart';
import 'package:mathforkids/teacherhome.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'register.dart';
import 'package:mathforkids/SizeConfig.dart';


class loginPageState extends StatefulWidget{
  @override
  LoginPage createState() => LoginPage();
}


class LoginPage extends State<loginPageState>{
  TextEditingController textname = new TextEditingController();
  TextEditingController textpassword = new TextEditingController();
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    //double ratio = SizeConfig().init(context);
   // print(ratio);
    queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;
    return Scaffold(
        backgroundColor: Color.fromRGBO(31, 69, 82, 1),
        appBar: AppBar(
          title: Text(
            "Login",
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 3.5,
              fontFamily: "Architect",
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle:true,
          backgroundColor: Colors.green[600],
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                  child: Container(width: MediaQuery.of(context).size.width*0.8,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [Row(children: [
                          Expanded(child: Text("email/username:",
                            style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 6, color: Colors.white,
                                fontWeight: FontWeight.bold, fontFamily: 'Architect'
                            ),
                          ),
                          ),
                        ],
                      ),
                        Row(
                          children: [
                            Expanded(child: TextField(controller: textname, style: TextStyle(color: Colors.white, fontFamily: 'Architect', fontSize: SizeConfig.safeBlockHorizontal * 5), cursorColor: Colors.white, obscureText: false,
                              decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                              ),
                            ),),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("Password:",
                              style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 6, color: Colors.white,
                                  fontWeight: FontWeight.bold, fontFamily: 'Architect'
                              ),
                            ),

                          ),
                        ],
                      ),
                        Row(
                          children: [
                            Expanded(child: TextField(controller: textpassword, style: TextStyle(color: Colors.white, fontFamily: 'Architect', fontSize: SizeConfig.safeBlockHorizontal * 5), cursorColor: Colors.white,
                              obscureText: true,
                              decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                              ),
                            ),),
                          ],
                        ),
                        Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [Padding(
                              padding: const EdgeInsets.only(top: 35),
                              child: ButtonTheme(minWidth: queryData.size.width/devicePixelRatio, height: (MediaQuery.of(context).size.height/devicePixelRatio/4),
                                child: RaisedButton(elevation: 3,
                                  onPressed: (){
                                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new teacherPageState()));
                                  },
                                  color: Colors.green[600],
                                  child: Text("Next", style: TextStyle(letterSpacing: 1,
                                    fontSize: SizeConfig.safeBlockHorizontal * 7,
                                    color: Colors.white,fontFamily: 'Architect',)),),
                              ),
                            )],
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          ],
        )
    );
  }
}




