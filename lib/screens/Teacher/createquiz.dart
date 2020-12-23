import 'package:mathforkids/utils/Imports.dart';

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
                      TextField( style: TextStyle(color: Colors.white, fontFamily: 'Architect'), cursorColor: Colors.white,
                        decoration: InputDecoration(enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(), labelStyle: TextStyle(color: Colors.white),
                            labelText: 'Name', focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white))
                        ),
                      ),
                      SwitchListTile(title: const Text('test'), value:test, onChanged: (bool value) { setState(() {
                        test = value;}); },),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(value: Dropdownquestionvalue, style: TextStyle(color: Colors.green, fontSize: SizeConfig.TextFieldFontSize, fontFamily:"Architect" ), underline: Container(height:2, color: Colors.purple),
                              onChanged: (String newValue) {
                                setState(() {
                                  Dropdownquestionvalue = newValue;
                                });
                              },
                              items: <String>['Multiple choice','Written answer','Pair options'].map<DropdownMenuItem<String>>((String value) { return DropdownMenuItem<String>(value: value, child: Text(value),);
                              }).toList(),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              onPressed: () async{

                              },
                              color: Colors.green,
                              child: Text("Add Question", style: TextStyle(
                                fontSize: SizeConfig.Createquestionbutton,
                                color: Colors.white,fontFamily: 'Architect',
                              ),),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                ),

                Expanded(child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () async{
                        confirmDialog(context);
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


  confirmDialog (BuildContext context) async {
   return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Quiz'),
          content: Text("Are You Sure Want To Proceed?"),
          actions: <Widget>[
          FlatButton(
            child: Text("YES"),
              onPressed: () {
              //Put your code here which you want to execute on Yes button click.
              Navigator.of(context).pop();
            },
            ),

          FlatButton(
            child: Text("NO"),
              onPressed: () {
              Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}


