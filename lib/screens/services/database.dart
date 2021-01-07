import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mathforkids/screens/Authenticate/user.dart';
import 'package:mathforkids/screens/Teacher/Temp.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/services/loggedinuser.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference mathCollection = Firestore.instance.collection('users');

  Future<bool> buildQuizFromDb(String code) async {
    var qui = await Firestore.instance.document('quiz/'+code).get();
    if (qui.data == null) {
      return false;
    }
    GlobQL.clear();
    GlobQL['info'] = new Map<String, String>();
    (GlobQL['info'])['Name'] = qui.data['name'];
    (GlobQL['info'])['Code'] = qui.data['code'];

    var db = await Firestore.instance.collection('quiz/'+code+'/questions').getDocuments();
    var m = db.documents;
    m.forEach((element) {
      GlobQL[element.documentID] = new Map<String, String>();
      element.data.forEach((key, value) {
        (GlobQL[element.documentID])[key] = value;
      });
    });
    return true;
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

  Future createQuestion(int num, String k, String v, int order) async {
    return await Firestore.instance.collection('quiz').document((10000+num).toString()).collection('questions').document('Q'+order.toString()).setData({
      k: v,
    }, merge : true);
  }

  Map<String, String> caster(dynamic d) {
    return (d as Map<String, String>);
  }

  //CreateQuiz
  Future addQuizNum() async {
    return await Firestore.instance.collection('quiz').document('quizzes').updateData({'num': FieldValue.increment(1)});
  }

  Future getQuizResults(String quizzId) async{
    var db = await Firestore.instance.document('users'+useid+'/results'+quizzId+'/answers/specifics').get();

    db.data.forEach((k, v) {
      (GlobQL['Specifics'])[k] = v;
    });

    var db1 = await Firestore.instance.collection('quiz/'+quizzId+'/questions').getDocuments();
    var m = db1.documents;

    m.forEach((element) {
      (GlobQL['Questions'])[element.documentID] = element.data['Question'];
    });
  }

  Future getPrevResults() async{
    var db = await Firestore.instance.collection('users').document(useid).collection('results').getDocuments();
    var res = db.documents;
    GlobQL.clear();

    res.forEach((element) {
      GlobQL[element.documentID] = new Map<String, String>();
      (GlobQL[element.documentID])['Name'] = element.data['name'];
      (GlobQL[element.documentID])['Code'] = element.documentID;
      (GlobQL[element.documentID])['Max'] = element.data['max'];
      (GlobQL[element.documentID])['Result'] = element.data['result'];
    });
  }

  Future saveResult(String max, String result, String quizzId, String name, Map<String, String> answers) async {
    print(answers.length);
    for (int i = 1; i <= answers.length; i++) {
      saveResultSpecifics(quizzId, 'Q'+i.toString(), answers['Q'+i.toString()]);
    }
    return Firestore.instance.collection('users').document(useid).collection('results').document(quizzId).setData({
      'max': max,
      'result': result,
      'name': name,
    });
  }

  Future saveResultSpecifics(String quizzId, String k, String v) async {
    return await Firestore.instance.collection('users').document(useid).collection('results').document(quizzId).collection('answers').document('specifics').setData({
      k: v,
    }, merge : true);
  }

  //user
  Future updateUserData(String name, String role, String username) async {
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
    DocumentSnapshot qs = await mathCollection.document(un).get();
    return qs.data['role'];
  }
}