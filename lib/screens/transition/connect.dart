import 'package:mathforkids/screens/Pupil/takeQuiz.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/services/database.dart';
import 'package:mathforkids/utils/Temp.dart';

class connectPageState extends StatefulWidget{
  @override
  ConnectPage createState() => ConnectPage();
}

class ConnectPage extends State<connectPageState>{
  @override
  String header = "Math for Kids";
  int x = 2;
  TextEditingController inputfield = new TextEditingController();
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: setTheme.scaffoldBackgroundColor,
        appBar: AppBar(
          toolbarHeight: SizeConfig.AppBarSize,
            leading: IconButton(icon: Icon(Icons.arrow_back),
              iconSize: SizeConfig.SmallIconSize,
              onPressed: () async {
                if(activerole == 'Teacher')
                  {
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
                      child: Text(choice, style: TextStyle(color: setTheme.accentColor)),
                    );
                  }).toList();
                },
              ),
            ]
        ),
        body:  SingleChildScrollView(
          child: Center(
            child: Container(width: MediaQuery.of(context).size.width*0.8, height: SizeConfig.SmallScreenHeight,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [Row(children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Code:",
                      style: TextStyle(fontSize: SizeConfig.TextFontSize, color: setTheme.accentColor,
                          fontWeight: FontWeight.bold, fontFamily: 'Architect'
                      ),
                    ),
                  ),
                  ),
                ],
                ),
                  Row(
                    children: [
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(controller: inputfield, style: TextStyle(color: setTheme.accentColor, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: setTheme.accentColor, obscureText: false,
                          decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor)),
                              border: OutlineInputBorder(), labelStyle: TextStyle(color: setTheme.accentColor),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor))
                          ),
                        ),
                      ),),
                    ],
                  ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonTheme(minWidth: SizeConfig.SmallButtonWidth, height: SizeConfig.ButtonHeight,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RaisedButton(elevation: 3,
                              onPressed: () async {
                              if(inputfield.text.isNotEmpty){
                                bool b = await DatabaseService().buildQuizFromDb(inputfield.text);
                                if (b) {
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new takeQuizPageState()));
                                } else {
                                  return showDialog(
                                    context: context,
                                    child: new AlertDialog(
                                      title: new Text('No quiz with that code exists.'),
                                      actions: <Widget>[
                                        new FlatButton(
                                          onPressed: () => Navigator.of(context).pop(false),
                                          child: new Text('Okay'),
                                        ),
                                      ],
                                    ),
                                  ) ?? false;
                                  inputfield.clear();
                                  }
                                }
                              },
                              color: setTheme.buttonColor,
                              child: Text("Connect", style: TextStyle(letterSpacing: 1,
                                fontSize: SizeConfig.ButtonTextSize,fontFamily: 'Architect', color: setTheme.accentColor,)),),
                          ),
                        ),
                      ],
                    )],),
            ),
          ),
        )
    );
  }
}




