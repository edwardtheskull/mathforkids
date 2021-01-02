import 'package:flutter/material.dart';
import 'package:mathforkids/main.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/services/auth.dart';
import 'package:mathforkids/ChangeTheme.dart';
import 'package:mathforkids/Constants.dart';
import 'package:mathforkids/screens/Pupil/data.dart';
import 'package:mathforkids/screens/Pupil/testInfo.dart';



class takeQuizPageState extends StatefulWidget{
  final int code;
  takeQuizPageState({Key key, @required this.code,}) : super(key: key);
  @override

  TakeQuizPage createState() => TakeQuizPage();
}

class TakeQuizPage extends State<takeQuizPageState>{
  final AuthService _auth = AuthService();
  String header = "Math for Kids";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: setTheme.scaffoldBackgroundColor,
      appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentPageState())),
          ),
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
                    child: Text(choice, style: TextStyle(color: setTheme.accentColor),),
                  );
                }).toList();
              },
            ),
          ]
      ),
      body: Center(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 6),
                  child: Text("Addition nr: 1", style: TextStyle(
                      fontSize: SizeConfig.HeaderTextFontSize,
                      decoration: TextDecoration.underline,
                      fontFamily: "Architect", fontWeight: FontWeight.bold,
                      color: Colors.white),),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 6),
                  child: Text(" 1 + 5 = ?" , style: TextStyle(
                      fontSize: SizeConfig.HeaderTextFontSize,
                      fontFamily: "Architect", fontWeight: FontWeight.bold,
                      color: Colors.white,),),
                ),
              ),
              Container(height: SizeConfig.screenHeight/2,
                child: MyFunction()

              ),

                  Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: RaisedButton(
                          onPressed: () {},
                          color: setTheme.buttonColor,
                          child: Text("Next", style: TextStyle(
                            fontSize: SizeConfig.TextFontSize,
                            color: setTheme.accentColor, fontFamily: 'Architect',
                          ),),
                        ),
                      ),
                    ],
                  )
            ],
          )),
    );
  }
}


class MyFunction extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    if (questions.length > 0) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(width: SizeConfig.screenWidth*0.66,
          child: TextFormField( style: TextStyle(color: setTheme.accentColor, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: setTheme.accentColor,
                decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor)),
                border: OutlineInputBorder(), labelStyle: TextStyle(color: setTheme.accentColor),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor))
            ),

          ),
        ),

      );
    }
    else if(questions.length <3){


    }
  }
}