
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
  static List<String> Matches = [null];
  static List<String> MClist = [null];
  List<bool> Answers = [true];
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
    if(Dropdownquestionvalue == 'Multiple choice'){
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
          body:
          Form(
            key: formkey,
            child: SingleChildScrollView(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(decoration: InputDecoration(hintText: 'Enter question'),),
                  Text('Add alternative'),
                  ..._getalternatives(),
                  RaisedButton(elevation: 5,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => createquizPageState()));
                    },
                    color: Colors.green[600],
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
          body:
          Form(
            key: formkey,
            child: Padding(padding: const EdgeInsets.all(16.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(decoration: InputDecoration(hintText: 'Enter question'),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(decoration: InputDecoration(hintText: 'Enter Answer'),),
                  ),
                  Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RaisedButton(elevation: 5,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => createquizPageState()));
                        },
                        color: Colors.green[600],
                        child: Text("Save question", style: TextStyle(letterSpacing: 1,
                            fontSize: SizeConfig.ButtonTextSize,
                            color: Colors.white,fontFamily: 'Architect')),),
                    ],
                  ),)
                ],
              ),
            ),
          ));
    }
    else{
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
          body:
          SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Padding(padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(decoration: InputDecoration(hintText: 'Write question'),),
                    Text('Add alternative'),
                    ..._getalternatives2(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RaisedButton(elevation: 5,
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => createquizPageState()));
                            },
                            color: Colors.green[600],
                            child: Text("Save question", style: TextStyle(letterSpacing: 1,
                                fontSize: SizeConfig.ButtonTextSize,
                                color: Colors.white,fontFamily: 'Architect')),),
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
          color: (add) ? Colors.green : Colors.red,
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