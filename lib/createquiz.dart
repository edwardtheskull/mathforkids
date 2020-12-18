import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathforkids/connect.dart';
import 'package:sqflite/sqflite.dart';



class createquizPageState extends StatefulWidget{
  @override
  createquizPage createState() => createquizPage();
}




class createquizPage extends State<createquizPageState>{
  bool test = false;
  final formKey = GlobalKey<FormState>();
  String Dropdownquestionvalue = "Multiple choice";
  static List<String> multiplechoiceanswers = [null];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(31, 69, 82, 1),
        appBar: AppBar(
          title: Text(
            "Create Quiz",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: "Architect",
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle:true,
          backgroundColor: Colors.green[600],
        ),
        body:  Scrollbar(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text("Name:",
                        style: TextStyle(fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Architect",
                        ),
                      ),
                      Expanded(child: TextField( style: TextStyle(color: Colors.white, fontFamily: 'Architect'), cursorColor: Colors.white,
                        decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                            labelText: 'Name', focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                        ),
                      ),),
                    ],
                  ),
                ),
                ),
                SwitchListTile(title: const Text('test'), value:test, onChanged: (bool value) { setState(() {
                  test = value;}); },),
                Expanded(child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () async{
                        showInformationDialog(context);
                      },
                      color: Colors.green,
                      child: Text("Add Question", style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,fontFamily: 'Architect',
                      ),),
                    ),
                  ),
                ),),
                Expanded(child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => new connectPageState()));
                      },
                      color: Colors.green,
                      child: Text("Create Quiz", style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,fontFamily: 'Architect',
                      ),),
                    ),
                  ),
                ),)
              ]),
        )
    );
  }

  showInformationDialog (BuildContext context) {
    return showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Create question'),
            content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState){
            return Container(height: MediaQuery.of(context).size.height*0.9, width: MediaQuery.of(context).size.width ,
              child: Column(
                children: [
                  DropdownButton<String>(value: Dropdownquestionvalue, style: TextStyle(color: Colors.black), underline: Container(height:2, color: Colors.purple),
                    onChanged: (String newValue) {
                      setState(() {
                        Dropdownquestionvalue = newValue;

                      });
                    },
                    items: <String>['Multiple choice','Written answer','Pair options'].map<DropdownMenuItem<String>>((String value) { return DropdownMenuItem<String>(value: value, child: Text(value),);
                    }).toList(),),
                Expanded(child: selectform())
                ],
              ),
            );}
          )
          );});
  }

  Widget selectform(){

    if(Dropdownquestionvalue == 'Multiple choice'){
      return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(decoration: InputDecoration(hintText: 'Write question here'),),
             Text('Add Friends', style: TextStyle(
          fontWeight: FontWeight.w700, fontSize: 16),),
          ..._getFriends(),
            SizedBox(height: 40,),

          ],
      ));
    }
    else if(Dropdownquestionvalue == 'Written answer'){
      return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(decoration: InputDecoration(hintText: 'Write question here'),)
            ],
          )
      );
    }
    else{
      return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(decoration: InputDecoration(hintText: 'Write question here'),)
            ],
          )
      );
    }

}

  List<Widget> _getFriends(){
    List<Widget> MCTextFieldsList = [];
    for(int i=0; i<multiplechoiceanswers.length; i++){
      MCTextFieldsList.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                Expanded(child: mchoicefields(i)),
                SizedBox(width: 16,),
                // we need add button at last friends row only
                _addRemoveButton(i == multiplechoiceanswers.length-1, i),
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
          multiplechoiceanswers.insert(0, null);
        }
        else {multiplechoiceanswers.removeAt(index);}
        setState((){});

      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove, color: Colors.white,
        ),
      ),
    );
  }


}
class mchoicefields extends StatefulWidget{

  final int index;
  mchoicefields(this.index);

  @override
  _mchoicefieldsState createState() => _mchoicefieldsState();
}



class _mchoicefieldsState extends State<mchoicefields>{

  TextEditingController _namecontroller;

  @override
  void initState(){
    super.initState();
    _namecontroller = TextEditingController();
  }

  @override
  void dispose(){
    _namecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _namecontroller.text = createquizPage.multiplechoiceanswers[widget.index]??'';
    });

    return TextFormField(controller: _namecontroller,
    onChanged: (v) => createquizPage.multiplechoiceanswers[widget.index] = v,
      decoration: InputDecoration(hintText: 'Enter Answer'),
      validator: (v){
      if(v.trim().isEmpty) return 'Please enter something';
      return null;
      },
    );
  }
}


