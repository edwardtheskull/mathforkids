import 'package:mathforkids/utils/Imports.dart';

void main() => runApp(Home());

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      )
    );
  }
}

class MyStatefulWidget extends StatefulWidget{
  MyStatefulWidget({Key key}) : super(key:key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>{
  TextEditingController textInput = new TextEditingController();
  @override
  Widget build(BuildContext context){
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        image:DecorationImage(image: AssetImage('images/test.jpg'),
          fit: BoxFit.cover,),),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
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
            backgroundColor: setTheme.primaryColor,
          ),
          body:  Container(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [ButtonTheme(minWidth: SizeConfig.SmallButtonWidth, height: SizeConfig.ButtonHeight,
                child: RaisedButton(elevation: 2, onPressed: (){Navigator.push(context, new MaterialPageRoute(builder: (context) => new loginPageState()));},
                color: setTheme.buttonColor,
                child: Text("Login", style: TextStyle(letterSpacing: 1,
                  fontSize: SizeConfig.ButtonTextSize,
                  color: setTheme.accentColor, fontFamily: 'Architect')),),
              )],
              ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ButtonTheme(minWidth: SizeConfig.SmallButtonWidth, height: SizeConfig.ButtonHeight,
                    child: RaisedButton(elevation: 3,
                      onPressed: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => new registerPageState()));
                      },
                      color: setTheme.buttonColor,
                      child: Text("Register", style: TextStyle(letterSpacing: 1,
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
              ],
            )
          )
      ),
    );
  }
}


