import 'package:mathforkids/utils/Imports.dart';
import 'package:flutter/material.dart';
import 'package:mathforkids/screens/services/auth.dart';

class registerPageState extends StatefulWidget{
  @override
  RegisterPage createState() => RegisterPage();
}

String dropdownvalue = "Student";
TextEditingController textname = new TextEditingController();
TextEditingController textpassword = new TextEditingController();
TextEditingController textconfirmpassword = new TextEditingController();
TextEditingController textmail = new TextEditingController();
TextEditingController textnick = new TextEditingController();
TextEditingController textrole = new TextEditingController();

class RegisterPage extends State<registerPageState>{
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool _validate = false;
  String error = '';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(31, 69, 82, 1),
        appBar: AppBar(
          title: Text(
            "Register",
            style: TextStyle(
              fontSize: SizeConfig.AppbarFontSize,
              color: Colors.white,
              fontFamily: "Architect",
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle:true,
          backgroundColor: Colors.green[600],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(height: SizeConfig.ScreenHeight, width: MediaQuery.of(context).size.width*0.8,
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(12.0),

                child: Column( crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                        child: Text("Name:",
                          style: TextStyle(fontSize: SizeConfig.TextFontSize,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Architect",
                          ),
                        ),
                      ),
                      TextField(controller: textname, style: TextStyle(color: Colors.white, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: Colors.white,
                        obscureText: false,
                        decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                             focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                        child: Text("Password:",
                          style: TextStyle(fontSize: SizeConfig.TextFontSize,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Architect",
                          ),
                        ),
                      ),
                      TextField(controller: textpassword, style: TextStyle(color: Colors.white, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: Colors.white,
                        obscureText: true,
                        decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                             focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                        child: Text("Confirm Password:",
                          style: TextStyle(fontSize: SizeConfig.TextFontSize,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Architect",
                          ),
                        ),
                      ),
                      TextField(controller: textconfirmpassword, style: TextStyle(color: Colors.white, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: Colors.white,
                        obscureText: true,
                        decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                             focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                        child: Text("Mail:",
                          style: TextStyle(fontSize: SizeConfig.TextFontSize,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Architect",
                          ),
                        ),
                      ),
                      TextField(controller: textmail, style: TextStyle(color: Colors.white, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: Colors.white,
                        obscureText: false,
                        decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                             focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                        child: Text("Nickname:",
                          style: TextStyle(fontSize: SizeConfig.TextFontSize,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Architect",
                          ),
                        ),
                      ),
                      TextField(controller: textnick, style: TextStyle(color: Colors.white, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: Colors.white,
                        obscureText: false,
                        decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                             focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                        ),
                      ),
                      Row( mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Role:",
                              style: TextStyle(fontSize: SizeConfig.TextFontSize,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Architect",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(value: dropdownvalue, style: TextStyle(color: Colors.green, fontSize: SizeConfig.TextFieldFontSize), underline: Container(color: Colors.transparent),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownvalue = newValue;
                                });
                              },
                              items: <String>['Teacher','Student'].map<DropdownMenuItem<String>>((String value) { return DropdownMenuItem<String>(value: value, child: Text(value, style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),);
                              }).toList(),),
                          )
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ButtonTheme(minWidth: SizeConfig.SmallButtonWidth, height: SizeConfig.ButtonHeight,
                          child: RaisedButton(elevation: 3,
                            onPressed: () async{
                              //if(_formKey.currentState.validate()){
                              dynamic res = await _auth.registerWithEmailAndPassword(textname.text, textpassword.text);
                              if(res == null){
                                setState(() => error = 'error');
                              } else {
                                print('user created');
                                print(res.uid);
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => new loginPageState()));
                              }
                              //}
                            },
                            color: Colors.green[600],
                            child: Text("Register", style: TextStyle(letterSpacing: 1,
                              fontSize: SizeConfig.ButtonTextSize,
                              color: Colors.white,fontFamily: 'Architect',)),),
                        ),
                      )],
                      ),
                    ]),
              ),
            ),
          ),
        )
    );
  }
}




