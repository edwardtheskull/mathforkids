import 'package:mathforkids/utils/Imports.dart';


class teacherPageState extends StatefulWidget{
  @override
  teacherPage createState() => teacherPage();
}

class teacherPage extends State<teacherPageState>{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
       backgroundColor: Color.fromRGBO(31, 69, 82, 1),
        appBar: AppBar(
          title: Text(
            "Math for Kids",
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
            children: [Row(mainAxisAlignment: MainAxisAlignment.center, children: [ButtonTheme(minWidth: SizeConfig.ButtonWidth, height: SizeConfig.ButtonHeight,
              child: RaisedButton(elevation: 2,
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new connectPageState()));
                },
                color: Colors.green[600],
                child: Text("Test Quiz", style: TextStyle(letterSpacing: 1,
                    fontSize: SizeConfig.ButtonTextSize,
                    color: Colors.white,fontFamily: 'Architect')),),
            )],
            ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ButtonTheme(minWidth: SizeConfig.ButtonWidth, height: SizeConfig.ButtonHeight,
                  child: RaisedButton(elevation: 3,
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new createquizPageState()));
                    },
                    color: Colors.green[600],
                    child: Text("Create Quiz", style: TextStyle(letterSpacing: 1,
                      fontSize: SizeConfig.ButtonTextSize,
                      color: Colors.white,fontFamily: 'Architect',)),),
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
                    color: Colors.green[600],
                    child: Text("Teacher Page", style: TextStyle(letterSpacing: 1,
                      fontSize: SizeConfig.ButtonTextSize,
                      color: Colors.white,fontFamily: 'Architect',)),),
                ),
              )],
              ),
            ])
    );
  }
}




