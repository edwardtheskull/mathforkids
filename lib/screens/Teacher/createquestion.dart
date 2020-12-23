import 'package:mathforkids/utils/Imports.dart';

class createquestionPageState extends StatefulWidget{
  @override
  createquestionPage createState() => createquestionPage();
}

class createquestionPage extends State<createquestionPageState>{
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
    body:  Scrollbar());
  }
}