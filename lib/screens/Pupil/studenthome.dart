import 'package:flutter/material.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/services/auth.dart';
import 'package:mathforkids/ChangeTheme.dart';

class studentPageState extends StatefulWidget{
  @override
  StudentPage createState() => StudentPage();
}

class StudentPage extends State<studentPageState>{
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
    theme: setTheme,
    home: Scaffold(
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
            actions: <Widget>[
              FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async{
                await _auth.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginPageState()));
                },
              )
            ],

        ),
        body:  Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [Row(mainAxisAlignment: MainAxisAlignment.center, children: [ButtonTheme(minWidth: SizeConfig.ButtonWidth, height: SizeConfig.ButtonHeight,
              child: RaisedButton(elevation: 2,
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new connectPageState()));
                },
                color: setTheme.buttonColor,
                child: Text("Join quiz", style: TextStyle(letterSpacing: 1,
                    fontSize: SizeConfig.ButtonTextSize,
                   fontFamily: 'Architect')),),
            )],
            ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ButtonTheme(minWidth: SizeConfig.ButtonWidth, height: SizeConfig.ButtonHeight,
                  child: RaisedButton(elevation: 3,
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new Class()));
                    },
                    color: setTheme.buttonColor,
                    child: Text("Class", style: TextStyle(letterSpacing: 1,
                      fontSize: SizeConfig.ButtonTextSize,
                      fontFamily: 'Architect',)),),
                ),
              )],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ButtonTheme(minWidth: SizeConfig.ButtonWidth, height: SizeConfig.ButtonHeight,
                  child: RaisedButton(elevation: 3,
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new DispStudTestResState()));
                    },
                    color: setTheme.buttonColor,
                    child: Text("Previous quizzes", style: TextStyle(letterSpacing: 1,
                      fontSize: SizeConfig.ButtonTextSize,
                     fontFamily: 'Architect',)),),
                ),
              )],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ButtonTheme(minWidth: SizeConfig.ButtonWidth, height: SizeConfig.ButtonHeight,
                  child: RaisedButton(elevation: 3,
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnPageState()));
                    },
                    color: setTheme.buttonColor,
                    child: Text("Learn", style: TextStyle(letterSpacing: 1,
                      fontSize: SizeConfig.ButtonTextSize,
                     fontFamily: 'Architect',)),),
                ),
              )],
              ),
              Switch(
                value: dark,
                onChanged: (state){
                  setState(() {
                    dark = state;
                    switchTheme();
                  });
                }),
            ])
    ));
  }
}


