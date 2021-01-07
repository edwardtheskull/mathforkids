import 'package:mathforkids/utils/Imports.dart';
import 'file:///C:/Users/Gabriel/AndroidStudioProjects/mathforkids/lib/utils/ChangeTheme.dart';

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
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnQPageState()));
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
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnQPageState()));
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
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnQPageState()));
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
                      onPressed: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnQPageState()));
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
