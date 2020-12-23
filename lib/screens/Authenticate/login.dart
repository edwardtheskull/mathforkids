import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/services/database.dart';
import 'package:provider/provider.dart';
import 'package:mathforkids/screens/services/user_list.dart';


class loginPageState extends StatefulWidget{
  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<loginPageState>{
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  TextEditingController textname = new TextEditingController();
  TextEditingController textpassword = new TextEditingController();
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return StreamProvider<List<User>>.value(
      value: DatabaseService().users,
      child: Scaffold(
          backgroundColor: Color.fromRGBO(31, 69, 82, 1),
          appBar: AppBar(
            title: Text(
              "Login",
              style: TextStyle(
                fontSize: SizeConfig.AppbarFontSize,
                fontFamily: "Architect",
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle:true,
            backgroundColor: Colors.green[600],
          ),
          body: SingleChildScrollView(
            child: Center(
                child: Container(width: MediaQuery.of(context).size.width*0.8, height: SizeConfig.SmallScreenHeight,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [Row(children: [
                        Expanded(child: Text("email/username:",
                          style: TextStyle(fontSize: SizeConfig.TextFontSize, color: Colors.white,
                              fontWeight: FontWeight.bold, fontFamily: 'Architect'
                          ),
                        ),
                        ),
                      ],
                    ),
                      Row(
                        children: [
                          Expanded(child: TextField(controller: textname, style: TextStyle(color: Colors.white, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: Colors.white, obscureText: false,
                            decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                              border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                            ),
                          ),),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: Text("Password:",
                            style: TextStyle(fontSize: SizeConfig.TextFontSize, color: Colors.white,
                                fontWeight: FontWeight.bold, fontFamily: 'Architect'
                            ),
                          ),

                        ),
                      ],
                    ),
                      Row(
                        children: [
                          Expanded(child: TextField(controller: textpassword, style: TextStyle(color: Colors.white, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: Colors.white,
                            obscureText: true,
                            decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                              border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
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
                                  
                                  dynamic res = await _auth.signInWithEmailAndPassword(textname.text, textpassword.text);
                                  if(res == null){
                                    print('error signing in');
                                  } else {
                                    print('signed in');
                                    print(res.uid);
                                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentPageState()));
                                  }
                                },
                                color: Colors.green[600],
                                child: Text("Next", style: TextStyle(letterSpacing: 1,
                                  fontSize: SizeConfig.ButtonTextSize,
                                  color: Colors.white,fontFamily: 'Architect',)),),
                            ),
                          )],
                          ),

                        ],
                      ),
                    ]),
              ),
            ),
          )
      ),
    );
  }
}




