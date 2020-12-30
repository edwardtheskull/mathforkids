import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/ChangeTheme.dart';
import 'package:mathforkids/screens/services/database.dart';
import 'package:mathforkids/screens/services/loggedinuser.dart';

class connectPageState extends StatefulWidget{
  @override
  ConnectPage createState() => ConnectPage();
}

class ConnectPage extends State<connectPageState>{
  @override
  String header = "Math for Kids";
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: setTheme.scaffoldBackgroundColor,
        appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back),
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
        body:  Center(
          child: Container(width: MediaQuery.of(context).size.width*0.8,
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
                      child: TextField(style: TextStyle(color: setTheme.accentColor, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: setTheme.accentColor, obscureText: false,
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
                            onPressed: (){
                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new loginPageState()));
                            },
                            color: setTheme.buttonColor,
                            child: Text("Connect", style: TextStyle(letterSpacing: 1,
                              fontSize: SizeConfig.ButtonTextSize,fontFamily: 'Architect', color: setTheme.accentColor,)),),
                        ),
                      ),
                    ],
                  )],),
          ),
        )
    );
  }
}




