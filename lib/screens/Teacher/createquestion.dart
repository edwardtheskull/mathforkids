
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
  Map<String, String> QA = new Map<String, String>();
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
      return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
            backgroundColor: setTheme.scaffoldBackgroundColor,
            appBar: AppBar(
                toolbarHeight: SizeConfig.AppBarSize,
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
                    TextFormField(style: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.TextFieldFontSize), decoration: InputDecoration(hintText: 'Enter question', hintStyle: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.TextFieldFontSize), enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:setTheme.accentColor))),
                    controller: _nameController,),
                    Text('Add alternative', style: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.TextFieldFontSize)),
                    ..._getalternatives(),
                    RaisedButton(elevation: 5,
                      onPressed: (){
                        for(int i=0; i < MClist.length; i++){
                          if(i==0){
                            QA['Type'] = Dropdownquestionvalue.toString();
                          }
                            QA['Alternative'+i.toString()] = MClist[i].toString();
                            QA['Answer'+i.toString()]  = Answers[i].toString();
                        }
                        QA['Question'] = _nameController.text;
                        GlobQL['Q'+iterator.toString()] = new Map<String, String>();
                        QA.forEach((key, value) {
                          (GlobQL['Q'+iterator.toString()])[key] = value;
                        });
                        iterator++;
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
                          color:setTheme.accentColor, fontFamily: 'Architect')),)
                  ],
                ),
              ))
              ,
            )),
      );
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
                    child: TextFormField(decoration: InputDecoration(hintText: 'Enter question', hintStyle: TextStyle(color: setTheme.accentColor), enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:setTheme.accentColor))), style: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.TextFieldFontSize),
                        controller: _nameController),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(decoration: InputDecoration(hintText: 'Enter Answer', hintStyle: TextStyle(color: setTheme.accentColor), enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:setTheme.accentColor))), style: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.TextFieldFontSize),
                    controller: _nameController2,),
                  ),
                  Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RaisedButton(elevation: 5,
                        onPressed: (){
                        QA['Type'] = Dropdownquestionvalue.toString();
                        QA['Answer'] = _nameController2.text;
                        QA['Question'] = _nameController.text;
                        GlobQL['Q'+iterator.toString()] = new Map<String, String>();
                        QA.forEach((key, value) {
                          (GlobQL['Q'+iterator.toString()])[key] = value;
                        });
                        iterator++;
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
                    TextFormField(decoration: InputDecoration(hintText: 'Write question', hintStyle: TextStyle(color: setTheme.accentColor), enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:setTheme.accentColor))), style: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.TextFieldFontSize),
                        controller: _nameController),
                    Text('Add alternative', style: TextStyle(color:setTheme.accentColor, fontSize:SizeConfig.TextFieldFontSize ),),
                    ..._getalternatives2(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RaisedButton(elevation: 5,
                            onPressed: (){
                              for(int i=0; i < Pairs.length; i++){
                                if(i==0){
                                  QA['Type'] = Dropdownquestionvalue.toString();
                                }
                                QA['Pair'+i.toString()] = Pairs[i].toString();
                                QA['Matches'+i.toString()] = Matches[i].toString();
                              }
                              QA['Question'] = _nameController.text;
                              GlobQL['Q'+iterator.toString()] = new Map<String, String>();
                              QA.forEach((key, value) {
                                (GlobQL['Q'+iterator.toString()])[key] = value;
                              });
                              iterator++;
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
                      ),
                    )
                  ],

                ),

              ),
            ),
          ));
    }

  }

  Future<bool> onWillPop() {
    return showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text('Are you sure you want to quit?'),
        content: new Text('Unsaved data will be lost.'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () {
              dispose();
              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new createquizPageState()));
             },
            child: new Text('Yes')
          ),
        ],
      ),
    ) ?? false;
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
        width: SizeConfig.SmallIconSize,
        height: SizeConfig.SmallIconSize,
        decoration: BoxDecoration(
          color: (add) ? setTheme.primaryColor : Colors.red,
          borderRadius: BorderRadius.circular(SizeConfig.SmallIconSize),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove, color: setTheme.accentColor,
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
        width: SizeConfig.SmallIconSize,
        height: SizeConfig.SmallIconSize,
        decoration: BoxDecoration(
          color: (add) ? setTheme.primaryColor : Colors.red,
          borderRadius: BorderRadius.circular(SizeConfig.SmallIconSize),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove, color: setTheme.accentColor,
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
      createquestionPage.MClist[widget.index] = v, style: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.TextFieldFontSize),
      decoration: InputDecoration(hintText: 'Enter answer alternative', hintStyle: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.TextFieldFontSize), enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:setTheme.accentColor))),
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
          hintText: 'Enter match',
          hintStyle: TextStyle(color: setTheme.accentColor), enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:setTheme.accentColor))), style: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.TextFieldFontSize),
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
          hintText: 'Enter match',
          hintStyle: TextStyle(color: setTheme.accentColor), enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:setTheme.accentColor))), style: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.TextFieldFontSize),
      validator: (v) {
        if (v
            .trim()
            .isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}