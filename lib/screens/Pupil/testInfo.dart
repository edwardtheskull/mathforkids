import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/Pupil/data.dart';



class TestInfo{
  String type;
  String header;
  String testName;
  bool passed;
  String date;
  String testID;
  int maxP;
  int minP;
  int studP;
  List<Questions> questions;
  TestInfo({this.date, this.type, this.testName,this.maxP, this.minP, this.studP});

  CircleAvatar whatIcon( int testP){
    if(testP >= minP){
      header ="Passed";
      passed = true;
      return CircleAvatar(
        backgroundColor: Colors.green,
      );
    }
    header="Failed";
    passed = false;
    return CircleAvatar(
      backgroundColor: Colors.red,
    );
  }


}

class Questions{
  String name;
  String qst;
  String answer;
  String stdAnswer;
  String points;
  bool passed;
  String trailer;

  Questions({this.name, this.answer, this.qst, this.stdAnswer});

  CircleAvatar whatIcon( String stdAns){
    if(stdAnswer == answer){
      passed = true;
      trailer = "passed";
      return CircleAvatar(
        backgroundColor: Colors.green,
      );
    }
    passed = false;
    trailer = "view error";
    return CircleAvatar(
      backgroundColor: Colors.red,
    );
  }


}