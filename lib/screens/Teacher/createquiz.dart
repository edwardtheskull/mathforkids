import 'dart:collection';
import 'package:mathforkids/screens/Teacher/createquestion.dart';
import 'package:mathforkids/utils/Imports.dart';

class createquizPageState extends StatefulWidget{
  @override
  createquizPage createState() => createquizPage();
}


class createquizPage extends State<createquizPageState>{
  bool test = false;
  static List<String> Written = [null];
  Map QA = new Map<String, String>();
  final formKey = GlobalKey<FormState>();
  String Dropdownquestionvalue = "Multiple choice";
  static List<String> multiplechoiceanswers = [null];
  String header = "Create Quiz";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: setTheme.scaffoldBackgroundColor,
        appBar: AppBar(
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
                      child: Text(choice),
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
                      TextField( style: TextStyle(color: setTheme.accentColor, fontFamily: 'Architect'), cursorColor: setTheme.accentColor,
                        decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor)),
                            border: OutlineInputBorder(), labelStyle: TextStyle(color: setTheme.accentColor),
                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor))
                        ),
                      ),
                      Row(
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
                              onPressed: () async{
                                  QA = await Navigator.push(context, MaterialPageRoute<HashMap<String, String>>(builder: (context) => createquestionPageState(Dropdownquestionvalue: Dropdownquestionvalue),));
                                setState(() {

                                });
                              },
                              color: setTheme.buttonColor,
                              child: Text("Add Question", style: TextStyle(
                                fontSize: SizeConfig.Createquestionbutton,
                                color: setTheme.accentColor, fontFamily: 'Architect',
                              ),),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                ),

                Expanded(child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                ),)
              ]),
        )
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
              Navigator.of(context).pop();
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


