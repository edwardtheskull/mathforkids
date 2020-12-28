import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/Pupil/data.dart';



class TestInfo{
  String type;
  String header;
  String name;
  bool passed;
  String date;
  int testID;
  int maxP;
  int minP;
  int studP;
  List<Questions> questions;
  TestInfo({this.date, this.type, this.name,this.maxP, this.minP, this.studP});

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
  String type;
  String qst;
  int answer;
  int stdAnswer;
  int points;
  bool passed;
  String trailer;

  Questions({this.name, this.answer, this.qst, this.stdAnswer, this.type});

  CircleAvatar whatIcon( int stdAns){
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