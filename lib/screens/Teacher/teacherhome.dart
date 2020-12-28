import 'package:mathforkids/utils/Imports.dart';


class teacherPageState extends StatefulWidget{
  @override
  teacherPage createState() => teacherPage();
}

class teacherPage extends State<teacherPageState>{
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      home: Scaffold(
         backgroundColor: setTheme.scaffoldBackgroundColor,
          appBar: AppBar(
            iconTheme: IconThemeData(color: setTheme.accentColor),
            title: Text(
              "Math for Kids",
              style: TextStyle(
                fontSize: SizeConfig.AppbarFontSize,
                fontFamily: "Architect",
                fontWeight: FontWeight.bold,
                  color: setTheme.primaryTextTheme.headline6.color
              ),
            ),
            centerTitle:true,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async{
                  await _auth.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginPageState()));
                },
              )
            ],
            backgroundColor: setTheme.primaryColor,
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
                Switch(
                    value: dark,
                    onChanged: (state){
                      setState(() {
                        dark = state;
                        switchTheme();
                      });
                    }),
              ])
      ),
    );
  }
}




