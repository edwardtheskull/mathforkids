import 'package:mathforkids/utils/Imports.dart';
import 'package:flutter/material.dart';
import 'package:mathforkids/screens/services/auth.dart';
import 'package:mathforkids/screens/services/load.dart';

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
  String header = "Register";
  bool load = false;
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return load ? Loading() : MaterialApp(
        home: Scaffold(
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
            child: Container(height: SizeConfig.ScreenHeight, width: MediaQuery.of(context).size.width*0.8,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column( crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                          child: Text("Name:",
                            style: TextStyle(fontSize: SizeConfig.TextFontSize,
                              color: setTheme.accentColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Architect",
                            ),
                          ),
                        ),
                        TextFormField(controller: textname, style: TextStyle(color: setTheme.accentColor, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: setTheme.accentColor,
                          validator: (val) => val.isEmpty ? 'Enter name' : null,
                          obscureText: false,
                          decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor)),
                              border: OutlineInputBorder(), labelStyle: TextStyle(color: setTheme.accentColor),
                               focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor))
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                          child: Text("Password:",
                            style: TextStyle(fontSize: SizeConfig.TextFontSize,
                              color: setTheme.accentColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Architect",
                            ),
                          ),
                        ),
                        TextFormField(controller: textpassword, style: TextStyle(color: setTheme.accentColor, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: setTheme.accentColor,
                          validator: (val) => val.isEmpty ? 'Enter password' : val.length < 6 ?
                          'Must be at least 6 characters' : null,
                          obscureText: true,
                          decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor)),
                              border: OutlineInputBorder(), labelStyle: TextStyle(color: setTheme.accentColor),
                               focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor))
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                          child: Text("Confirm Password:",
                            style: TextStyle(fontSize: SizeConfig.TextFontSize,
                              color: setTheme.accentColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Architect",
                            ),
                          ),
                        ),
                        TextFormField(controller: textconfirmpassword, style: TextStyle(color: setTheme.accentColor, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: setTheme.accentColor,
                          validator: (val) => val.isEmpty ?
                          'Enter password' :
                           val != textpassword.text ?
                          'Passwords not matching' : null,
                          obscureText: true,
                          decoration: InputDecoration(enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor)),
                              border: OutlineInputBorder(), labelStyle: TextStyle(color: setTheme.accentColor),
                               focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor))
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                          child: Text("Mail:",
                            style: TextStyle(fontSize: SizeConfig.TextFontSize,
                              color: setTheme.accentColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Architect",
                            ),
                          ),
                        ),
                        TextFormField(controller: textmail, style: TextStyle(color: setTheme.accentColor, fontFamily: 'Architect', fontSize: SizeConfig.TextFieldFontSize), cursorColor: setTheme.accentColor,
                          validator: (val) => val.isEmpty ? 'Enter mail' : null,
                          obscureText: false,
                          decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor)),
                              border: OutlineInputBorder(), labelStyle: TextStyle(color: setTheme.accentColor),
                               focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: setTheme.accentColor))
                          ),
                        ),
                        Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Role:",
                                style: TextStyle(fontSize: SizeConfig.TextFontSize,
                                  color: setTheme.accentColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Architect",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton<String>(value: dropdownvalue, dropdownColor: Color.fromRGBO(31, 69, 82, 1), style: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.TextFieldFontSize, fontFamily:"Architect" ), underline: Container(color: Colors.transparent),
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
                                if(_formKey.currentState.validate()){
                                  setState(() => load = true);
                                  dynamic res = await _auth.registerWithEmailAndPassword(dropdownvalue, textname.text, textmail.text, textpassword.text);
                                  if(res == null){
                                    setState(() => error = 'error');
                                    setState(() => load = false);
                                  } else {
                                    print('user created');
                                    print(res.uid);
                                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new loginPageState()));
                                  }
                                }
                              },
                              color: setTheme.primaryColor,
                              child: Text("Register", style: TextStyle(letterSpacing: 1,
                                fontSize: SizeConfig.ButtonTextSize,
                                color: setTheme.accentColor,fontFamily: 'Architect',)),),
                          ),
                        )],
                        ),
                      ]),
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}




