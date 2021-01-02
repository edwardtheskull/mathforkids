import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/services/database.dart';
import 'package:provider/provider.dart';
import 'package:mathforkids/screens/services/user_list.dart';
import 'package:mathforkids/screens/services/load.dart';


class ResetScreen extends StatefulWidget{
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen>{
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool load = false;
  String email = '';
  String password = '';
  String error = '';
  String header = 'Reset Password';
  TextEditingController textemail = new TextEditingController();
  TextEditingController textpassword = new TextEditingController();
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return load ? Loading() : StreamProvider<List<User>>.value(
      value: DatabaseService().users,
      child: Scaffold(
          backgroundColor: setTheme.scaffoldBackgroundColor,
          appBar: AppBar(
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
                    return Constants.Outlogged.map((choice){
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice, style: TextStyle(color: setTheme.accentColor)),
                      );
                    }).toList();
                  },
                ),
              ]
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(width: MediaQuery.of(context).size.width*0.8, height: SizeConfig.SmallScreenHeight,
                child: Form(
                  key: _formKey,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [Row(children: [
                        Expanded(child: Text("Email:",
                          style: TextStyle(fontSize: SizeConfig.TextFontSize, color: setTheme.accentColor,
                              fontWeight: FontWeight.bold, fontFamily: 'Architect'
                          ),
                        ),
                        ),
                      ],
                      ),
                        Row(
                          children: [
                            Expanded(child: TextFormField(controller: textemail, style: TextStyle(color: setTheme.accentColor, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: setTheme.accentColor,
                              validator: (val) => val.isEmpty ? 'Enter mail' : null,
                              obscureText: false,
                              decoration: InputDecoration(enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor)),
                                  border: OutlineInputBorder(), labelStyle: TextStyle(color: setTheme.accentColor),
                                  focusedBorder: OutlineInputBorder(borderSide:  BorderSide(color: setTheme.accentColor)),
                                  errorStyle: TextStyle(fontSize: SizeConfig.TextFieldFontSize)
                              ),
                            ),),
                          ],
                        ),
                        Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [Padding(
                                padding: const EdgeInsets.only(top: 35),
                                child: ButtonTheme(minWidth: SizeConfig.SmallButtonWidth, height: SizeConfig.ButtonHeight,
                                  child: RaisedButton(elevation: 3,
                                    onPressed: () async{
                                      if(_formKey.currentState.validate()){
                                        setState(() => load = true);
                                        _auth.forgotPassword(textemail.text);
                                        Navigator.pushReplacementNamed(context, '/screens/Authenticate/login');
                                      }
                                    },
                                    color: setTheme.primaryColor,
                                    child: Text("Next", style: TextStyle(letterSpacing: 1,
                                      fontSize: SizeConfig.ButtonTextSize,
                                      color: setTheme.accentColor, fontFamily: 'Architect',)),),
                                ),
                              )],
                            ),

                          ],
                        ),
                      ]),
                ),
              ),
            ),
          )
      ),
    );
  }
}




