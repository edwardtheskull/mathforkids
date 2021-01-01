
import 'dart:collection';
import 'package:mathforkids/screens/Teacher/Temp.dart';
import 'package:flutter/cupertino.dart';
import 'package:mathforkids/utils/Imports.dart';

class createquestionPageState extends StatefulWidget {
  String Dropdownquestionvalue;
  createquestionPageState({Key key, @required this.Dropdownquestionvalue}) : super(key: key);

  @override
  createquestionPage createState() =>new createquestionPage(Dropdownquestionvalue);
}

class createquestionPage extends State<createquestionPageState>{
  final formkey = GlobalKey<FormState>();
  String Dropdownquestionvalue;
  createquestionPage(this.Dropdownquestionvalue);
  static List<String> Pairs = [null];
  Map QA = Map<String, String>();
  static List<String> Matches = [null];
  static List<String> MClist = [null];
  List<bool> Answers = [true];
  List<String> Written = [null];
  TextEditingController _nameController2;
  TextEditingController _nameController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _nameController2 = TextEditingController();
  }
  @override
  void dispose() {
    _nameController2.dispose();
    _nameController.dispose();
    super.dispose();
  }
  @override
  String header = 'Math for Kids';
  Widget build(BuildContext context) {
    if(Dropdownquestionvalue == 'Multiple choice'){
      return Scaffold(
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
                    return Constants.choices.map((choice){
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice, style: TextStyle(color: setTheme.accentColor),),
                      );
                    }).toList();
                  },
                ),
              ]
          ),
          body:
          Form(
            key: formkey,
            child: SingleChildScrollView(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(decoration: InputDecoration(hintText: 'Enter question'),
                  controller: _nameController,),
                  Text('Add alternative'),
                  ..._getalternatives(),
                  RaisedButton(elevation: 5,
                    onPressed: (){
                      for(int i=0; i < MClist.length; i++){
                        if(i==0){
                          QA = {'Type' : Dropdownquestionvalue};
                        }
                          QA = {MClist[i]: Answers[i]};
                      }
                      GlobQL[_nameController.text] = QA;
                      QA.clear();
                      _nameController.clear();
                      MClist.clear();
                      Answers.clear();
                      MClist = [null];
                      Answers = [true];
                      Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => createquizPageState()), (route) => false);
                    },
                    color: setTheme.primaryColor,
                    child: Text("Save question", style: TextStyle(letterSpacing: 1,
                        fontSize: SizeConfig.ButtonTextSize,
                        color: Colors.white,fontFamily: 'Architect')),)
                ],
              ),
            ))
            ,
          ));
    }
    else if(Dropdownquestionvalue == 'Written answer'){
      return Scaffold(
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => new MyStatefulWidget()));
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
                        child: Text(choice, style: TextStyle(color: setTheme.accentColor),),
                      );
                    }).toList();
                  },
                ),
              ]
          ),
          body:
          Form(
            key: formkey,
            child: Padding(padding: const EdgeInsets.all(16.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(decoration: InputDecoration(hintText: 'Enter question'),
                        controller: _nameController),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(decoration: InputDecoration(hintText: 'Enter Answer'),
                    controller: _nameController2,),
                  ),
                  Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RaisedButton(elevation: 5,
                        onPressed: (){
                        QA = {'Type' : Dropdownquestionvalue};
                        QA = {_nameController.text : _nameController2.text};
                        GlobQL[_nameController.text] = QA;
                        QA.clear();
                        _nameController.clear();
                        _nameController2.clear();
                        Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => createquizPageState()), (route) => false);
                        },
                        color: setTheme.primaryColor,
                        child: Text("Save question", style: TextStyle(letterSpacing: 1,
                            fontSize: SizeConfig.ButtonTextSize,
                            color: setTheme.accentColor,fontFamily: 'Architect')),),
                    ],
                  ),)
                ],
              ),
            ),
          ));
    }
    else{
      return Scaffold(
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
                    return Constants.choices.map((choice){
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice, style: TextStyle(color: setTheme.accentColor),),
                      );
                    }).toList();
                  },
                ),
              ]
          ),
          body:
          SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Padding(padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(decoration: InputDecoration(hintText: 'Write question'),
                        controller: _nameController),
                    Text('Add alternative'),
                    ..._getalternatives2(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RaisedButton(elevation: 5,
                            onPressed: (){
                              for(int i=0; i < Pairs.length; i++){
                                if(i==0){
                                  QA = {'Type' : Dropdownquestionvalue};
                                }
                                QA = {Pairs[i]: Matches[i]};
                              }
                              GlobQL[_nameController.text] = QA;
                              QA.clear();
                              _nameController.clear();
                              Pairs.clear();
                              Matches.clear();
                              Pairs = [null];
                              Matches = [null];
                              Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => createquizPageState()), (route) => false);
                            },
                            color: setTheme.primaryColor,
                            child: Text("Save question", style: TextStyle(letterSpacing: 1,
                                fontSize: SizeConfig.ButtonTextSize,
                                color: setTheme.accentColor,fontFamily: 'Architect')),),
                        ],
                      ),),
                    )
                  ],

                ),

              ),
            ),
          ));
    }

  }

  List<Widget> _getalternatives(){
    List<Widget> MCTextFieldsList = [];
    for(int i=0; i<MClist.length; i++){
      MCTextFieldsList.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                Checkbox(value: Answers[i], onChanged: (bool value){
                  setState(() {
                    Answers[i] = value;
                  });
                }),
                Expanded(child: MCTextFields(i)),
                SizedBox(width: 16,),
                // we need add button at last friends row only
                _addRemoveButton(i == MClist.length-1, i),

              ],
            ),
          )
      );
    }
    return MCTextFieldsList;
  }


  Widget _addRemoveButton(bool add, int index){
    return InkWell(
      onTap: (){
        if(add){
          // add new text-fields at the top of all friends textfields
          MClist.insert(0, null);
          Answers.insert(0, true);
        }
        else{ MClist.removeAt(index);
        Answers.removeAt(index);}
        setState((){
        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? setTheme.primaryColor : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove, color: Colors.white,
        ),
      ),
    );
  }

  List<Widget> _getalternatives2(){
    List<Widget> PMTextFieldsList = [];
    for(int i=0; i<Pairs.length; i++){
      PMTextFieldsList.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                Expanded(child: PTextFields(i)) ,
                Expanded(child: MTextFields(i)) ,
                SizedBox(width: 16,),
                // we need add button at last friends row only
                _addRemoveButton2(i == Pairs.length-1, i),
              ],
            ),
          )
      );
    }
    return PMTextFieldsList;
  }

  Widget _addRemoveButton2(bool add, int index){
    return InkWell(
      onTap: (){
        if(add){
          // add new text-fields at the top of all friends textfields
          Matches.insert(0, null);
          Pairs.insert(0, null);
        }
        else{ Pairs.removeAt(index);
        Matches.removeAt(index);}
        setState((){
        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? setTheme.primaryColor : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove, color: Colors.white,
        ),
      ),
    );
  }

}

