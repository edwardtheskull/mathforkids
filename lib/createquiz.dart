import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:mathforkids/connect.dart';
import 'package:sqflite/sqflite.dart';



class createquizPageState extends StatefulWidget{
  @override
  createquizPage createState() => createquizPage();
}




class createquizPage extends State<createquizPageState>{
  bool test = false;
  String Dropdownquestionvalue = "Multiple choice";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(31, 69, 82, 1),
        appBar: AppBar(
          title: Text(
            "Create Quiz",
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
        body:  Scrollbar(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text("Name:",
                        style: TextStyle(fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Architect",
                        ),
                      ),
                      Expanded(child: TextField( style: TextStyle(color: Colors.white, fontFamily: 'Architect'), cursorColor: Colors.white,
                        decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                            labelText: 'Name', focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                        ),
                      ),),
                    ],
                  ),
                ),
                ),
                SwitchListTile(title: const Text('test'), value:test, onChanged: (bool value) { setState(() {
                  test = value;}); },),
                Expanded(child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () async{
                        showInformationDialog(context);
                      },
                      color: Colors.green,
                      child: Text("Add Question", style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,fontFamily: 'Architect',
                      ),),
                    ),
                  ),
                ),),
                Expanded(child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => new connectPageState()));
                      },
                      color: Colors.green,
                      child: Text("Create Quiz", style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,fontFamily: 'Architect',
                      ),),
                    ),
                  ),
                ),)
              ]),
        )
    );
  }

  showInformationDialog (BuildContext context) async {
    return showDialog(context: context,
        builder: (context){
          return AlertDialog(
            content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState){
            return Column(
                children: [
                  DropdownButton<String>(value: Dropdownquestionvalue, style: TextStyle(color: Colors.black), underline: Container(height:2, color: Colors.purple),
                    onChanged: (String newValue) {
                      setState(() {
                        Dropdownquestionvalue = newValue;
                      });
                    },
                    items: <String>['Multiple choice','Written answer','Pair options'].map<DropdownMenuItem<String>>((String value) { return DropdownMenuItem<String>(value: value, child: Text(value),);
                    }).toList(),),
                ]
            );}),
            actions: <Widget> [
              TextButton(
                child: Text ("Okay"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

}



