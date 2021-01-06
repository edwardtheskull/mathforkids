import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mathforkids/main.dart';
import 'package:mathforkids/screens/Teacher/Temp.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/services/auth.dart';
import 'package:mathforkids/ChangeTheme.dart';
import 'package:mathforkids/Constants.dart';
import 'package:mathforkids/screens/Pupil/data.dart';
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
  Map<String, String> Results = new Map<String, String>();
  TextEditingController controller = new TextEditingController();
  List<bool> cardsValue = new List<bool>();
  List<String> Pair = new List<String>();
  List<String> Match = new List<String>();
  Map<String, String> MCA = new Map<String,String>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: setTheme.scaffoldBackgroundColor,
      appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back),
              iconSize: SizeConfig.SmallIconSize,
              onPressed: () async {
                if(activerole == 'Teacher')
                {
                  print("teach");
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new teacherPageState()));
                }
                else
                {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentPageState()));
                }
              }
          ),
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
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 6),
                  child: Text(GlobQL['info']['Name'], style: TextStyle(
                      fontSize: SizeConfig.HeaderTextFontSize,
                      fontFamily: "Architect", fontWeight: FontWeight.bold,
                      color: setTheme.accentColor),),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 6),
                  child: Text('${GlobQL['Q'+i.toString()]['Question']}' , style: TextStyle(
                      fontSize: SizeConfig.HeaderTextFontSize,
                      fontFamily: "Architect", fontWeight: FontWeight.bold,
                      color: setTheme.accentColor,),),
                ),
              ),
              Container(height: SizeConfig.XSHalfScreenSize,
                child: MyFunction(context),

              ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end,
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
                                cardsValue.clear();
                                cardsValue = [false];
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
                  )
            ],
          )),
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
      for(int j = 0; j<GlobQL['Q'+i.toString()].length - 2; j++){
        cardsValue.add(false);
      }
      for(int j = 0; j< GlobQL['Q'+i.toString()].length - 2; j++){
        MCA[GlobQL['Q'+i.toString()]['Alternative'+j.toString()]] = 'false';
      }

      return ListView.builder(itemCount: GlobQL['Q'+i.toString()].length - 2, itemBuilder: (context, index) {
        return Container(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: CustomQuestion(
                  text: '${questions[index].qst}',
                  nr : index+1,
                  isSelected: cardsValue[index+1],
                  onTap: () {
                    setState(() {
                     cardsValue[index+1] = !cardsValue[index+1];
                     MCA[GlobQL['Q'+i.toString()]['Alternative'+(index+1).toString()]] = cardsValue[index+1].toString();
                      Text("text1");
                    });
                  },
                ),
              ),
            );
      });
    }
    else{
      for(int j = 0; j<GlobQL['Q'+i.toString()].length - 2; j++){
        cardsValue[j] = false;
      }
      for(int j = 0; j<GlobQL['Q'+i.toString()].length - 2; j++){
        correct.add(false);
      }
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 3),),
              itemBuilder: (context, index) => Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right:20, top: 20, bottom: 20),
                  child: CustomPair(
                    text: which(index),
                    nr : index+1,
                    isSelected: cardsValue[index],
                    onTap: () {
                      if(correct[index] != true){
                        if(p1 != index && p == 1){
                          match1 = which(index);
                          correct[index] = FixPairs(pair1, match1, index + 1);
                          correct[p1] = true;
                          correct[index] = true;
                          p = 0;
                          p1 = 0;
                        }
                        else if(p == 0){
                          pair1 = which(index);
                          p1 = index;
                          p++;
                        }
                        setState(() {
                          cardsValue[index] = !cardsValue[index];
                          Text("text1");
                        });
                      }
                    },
                  ),
                ),
              ),
          itemCount: cardsValue.length,
          ),
        );
    }
  }

  String which(int index){
    if(index%2 == 0){
      return '${GlobQL['Q'+i.toString()]['Pair'+index.toString()]}';
    }
    else{
      return '${GlobQL['Q'+i.toString()]['Matches'+index.toString()]}';
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
        if(GlobQL['Q'+i.toString()]['Answer'] == controller.text){
          Results['Q'+i.toString()] = 'true';
          score++;
        }
        else{

        }
      }

      else if(GlobQL['Q'+i.toString()]['Type'] == 'Multiple choice'){
        for(int j = 1; j < GlobQL['Q'+i.toString()].length - 2; j++){
          if(GlobQL['Q'+i.toString()]['Alternative'+j.toString()] == MCA['Alternative'+j.toString()]){
            nr++;
          }
        }
        if(nr == GlobQL['Q'+i.toString()].length - 2){
          Results['Q'+i.toString()] = 'true';
          score++;
        }
        else{
          Results['Q'+i.toString()] = 'false';
        }
      }

      else{
        for(int j = 1; j < GlobQL['Q'+i.toString()].length - 2; j++){
          if(GlobQL['Q'+i.toString()]['Pair'+j.toString()] == Pair[j] && GlobQL['Q'+i.toString()]['Pair'+j.toString()] == Match[j]){
            nr++;
          }
        }
        if(GlobQL['Q'+i.toString()].length == nr){
          Results['Q'+i.toString()] = 'true';
          score++;
        }
        else{
          Results['Q'+i.toString()] = 'false';
        }
      }
  }

  confirmDialog (BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz result'),
          content: Text("You scored"),
          actions: <Widget>[
            Text("${score.toString()} '/' ${GlobQL.length - 1}"),
            FlatButton(
              child: Text("YES"),
              onPressed: () {
                if(activerole == 'Student'){

                }
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
                      fontSize: 13),
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
                          style: TextStyle(
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
                        fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }}
