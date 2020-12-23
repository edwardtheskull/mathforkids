
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
  static List<String> MClist = [null];
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
            child: Padding(padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(decoration: InputDecoration(hintText: 'Enter question'),),
                  Text('Add alternative'),
                  ..._getalternatives()
                ],
              ),

            ),
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
              child: Column(
                children: [
                  TextFormField(decoration: InputDecoration(hintText: 'Enter question'),),
                  TextFormField(decoration: InputDecoration(hintText: 'Enter Answer'),)
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
          Form(
            key: formkey,
            child: Padding(padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(decoration: InputDecoration(hintText: 'Pairing'),),
                ],
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
        }
        else MClist.removeAt(index);
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
          hintText: 'Enter answer alternative'
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