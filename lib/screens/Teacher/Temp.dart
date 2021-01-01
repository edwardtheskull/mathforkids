
import 'dart:collection';
import 'package:mathforkids/utils/Imports.dart';

Map GlobQA;
Map GlobQL = new Map<String, Map>();
String QuizName = '';
TextEditingController TXC = new TextEditingController(text: '');


String Test(String s){
  if(GlobQL.isNotEmpty){
    return GlobQL.keys.first.toString();
  }
  else{return s;}
}