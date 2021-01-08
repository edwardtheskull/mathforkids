import 'package:mathforkids/screens/services/database.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/utils/ChangeTheme.dart';

class learnPageState extends StatefulWidget{
  @override
  LearnPage createState() => LearnPage();
}

class LearnPage extends State<learnPageState>{
  @override
  String header = "Math for Kids";
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: setTheme.scaffoldBackgroundColor,
        appBar: AppBar(
            toolbarHeight: SizeConfig.AppBarSize,
            leading: IconButton(icon: Icon(Icons.arrow_back),
              iconSize: SizeConfig.SmallIconSize,
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
            children: [Row(mainAxisAlignment: MainAxisAlignment.center, children: [ButtonTheme(minWidth: SizeConfig.SquareButton, height: SizeConfig.SquareButton,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(elevation: 2,
                  onPressed: () async {
                    await DatabaseService().buildLearnList('addition');
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnQPageState(type: 'addition')));
                  },
                  color: setTheme.buttonColor,
                  child: Text("+", style: TextStyle(letterSpacing: 1,
                      fontSize: SizeConfig.LargeButtonTextSize, color: setTheme.accentColor,
                      fontFamily: 'Architect')),),
              ),
            ),
              ButtonTheme(minWidth: SizeConfig.SquareButton, height: SizeConfig.SquareButton,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RaisedButton(elevation: 3,
                    onPressed: () async {
                      await DatabaseService().buildLearnList('subtraction');
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnQPageState(type: 'subtraction')));
                    },
                    color: setTheme.buttonColor,
                    child: Text("-", style: TextStyle(letterSpacing: 1,
                      fontSize: SizeConfig.LargeButtonTextSize, color: setTheme.accentColor,
                      fontFamily: 'Architect',)),),
                ),
              ),
            ],
            ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [ButtonTheme(minWidth: SizeConfig.SquareButton, height: SizeConfig.SquareButton,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RaisedButton(elevation: 2,
                    onPressed: () async {
                      await DatabaseService().buildLearnList('multiplication');
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnQPageState(type: 'multiplication')));
                    },
                    color: setTheme.buttonColor,
                    child: Text("x", style: TextStyle(letterSpacing: 1,
                        fontSize: SizeConfig.LargeButtonTextSize, color: setTheme.accentColor,
                       fontFamily: 'Architect')),),
                ),
              ),
                ButtonTheme(minWidth: SizeConfig.SquareButton, height: SizeConfig.SquareButton,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(elevation: 3,
                      onPressed: () async {
                        await DatabaseService().buildLearnList('division');
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnQPageState(type: 'division')));
                      },
                      color: setTheme.buttonColor,
                      child: Text("/", style: TextStyle(letterSpacing: 1,
                        fontSize: SizeConfig.LargeButtonTextSize, color: setTheme.accentColor,
                        fontFamily: 'Architect',)),),
                  ),
                ),
              ],
              ),
            ])
    );
  }
}
