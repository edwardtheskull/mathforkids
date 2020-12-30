import 'package:mathforkids/main.dart';
import 'package:mathforkids/utils/Imports.dart';


class teacherPageState extends StatefulWidget{
  @override
  teacherPage createState() => teacherPage();
}

class teacherPage extends State<teacherPageState>{
  final AuthService _auth = AuthService();
  String header = "Math for Kids";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      home: Scaffold(
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
          body:  Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [Row(mainAxisAlignment: MainAxisAlignment.center, children: [ButtonTheme(minWidth: SizeConfig.ButtonWidth, height: SizeConfig.ButtonHeight,
                child: RaisedButton(elevation: 2,
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new connectPageState()));
                  },
                  color: setTheme.buttonColor,
                  child: Text("Test Quiz", style: TextStyle(letterSpacing: 1,
                      fontSize: SizeConfig.ButtonTextSize,
                      color: setTheme.accentColor,fontFamily: 'Architect')),),
              )],
              ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ButtonTheme(minWidth: SizeConfig.ButtonWidth, height: SizeConfig.ButtonHeight,
                    child: RaisedButton(elevation: 3,
                      onPressed: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => new createquizPageState()));
                      },
                      color: setTheme.buttonColor,
                      child: Text("Create Quiz", style: TextStyle(letterSpacing: 1,
                        fontSize: SizeConfig.ButtonTextSize,
                        color: setTheme.accentColor, fontFamily: 'Architect',)),),
                  ),
                )],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ButtonTheme(minWidth: SizeConfig.ButtonWidth, height: SizeConfig.ButtonHeight,
                    child: RaisedButton(elevation: 3,
                      onPressed: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentresultPageState()));
                      },
                      color: setTheme.buttonColor,
                      child: Text("Teacher Page", style: TextStyle(letterSpacing: 1,
                        fontSize: SizeConfig.ButtonTextSize,
                        color: setTheme.accentColor, fontFamily: 'Architect',)),),
                  ),
                )],
                ),
              ])
      ),
    );
  }
}