class MCTextFields extends StatefulWidget {
  final int index;
  MCTextFields(this.index);

  @override
  _MCTextFieldState createState() => _MCTextFieldState();
}

class _MCTextFieldState extends State<MCTextFields> {

  TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text =
          createquestionPage.MClist[widget.index]
              ?? '';
    });
    return TextFormField(
      controller: _nameController,
      // save text field data in friends list at index
      // whenever text field value changes
      onChanged: (v) =>
      createquestionPage.MClist[widget.index] = v,
      decoration: InputDecoration(
          hintText: 'Enter answer alternative',
      ),
      validator: (v) {
        if (v
            .trim()
            .isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}

class MTextFields extends StatefulWidget {
  final int index;
  MTextFields(this.index);

  @override
  _MTextFieldState createState() => _MTextFieldState();
}

class _MTextFieldState extends State<MTextFields> {

  TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text =
          createquestionPage.Matches[widget.index]
              ?? '';
    });
    return TextFormField(
      controller: _nameController,
      // save text field data in friends list at index
      // whenever text field value changes
      onChanged: (v) =>
      createquestionPage.Matches[widget.index] = v,
      decoration: InputDecoration(
          hintText: 'Enter match'
      ),
      validator: (v) {
        if (v
            .trim()
            .isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}

class PTextFields extends StatefulWidget {
  final int index;
  PTextFields(this.index);

  @override
  _PTextFieldState createState() => _PTextFieldState();
}

class _PTextFieldState extends State<PTextFields> {

  TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text =
          createquestionPage.Pairs[widget.index]
              ?? '';
    });
    return TextFormField(
      controller: _nameController,
      // save text field data in friends list at index
      // whenever text field value changes
      onChanged: (v) =>
      createquestionPage.Pairs[widget.index] = v,
      decoration: InputDecoration(
          hintText: 'Enter match'
      ),
      validator: (v) {
        if (v
            .trim()
            .isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}