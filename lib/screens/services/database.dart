import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mathforkids/screens/Authenticate/user.dart';
import 'package:mathforkids/screens/Teacher/Temp.dart';
import 'package:mathforkids/utils/Imports.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference mathCollection = Firestore.instance.collection('users');

  Future buildQuizFromDb(String code) async{
    GlobQL.clear();
    var db = await Firestore.instance.collection('quiz/'+code+'/questions').getDocuments();
    //GlobQL['Name'] = db.data['name'];
    //GlobQL['Code'] = db.data['code'];

    var m = db.documents;

    m.forEach((element) {
      GlobQL[element.documentID] = new Map<String, String>();
      element.data.forEach((key, value) {
        (GlobQL[element.documentID])[key] = value;
      });
    });

  }

  Future createQuiz(String name, Map<String, Map<String, String>> questions) async{
    DocumentSnapshot db = await Firestore.instance.document('quiz/quizzes').get();
    var num = db.data['num'];
    var order = 1;
    addQuizNum();
    questions.forEach((k, v) {
      v.forEach((key, value) {
        createQuestion(num, key.toString(), value.toString(), order);
      });
      order++;
    });
    GlobQL.clear();
    return await Firestore.instance.collection('quiz').document((10000+num).toString()).setData({
      'code': (10000+num).toString(),
      'name': name,
    });
  }

  Future createQuestion(int num, String k, String v, int order) async{
    return await Firestore.instance.collection('quiz').document((10000+num).toString()).collection('questions').document('Q'+order.toString()).setData({
      k: v,
    }, merge : true);
  }

  Map<String, String> caster(dynamic d){
    return (d as Map<String, String>);
  }

  //CreateQuiz
  Future addQuizNum() async{
    return await Firestore.instance.collection('quiz').document('quizzes').updateData({'num': FieldValue.increment(1)});
  }

  Future saveResult(String max, String result, String quizzId, Map<String, String> answers) async {
    return Firestore.instance.collection('users').document(uid).collection('results').document(quizzId).setData({
      'max': max,
      'result': result,
    });
  }

  //user
  Future updateUserData(String name, String role, String username) async{
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