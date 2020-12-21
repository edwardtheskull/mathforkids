import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'file:///C:/Users/sleve/Documents/GitHub/mathforkids/lib/screens/Pupil/studenthome.dart';
import 'package:sqflite/sqflite.dart';
import 'file:///C:/Users/sleve/Documents/GitHub/mathforkids/lib/utils/SizeConfig.dart';

class learnQPageState extends StatefulWidget {
  @override
  LearnQPage createState() => LearnQPage();
}

class LearnQPage extends State<learnQPageState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
            centerTitle: true,
            backgroundColor: Colors.green[600],
          ),
          body: Container(
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Addition",
                      style: TextStyle(
                          fontSize: SizeConfig.MiniTextFontSize,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Architect'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Color.fromRGBO(31, 69, 82, 1),
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        ListTile(
                            leading: Icon(
                              Icons.add_circle,
                              color: Colors.green,
                              size: SizeConfig.SmallIconSize,
                            ),
                            title: Text('Addition',
                                style: TextStyle(color: Colors.white, fontSize: SizeConfig.MiniTextFontSize)),
                            subtitle: Text('Easy',
                                style: TextStyle(color: Colors.white, fontSize: SizeConfig.XSMiniTextFontSize)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                    child: Text(
                                      "Take quiz",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: SizeConfig.MiniTextFontSize),
                                    ),
                                    onTap: () {}),
                              ],
                            )),
                      ])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Color.fromRGBO(31, 69, 82, 1),
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        ListTile(
                          leading: Icon(
                            Icons.add_circle,
                            color: Colors.green,
                            size: 40,
                          ),
                          title: Text('Addition',
                              style: TextStyle(color: Colors.white)),
                          subtitle: Text('Intermidiate',
                              style: TextStyle(color: Colors.white)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                  child: Text(
                                    "Take quiz",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: SizeConfig.MiniTextFontSize),
                                  ),
                                  onTap: () {}),
                            ],
                          ),
                        ),
                      ])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Color.fromRGBO(31, 69, 82, 1),
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        ListTile(
                            leading: Icon(
                              Icons.add_circle,
                              color: Colors.green,
                              size: 40,
                            ),
                            title: Text('Addition',
                                style: TextStyle(color: Colors.white)),
                            subtitle: Text('Hard',
                                style: TextStyle(color: Colors.white)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                    child: Text(
                                      "Take quiz",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: SizeConfig.MiniTextFontSize),
                                    ),
                                    onTap: () {}),
                              ],
                            )),
                      ])),
                ),
              ),
              /*Row(
                    children: [ButtonTheme(minWidth: MediaQuery.of(context).size.width*0.955, height: MediaQuery.of(context).size.height/8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(elevation: 3,
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentPageState()));
                          },
                          color: Colors.transparent,
                          child: Text("Addition - Easy", style: TextStyle(letterSpacing: 1,
                            fontSize: 20,
                            color: Colors.white,fontFamily: 'Architect',)),),
                      ),
                    )],
                  ),
                  Row(
                    children: [ButtonTheme(minWidth: MediaQuery.of(context).size.width*0.955, height: MediaQuery.of(context).size.height/8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(elevation: 3,
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentPageState()));
                          },
                          color: Colors.transparent,
                          child: Text("Addition - Easy", style: TextStyle(letterSpacing: 1,
                            fontSize: 20,
                            color: Colors.white,fontFamily: 'Architect',)),),
                      ),
                    )],
                  ),
                  Row(
                    children: [ButtonTheme(minWidth: MediaQuery.of(context).size.width*0.955, height: MediaQuery.of(context).size.height/8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(elevation: 3,
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentPageState()));
                          },
                          color: Colors.transparent,
                          child: Text("Addition - Normal", style: TextStyle(letterSpacing: 1,
                            fontSize: 20,
                            color: Colors.white,fontFamily: 'Architect',)),),
                      ),
                    )],
                  ),
                  Row(
                    children: [ButtonTheme(minWidth: MediaQuery.of(context).size.width*0.955, height: MediaQuery.of(context).size.height/8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(elevation: 3,
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentPageState()));
                          },
                          color: Colors.transparent,
                          child: Text("Addition - Normal", style: TextStyle(letterSpacing: 1,
                            fontSize: 20,
                            color: Colors.white,fontFamily: 'Architect',)),),
                      ),
                    )],
                  ),
                  Row(
                    children: [ButtonTheme(minWidth: MediaQuery.of(context).size.width*0.955, height: MediaQuery.of(context).size.height/8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(elevation: 3,
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentPageState()));
                          },
                          color: Colors.transparent,
                          child: Text("Addition - Hard", style: TextStyle(letterSpacing: 1,
                            fontSize: 20,
                            color: Colors.white,fontFamily: 'Architect',)),),
                      ),
                    )],
                  ),
                    */
            ]),
          )),
    );
  }
}
