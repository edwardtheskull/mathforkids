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
  TextEditingController textemail = new TextEditingController();
  TextEditingController textpassword = new TextEditingController();
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return load ? Loading() : StreamProvider<List<User>>.value(
      value: DatabaseService().users,
      child: Scaffold(
          backgroundColor: Color.fromRGBO(31, 69, 82, 1),
          appBar: AppBar(
            title: Text(
              "Reset Password",
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
                child: Form(
                  key: _formKey,
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
                            Expanded(child: TextFormField(controller: textemail, style: TextStyle(color: Colors.white, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: Colors.white,
                              validator: (val) => val.isEmpty ? 'Enter mail' : null,
                              obscureText: false,
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
                                      if(_formKey.currentState.validate()){
                                        setState(() => load = true);
                                        _auth.forgotPassword(textemail.text);
                                        Navigator.pushReplacementNamed(context, '/screens/Authenticate/login');
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
            ),
          )
      ),
    );
  }
}




