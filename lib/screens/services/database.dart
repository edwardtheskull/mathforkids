import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mathforkids/screens/Authenticate/user.dart';
import 'package:mathforkids/screens/Authenticate/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference mathCollection = Firestore.instance.collection('users');

  //quiz
  Future addQuizNum() async{
    return await Firestore.instance.collection('quiz').document('quizzes').updateData({'num': FieldValue.increment(1)});
  }

  Future createQuiz(String name, Map questions) async{
    DocumentSnapshot db = await Firestore.instance.document('quiz/quizzes').get();
    var num = db.data['num'];
    addQuizNum();
    if(true){
      createPair(num);
    }
    else if(true){
      createMultiple(num);
    }
    else if(true){
      createWritten(num);
    }
    return await Firestore.instance.collection('quiz').document((10000+num).toString()).setData({
      'code': (10000+num).toString(),
      'name': name,
    });
  }

  Future createMultiple(var num) async{
    Firestore.instance.collection('quiz').document((10000+num).toString()).collection('questions').document('question1').collection('multiples').document('answer1').setData({
      'answer': 'correct answer',
      'correct': 'true',
    });
    return await Firestore.instance.collection('quiz').document((10000+num).toString()).collection('questions').document('question1').setData({
      'question': 'Test question',
      'type': 'Multiple',
    });
  }

  Future createWritten(var num) async{
    return await Firestore.instance.collection('quiz').document((10000+num).toString()).collection('questions').document('question1').setData({
      'correct': 'correct answer',
      'question': 'Test question',
      'type': 'Written',
    });
  }

  Future createPair(var num) async{
    Firestore.instance.collection('quiz').document((10000+num).toString()).collection('questions').document('question1').collection('pairs').document('pair1').setData({
      'input': 'test',
      'input1': 'test',
    });
    return await Firestore.instance.collection('quiz').document((10000+num).toString()).collection('questions').document('question1').setData({
      'question': 'Test question',
      'type': 'Pair',
    });
  }

  //user
  Future updateUserData(String name, String role, String username) async{
    Firestore.instance.collection('users').document(uid).collection('result1').document("res1").setData({
      'quizid': '11111',
      'result': '33',
    });
    return await Firestore.instance.collection('users').document(uid).setData({
      'name': name,
      'role' : role,
      'username': username,
    });
  }

  List<User> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return User(
        username: doc.data['username'] ?? '',
        name: doc.data['name'] ?? '',
        role: doc.data['role'] ?? '',
      );
    }).toList();
  }

  Stream<List<User>> get users {
    return mathCollection.snapshots()
    .map(_userListFromSnapshot);
  }

  Future<String> getRole(String un) async {
    var role;
    QuerySnapshot qs = await mathCollection.getDocuments();
    var list = qs.documents;
    list.forEach((r) {
      if (r.data['username'] == un) {
        role = r.data['role'];
      }
    });
    return role;
  }
}