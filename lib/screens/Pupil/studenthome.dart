import 'package:flutter/material.dart';
import 'package:mathforkids/main.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/services/auth.dart';
import 'package:mathforkids/utils/ChangeTheme.dart';
import 'package:mathforkids/utils/Constants.dart';

class studentPageState extends StatefulWidget{
  @override
  StudentPage createState() => StudentPage();
}

class StudentPage extends State<studentPageState>{
  final AuthService _auth = AuthService();
  String header = "Math for Kids";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
    theme: setTheme,
    home: Scaffold(
        appBar: AppBar(
            toolbarHeight: SizeConfig.AppBarSize,
            iconTheme: IconThemeData(color:setTheme.accentColor),
            backgroundColor: setTheme.primaryColor,
          title: Text(
           header,
            style: TextStyle(
              fontSize: SizeConfig.AppbarFontSize,
              fontFamily: "Architect",
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle:true,
          actions: <Widget>[
        PopupMenuButton<String>(
          color: setTheme.primaryColor,
        onSelected: (choice){
          if(choice == Constants.Logout)
          {
            Navigator.pushAndRemoveUntil(context,  new MaterialPageRoute(builder: (context) => new MyStatefulWidget()), (route) => false);
          }
          else if(choice == Constants.ChangeTheme)
          {
            setState(() {
              switchTheme();
            });
           }
          },
      itemBuilder: (BuildContext context){
        return Constants.choices.map((choice){
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice, style: TextStyle(color: setTheme.accentColor)),
          );
        }).toList();
      },
    ),
          ]
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
            ])
    ));
  }
}



