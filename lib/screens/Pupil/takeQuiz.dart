import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mathforkids/main.dart';
import 'package:mathforkids/screens/Teacher/teacherquizzes.dart';
import 'package:mathforkids/screens/Teacher/Temp.dart';
import 'package:mathforkids/screens/services/database.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/services/auth.dart';
import 'package:mathforkids/utils/ChangeTheme.dart';
import 'package:mathforkids/utils/Constants.dart';
import 'package:mathforkids/screens/Pupil/testInfo.dart';
import 'package:mathforkids/screens/Teacher/Temp.dart';
import 'package:mathforkids/screens/services/loggedinuser.dart';

class takeQuizPageState extends StatefulWidget{
  @override
  TakeQuizPage createState() => TakeQuizPage();
}

class TakeQuizPage extends State<takeQuizPageState>{
  final AuthService _auth = AuthService();
  String header = "Math for Kids";
  int i = 1;
  int score = 0;
  int q = 0;
  Map<String, String> Results = new Map<String, String>();
  TextEditingController controller = new TextEditingController();
  List<bool> cardsValue = new List<bool>();
  List<String> Pair = new List<String>();
  List<String> Match = new List<String>();
  Map<String, String> MCA = new Map<String,String>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: onWillTakePop,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: setTheme.scaffoldBackgroundColor,
        appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back),
                iconSize: SizeConfig.SmallIconSize,
                onPressed: () {
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
                              if(activerole == 'Teacher')
                              {
                                Navigator.pushAndRemoveUntil(context,  new MaterialPageRoute(builder: (context) => new teacherPageState()), (route) => false);
                              }
                              else
                              {
                                Navigator.pushAndRemoveUntil(context,  new MaterialPageRoute(builder: (context) => new studentPageState()), (route) => false);
                              }
                            }, child: new Text('Yes')
                        )],
                    ),
                  ) ?? false;
                }),
            iconTheme: IconThemeData(color:setTheme.accentColor),
            backgroundColor: setTheme.primaryColor,
            title: Text(
              header,
              style: TextStyle(
                fontSize: SizeConfig.AppbarFontSize,
                fontFamily: "Architect",
                fontWeight: FontWeight.bold,
                color: setTheme.accentColor,
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
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                    child: Text(GlobQL['info']['Name'], style: TextStyle(
                        fontSize: SizeConfig.HeaderTextFontSize,
                        fontFamily: "Architect", fontWeight: FontWeight.bold,
                        color: setTheme.accentColor),),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                    child: Text('${GlobQL['Q'+i.toString()]['Question']}' , style: TextStyle(
                        fontSize: SizeConfig.HeaderTextFontSize,
                        fontFamily: "Architect", fontWeight: FontWeight.bold,
                        color: setTheme.accentColor,),),
                  ),
                ),
                Container(height: SizeConfig.XSHalfScreenSize,
                  child: MyFunction(context),

                ),
                    Container(height: SizeConfig.XSSH,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: RaisedButton(
                              onPressed: () {
                                if(i == GlobQL.length - 1){
                                    AddAnswers();
                                    confirmDialog(context);
                                }
                                else{
                                  setState(() {
                                    AddAnswers();
                                    i++;
                                    controller.clear();
                                    cardsValue.clear();
                                    cardsValue = new List<bool>();
                                    Pair.clear();
                                    Pair = new List<String>();
                                    Match.clear();
                                    Match = new List<String>();
                                    MCA.clear();
                                    MCA = new Map<String, String>();
                                    q = 0;
                                  });
                                }
                              },
                              color: setTheme.buttonColor,
                              child: Text("Next", style: TextStyle(
                                fontSize: SizeConfig.TextFontSize,
                                color: setTheme.accentColor, fontFamily: 'Architect',
                              ),),
                            ),
                          ),
                        ],
                      ),
                    )
              ],
            )),
      ),
    );
  }

  Widget MyFunction(BuildContext context){
    int p = 0;
    String pair1 = "";
    String match1 = "";
    int p1 = 0;
    List<bool> correct = new List<bool>();
    if (GlobQL['Q'+i.toString()]['Type'] == 'Written answer' ) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(width: SizeConfig.screenWidth*0.66,
          child: TextFormField(controller: controller, style: TextStyle(color: setTheme.accentColor, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: setTheme.accentColor,
            decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor)),
                border: OutlineInputBorder(), labelStyle: TextStyle(color: setTheme.accentColor),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor))
            ),

          ),
        ),

      );
    }
    else if(GlobQL['Q'+i.toString()]['Type'] == 'Multiple choice') {
      for(int j = 0; j<((GlobQL['Q'+i.toString()].length - 2)/2).toInt(); j++){
        cardsValue.add(false);
      }
      for(int j = 0; j< ((GlobQL['Q'+i.toString()].length - 2)/2).toInt(); j++){
        MCA[GlobQL['Q'+i.toString()]['Alternative'+j.toString()]] = 'false';
      }

      return ListView.builder(itemCount: ((GlobQL['Q'+i.toString()].length - 2)/2).toInt(), itemBuilder: (context, index) {
        return Container(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: CustomQuestion(
                  text: '${GlobQL['Q'+i.toString()]['Alternative'+index.toString()]}',
                  nr : index+1,
                  isSelected: cardsValue[index],
                  onTap: () {
                    setState(() {
                     cardsValue[index] = !cardsValue[index];
                      Text("text1");
                    });
                  },
                ),
              ),
            );
      });
    }
  }

  String which(int index){
    String r;
    if(index%2 == 0){
      r = GlobQL['Q'+i.toString()]['Pair'+q.toString()];
      return r;
    }
    else{
      r = GlobQL['Q'+i.toString()]['Matches'+(q).toString()];
      q++;
      return r;
    }
  }

  bool FixPairs(String p, String m, index){
        Pair[index] = p;
        Match[index] = m;
        return true;
  }

  void AddAnswers(){
    int nr = 0;
      if(GlobQL['Q'+i.toString()]['Type'] == 'Written answer'){
        if(GlobQL['Q'+i.toString()]['Answer'].toLowerCase() == controller.text.toLowerCase()){
          Results['Q'+i.toString()] = 'true';
          score++;
        }
      }

      else if(GlobQL['Q'+i.toString()]['Type'] == 'Multiple choice'){
        for(int j = 0; j < ((GlobQL['Q'+i.toString()].length - 2)/2).toInt(); j++){

          if(GlobQL['Q'+i.toString()]['Answer'+j.toString()] == cardsValue[j].toString()){
            nr++;
            print(GlobQL['Q'+i.toString()]['Answer'+j.toString()]);
          }
        }

        if(((GlobQL['Q'+i.toString()].length - 2)/2).toInt() == nr){
          Results['Q'+i.toString()] = 'true';
          score++;
        }
        else{
          Results['Q'+i.toString()] = 'false';
        }
      }
  }

  Future<bool> onWillTakePop() {
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
                if(activerole == 'Teacher')
                {
                  Navigator.pushAndRemoveUntil(context,  new MaterialPageRoute(builder: (context) => new teacherPageState()), (route) => false);
                }
                else
                {
                  Navigator.pushAndRemoveUntil(context,  new MaterialPageRoute(builder: (context) => new studentPageState()), (route) => false);
                }
              }, child: new Text('Yes')
          )],
      ),
    ) ?? false;
  }

  confirmDialog (BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz result'),
          content: Text("You scored"),
          actions: <Widget>[
            Text("${score.toString()} / ${GlobQL.length - 1}"),
            FlatButton(
              child: Text("Submit"),
              onPressed: () async{
                if(activerole == 'Student'){
                  await DatabaseService().saveResult(Results.length.toString(), score.toString(), GlobQL['info']['Code'], GlobQL['info']['Name'], Results);
                  await DatabaseService().getPrevResults();
                  Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => DispStudTestResState()), (route) => false);
                }
                else{
                  GlobQL.clear();
                  Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => teacherQuizzesPageState()), (route) => false);
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class CustomQuestion extends StatelessWidget{
  final bool isSelected;
  final String text;
  final VoidCallback onTap;
  final int nr;

  const CustomQuestion({
    this.isSelected,
    this.text,
    this.onTap,
    this.nr
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Card(
          color: isSelected ? setTheme.accentColor : Colors.red,
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: new EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[

                  Padding(
                    padding:
                    EdgeInsets.only(top: 0, right: 0, bottom: 20, left: 0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(
                        "Alternative ${nr}",
                        style: TextStyle(
                          fontSize: SizeConfig.TextFieldFontSize,
                            color: isSelected ? Colors.grey[800] : setTheme.accentColor),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  text,
                  style: TextStyle(
                      color: isSelected ? Colors.grey[800] : setTheme.accentColor,
                    fontSize: SizeConfig.TextFieldFontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }}


class CustomPair extends StatelessWidget{
  final bool isSelected;
  final String text;
  final VoidCallback onTap;
  final int nr;

  const CustomPair({
    this.isSelected,
    this.text,
    this.onTap,
    this.nr
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          child: Card(
            color: isSelected ? setTheme.accentColor : Colors.red,
            semanticContainer: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: new EdgeInsets.all(0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[

                    Padding(
                      padding:
                      EdgeInsets.only(top: 0, right: 0, bottom: 20, left: 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          "Alternative ${nr}",
                          style: TextStyle(fontSize: SizeConfig.TextFieldFontSize,
                              color: isSelected ? Colors.grey[800] : setTheme.accentColor),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: isSelected ? Colors.grey[800] : setTheme.accentColor,
                        fontSize: SizeConfig.TextFieldFontSize),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }}

