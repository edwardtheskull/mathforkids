import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/services/database.dart';
import 'package:provider/provider.dart';
import 'package:mathforkids/screens/services/user_list.dart';
import 'package:mathforkids/screens/services/load.dart';
import 'package:mathforkids/screens/Authenticate/reset.dart';
import 'package:mathforkids/screens/services/loggedinuser.dart';
import 'package:mathforkids/main.dart';


class loginPageState extends StatefulWidget{
  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<loginPageState>{
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool load = false;
  String email = '';
  String password = '';
  String error = '';
  String header = "Login";
  TextEditingController textname = new TextEditingController();
  TextEditingController textpassword = new TextEditingController();
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return load ? Loading() : StreamProvider<List<User>>.value(
      value: DatabaseService().users,
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: setTheme.scaffoldBackgroundColor,
            appBar: AppBar(
                leading: IconButton(icon: Icon(Icons.arrow_back),
                    onPressed: () =>  Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (context) => new MyStatefulWidget()), (route) => false)
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
                      else if (choice == Constants.Register){
                        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new registerPageState()));
                      }
                    },
                    itemBuilder: (BuildContext context){
                      return Constants.regOnSignin.map((choice){
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
                            Expanded(child: TextFormField(controller: textname, style: TextStyle(color: setTheme.accentColor, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: setTheme.accentColor,
                              validator: (val) => val.isEmpty ? 'Enter mail' : null,
                              obscureText: false,
                              decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor)),
                                border: OutlineInputBorder(), labelStyle: TextStyle(color: setTheme.accentColor),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor))
                              ),
                            ),),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("Password:",
                              style: TextStyle(fontSize: SizeConfig.TextFontSize, color: setTheme.accentColor,
                                  fontWeight: FontWeight.bold, fontFamily: 'Architect'
                              ),
                            ),

                          ),
                        ],
                      ),
                        Row(
                          children: [
                            Expanded(child: TextFormField(controller: textpassword, style: TextStyle(color: setTheme.accentColor, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: setTheme.accentColor,
                              validator: (val) => val.isEmpty ? 'Enter password' : val.length < 6 ?
                              'Must be at least 6 characters' : null,
                              obscureText: true,
                              decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor)),
                                border: OutlineInputBorder(), labelStyle: TextStyle(color: setTheme.accentColor),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor))
                              ),
                            ),),
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: ButtonTheme(minWidth: 12.0, height: 12.0,
                              child: RaisedButton(elevation: 0.0,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetScreen()));
                                },
                                color: setTheme.scaffoldBackgroundColor,
                                child: Text("Forgot Password", style: TextStyle(letterSpacing: 1,
                                  fontSize: SizeConfig.XSMiniTextFontSize,
                                  color: setTheme.accentColor, fontFamily: 'Architect',)),),
                            ),
                          )],
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
                                      dynamic res = await _auth.signInWithEmailAndPassword(textname.text, textpassword.text);
                                      if(res == null){
                                        print('error signing in');
                                        setState(() => load = false);
                                      } else {
                                        print('signed in');
                                        print(res.uid);
                                        //DatabaseService().createQuiz('quizz22', new Map());
                                        var role = await DatabaseService().getRole(textname.text);
                                        activerole = role;
                                        if(role == 'Teacher')
                                          Navigator.push(context, new MaterialPageRoute(builder: (context) => new teacherPageState()));
                                        else
                                          Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentPageState()));
                                      }
                                    }
                                  },
                                  color: setTheme.primaryColor,
                                  child: Text("Next", style: TextStyle(letterSpacing: 1,
                                    fontSize: SizeConfig.ButtonTextSize,
                                    color: setTheme.accentColor, fontFamily: 'Architect',)),),
                              ),
                            )],
                            ),
                            //UserList(),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          )
      ),
      ),
    );
  }
}




