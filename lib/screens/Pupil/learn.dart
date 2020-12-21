import 'package:mathforkids/utils/Imports.dart';


class learnPageState extends StatefulWidget{
  @override
  LearnPage createState() => LearnPage();
}

class LearnPage extends State<learnPageState>{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(31, 69, 82, 1),
        appBar: AppBar(
          title: Text(
            "Learn",
            style: TextStyle(
              fontSize: SizeConfig.AppbarFontSize,
              fontFamily: "Architect",
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle:true,
          backgroundColor: Colors.green[600],
        ),
        body:  Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [Row(mainAxisAlignment: MainAxisAlignment.center, children: [ButtonTheme(minWidth: SizeConfig.SquareButton, height: SizeConfig.SquareButton,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(elevation: 2,
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnQPageState()));
                  },
                  color: Colors.green[600],
                  child: Text("+", style: TextStyle(letterSpacing: 1,
                      fontSize: SizeConfig.LargeButtonTextSize,
                      color: Colors.white,fontFamily: 'Architect')),),
              ),
            ),
              ButtonTheme(minWidth: SizeConfig.SquareButton, height: SizeConfig.SquareButton,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RaisedButton(elevation: 3,
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnQPageState()));
                    },
                    color: Colors.green[600],
                    child: Text("-", style: TextStyle(letterSpacing: 1,
                      fontSize: SizeConfig.LargeButtonTextSize,
                      color: Colors.white,fontFamily: 'Architect',)),),
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
                    color: Colors.green[600],
                    child: Text("x", style: TextStyle(letterSpacing: 1,
                        fontSize: SizeConfig.LargeButtonTextSize,
                        color: Colors.white,fontFamily: 'Architect')),),
                ),
              ),
                ButtonTheme(minWidth: SizeConfig.SquareButton, height: SizeConfig.SquareButton,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(elevation: 3,
                      onPressed: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnQPageState()));
                      },
                      color: Colors.green[600],
                      child: Text("/", style: TextStyle(letterSpacing: 1,
                        fontSize: SizeConfig.LargeButtonTextSize,
                        color: Colors.white,fontFamily: 'Architect',)),),
                  ),
                ),
              ],
              ),
            ])
    );
  }
}
