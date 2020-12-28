import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/ChangeTheme.dart';

class learnPageState extends StatefulWidget{
  @override
  LearnPage createState() => LearnPage();
}

class LearnPage extends State<learnPageState>{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: setTheme.scaffoldBackgroundColor,
        appBar: AppBar(
            iconTheme: IconThemeData(color: setTheme.accentColor),
          title: Text(
            "Learn",
            style: TextStyle(
              fontSize: SizeConfig.AppbarFontSize,
              fontFamily: "Architect",
              fontWeight: FontWeight.bold,
                color: setTheme.primaryTextTheme.headline6.color
            ),
          ),
          centerTitle:true,
          backgroundColor: setTheme.primaryColor
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
