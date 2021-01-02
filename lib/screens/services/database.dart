import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mathforkids/screens/Authenticate/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference mathCollection = Firestore.instance.collection('users');

  //quiz
  Future addQuizNum() async{
    return await Firestore.instance.collection('quiz').document('quizzes').updateData({'num': FieldValue.increment(1)});
  }

  Future createQuiz(String name, Map<String, Map<String, String>> questions) async{
    DocumentSnapshot db = await Firestore.instance.document('quiz/quizzes').get();
    var num = db.data['num'];
    var order = 1;
    addQuizNum();

    questions.forEach((k, v) {
      if(v['Type'] == 'Written answer'){
        v.forEach((key, value) {
          if(key != 'Type'){
            createWritten(num, v, key, order);
          }
        });
      }
      else if(v['Type'] == 'Multiple choice'){
        var seq = 1;
        createMultipleQuestion(num, k, order);
        v.forEach((key, value) {
          if(key != 'Type'){
            createMultiple(num, v, key, order, seq++);
          }
        });
      }
      else{
        var seq = 1;
        createPairQuestion(num, k, order);
        v.forEach((key, value) {
          if(key != 'Type'){
            createPair(num, v, key, order, seq++);
          }
        });
      }
      order++;
    });
    return await Firestore.instance.collection('quiz').document((10000+num).toString()).setData({
      'code': (10000+num).toString(),
      'name': name,
    });
  }

  Future createWritten(int num, Map map, String key, int order) async{
    return await Firestore.instance.collection('quiz').document((10000+num).toString()).collection('questions').document('question'+order.toString()).setData({
      'question': key,
      'correct': map[key],
      'type': 'Written',
    });
  }

  Future createMultipleQuestion(int num, String question, int order) async {
    return await Firestore.instance.collection('quiz').document((10000+num).toString()).collection('questions').document('question'+order.toString()).setData({
      'question': question,
      'type': 'Multiple',
    });
  }

  Future createMultiple(int num, Map map, String key, int order, int seq) async{
    return await Firestore.instance.collection('quiz').document((10000+num).toString()).collection('questions').document('question'+order.toString()).collection('multiples').document('answer'+seq.toString()).setData({
      'answer': key,
      'correct': map[key],
    });
  }

  Future createPairQuestion(int num, String question, int order) async{
    return await Firestore.instance.collection('quiz').document((10000+num).toString()).collection('questions').document('question'+order.toString()).setData({
      'question': question,
      'type': 'Pair',
    });
  }

  Future createPair(int num, Map map, String key, int order, int seq) async{
    return await Firestore.instance.collection('quiz').document((10000+num).toString()).collection('questions').document('question'+order.toString()).collection('pairs').document('pair'+seq.toString()).setData({
      'input': key,
      'input1': map[key],
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