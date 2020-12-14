import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';


class studentresultPageState extends StatefulWidget{
  @override
  studentresultPage createState() => studentresultPage();
}

class studentresultPage extends State<studentresultPageState>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(31, 69, 82, 1),
        appBar: AppBar(
          title: Text(
            "Math for Kids",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "Architect",
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle:true,
          backgroundColor: Colors.green[600],
        ),
        body:  Column(mainAxisAlignment: MainAxisAlignment.center,

            children:
            //row 1
            [Row(mainAxisAlignment: MainAxisAlignment.center, children: [ButtonTheme(minWidth: MediaQuery.of(context).size.width/1.8, height: MediaQuery.of(context).size.height/8,
              child: RaisedButton(elevation: 2,
                onPressed: (){
                  //Navigator.push(context, new MaterialPageRoute(builder: (context) => new connectPageState()));
                },
                color: Colors.green[600],
                child: Text("Most recent quiz", style: TextStyle(letterSpacing: 1,
                    fontSize: 25,
                    color: Colors.white,fontFamily: 'Architect')),),
            )],
            ),

              //Row 2
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ButtonTheme(minWidth: MediaQuery.of(context).size.width/1.8, height: MediaQuery.of(context).size.height/8,
                  child: RaisedButton(elevation: 3,
                    onPressed: (){
                      //Navigator.push(context, new MaterialPageRoute(builder: (context) => new createquizPageState()));
                    },
                    color: Colors.green[600],
                    child: Text("Previous quizzes", style: TextStyle(letterSpacing: 1,
                      fontSize: 25,
                      color: Colors.white,fontFamily: 'Architect',)),),
                ),
              )],
              ),
            ])
    );
  }
}
    /*return Scaffold(
        backgroundColor: Colors.green[50],
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
        body:  Center(
          child: Column( mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Text("Most recent quiz",
                      style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                    child: Text("Most recent quiz",
                      style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ]),
        )
    );*/





