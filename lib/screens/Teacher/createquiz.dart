import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:mathforkids/screens/Teacher/createquestion.dart';
import 'package:mathforkids/screens/services/database.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/Teacher/Temp.dart';

class createquizPageState extends StatefulWidget{
  @override
  createquizPage createState() => createquizPage();
}

class createquizPage extends State<createquizPageState>{
  final formKey = GlobalKey<FormState>();
  String Dropdownquestionvalue = "Multiple choice";
  TextEditingController _controller;
  String header = "Create Quiz";

  @override
  Widget build(BuildContext context) {
    _controller = TXC;
    return WillPopScope(
      onWillPop: onWillCreatePop,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
          backgroundColor: setTheme.scaffoldBackgroundColor,
          appBar: AppBar(
              toolbarHeight: SizeConfig.AppBarSize,
              leading: IconButton(icon: Icon(Icons.arrow_back),
                iconSize: SizeConfig.SmallIconSize,
                onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new teacherPageState())),
              ),
              iconTheme: IconThemeData(color:setTheme.accentColor),
              backgroundColor: setTheme.primaryColor,
              title: Text(
                header,
                style: TextStyle(
                  fontSize: SizeConfig.AppbarFontSize,
                  fontFamily: "Architect",
                  fontWeight: FontWeight.bold,
                  color: setTheme.accentColor
                ),
              ),
              centerTitle:true,
              actions: <Widget>[
                PopupMenuButton<String>(
                  color: setTheme.primaryColor,
                  onSelected: (choice){
                    if(choice == Constants.Logout)
                    {
                      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new MyStatefulWidget()));
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
                        child: Text(choice,style: TextStyle(color: setTheme.accentColor),),
                      );
                    }).toList();
                  },
                ),
              ]
          ),
          body:  Scrollbar(
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [Text("Name:",
                        style: TextStyle(fontSize: SizeConfig.TextFontSize,
                          color: setTheme.accentColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Architect",
                        ),
                      ),
                        TextFormField(controller: _controller, style: TextStyle(color: setTheme.accentColor, fontFamily: 'Architect'), cursorColor: setTheme.accentColor,
                          decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor)),
                              border: OutlineInputBorder(), labelStyle: TextStyle(color: setTheme.accentColor),
                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor))
                          ),
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton<String>(value: Dropdownquestionvalue, dropdownColor: setTheme.scaffoldBackgroundColor, style: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.TextFieldFontSize, fontFamily:"Architect" ), underline: Container(height:2, color: setTheme.accentColor),
                                onChanged: (String newValue) {
                                  setState(() {
                                    Dropdownquestionvalue = newValue;
                                  });
                                },
                                items: <String>['Multiple choice','Written answer','Pair options'].map<DropdownMenuItem<String>>((String value) { return DropdownMenuItem<String>(value: value, child: Text(value),);
                                }).toList(),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                onPressed: () {
                                  QuizName = _controller.text;
                                  Navigator.pushAndRemoveUntil(context,  new MaterialPageRoute(builder: (context) => new createquestionPageState(Dropdownquestionvalue: Dropdownquestionvalue)), (route) => false);
                                },
                                color: setTheme.buttonColor,
                                child: Text("Add Question", style: TextStyle(
                                  fontSize: SizeConfig.Createquestionbutton,
                                  color: setTheme.accentColor, fontFamily: 'Architect',
                                ),),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: SizeConfig.SmallWindowHeight,
                          child: _questionList(context),)
                        ,
                      ],
                    ),
                  ),
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: RaisedButton(
                          onPressed: () async{
                            confirmDialog(context);
                          },
                          color: setTheme.buttonColor,
                          child: Text("Create Quiz", style: TextStyle(
                            fontSize: SizeConfig.TextFontSize,
                            color: setTheme.accentColor, fontFamily: 'Architect',
                          ),),
                        ),
                      ),
                    ],
                  )
                ]),
          )
      ),
    );
  }

  confirmDialog (BuildContext context) async {
   return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Quiz'),
          content: Text("Are You Sure Want To Proceed?"),
          actions: <Widget>[
          FlatButton(
            child: Text("YES"),
              onPressed: () {
              //Put your code here which you want to execute on Yes button click.
              DatabaseService().createQuiz(_controller.text, GlobQL);
              iterator = 0;
              QuizName = '';
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentresultPageState()));
            },
          ),

          FlatButton(
            child: Text("NO"),
              onPressed: () {
              Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> onWillCreatePop() {
    return showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text('Are you sure you want to quit?'),
        content: new Text('Unsaved data will be lost.'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
            ),
            new FlatButton(
            onPressed: () {
                dispose();
                Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new teacherPageState()));
            }, child: new Text('Yes')
      )],
      ),
    ) ?? false;
  }

Widget _questionList(BuildContext context){
    if(GlobQL.keys.isEmpty){
      return Text('No Questions added', style: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.TextFieldFontSize),);
    }
    else{
      return ListView.builder(
        itemCount: GlobQL.keys.toList().length,
        itemBuilder: (context, index) {
          return Card(
              color: setTheme.scaffoldBackgroundColor,

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListTile(
                    hoverColor: Colors.blue,
                    title: Text(GlobQL.values.elementAt(index)["Question"], style: TextStyle(
                        color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize)),
                   trailing: InkWell(onTap: (){
                     setState(() {
                       GlobQL.remove(GlobQL.keys.elementAt(index));
                     });
                   },
                     child: Container(
                       width: SizeConfig.SmallIconSize,
                       height: SizeConfig.SmallIconSize,
                       decoration: BoxDecoration(
                         color:  Colors.red,
                         borderRadius: BorderRadius.circular(SizeConfig.SmallIconSize),
                       ),
                       child: Icon(
                       Icons.remove, color: setTheme.accentColor,
                       ),
                     ),
                   ),

                   /* trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                            child: Text(
                              "${tests[index].studP}/${tests[index].maxP}",
                              style: TextStyle(
                                  color: Colors.green, fontSize: SizeConfig.MiniTextFontSize),
                            ),
                            onTap: () {Navigator.push(context, new MaterialPageRoute(builder: (context) => new specTestResultState(tests: tests[index])));}),
                      ],
                    )*/
                ),
              ),
          );
        },
      );
    }
}

}


