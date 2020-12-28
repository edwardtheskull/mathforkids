import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/Pupil/testInfo.dart';


List<TestInfo> tests = [
  TestInfo(date: '2020-11-20', type: 'addition', name: 'Addition intro', studP: 15 , maxP: 16, minP: 8),
  TestInfo(date: '2020-12-01', type: 'subtraction', name: 'subtraction intro', studP: 9, maxP: 20, minP: 10),
  TestInfo(date: '2020-12-10', type: 'multiplication', name: 'multiplication intro',studP: 15, maxP: 18, minP: 9),
  TestInfo(date: '2020-12-20', type: 'division', name: 'division intro', maxP: 15, studP: 7, minP: 8),
];

List<Questions> questions = [
  Questions(name: 'Question 1', qst: "1+1" , answer: 2, stdAnswer: 2, type: "addition"),
  Questions(name: 'Question 1', qst: "2+2" , answer: 4, stdAnswer: 3, type: "addition"),
  Questions(name: 'Question 1', qst: "3+3" , answer: 6, stdAnswer: 6, type: "addition"),
  Questions(name: 'Question 1', qst: "4+4" , answer: 8, stdAnswer: 8, type: "addition"),
];
