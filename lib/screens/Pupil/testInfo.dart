import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/Pupil/data.dart';



class TestInfo{
  String type;
  String name;
  bool passed;
  String date;
  int testID;
  TestInfo({this.date, this.type, this.name, this.passed}) ;

  CircleAvatar blabla( bool bla){
    if(bla){
      return CircleAvatar(
        backgroundColor: Colors.green,
      );
    }
    return CircleAvatar(
      backgroundColor: Colors.red,
    );
  }
}