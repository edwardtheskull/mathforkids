import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mathforkids/screens/Authenticate/user.dart';
import 'package:mathforkids/utils/Temp.dart';
import 'package:mathforkids/utils/Imports.dart';

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

  Future createQuiz(String name, Map<String, Map<String, String>> questions) async {
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
    addToCreatedQuizzes(name, (10000+num).toString());
    GlobQL.clear();
    return await Firestore.instance.collection('quiz').document((10000+num).toString()).setData({
      'code': (10000+num).toString(),
      'name': name,
    });
  }

  Future buildLearnList(String type) async {
    GlobQL.clear();
    var db = await Firestore.instance.collection('quiz').document('quizzes').collection(type).getDocuments();
    var docs = db.documents;
    GlobQL['Quizzes'] = new Map<String,String>();
    docs.forEach((element) {
      (GlobQL['Quizzes'])[element['code']] = element['name'];
    });
  }

  Future addToCreatedQuizzes(String name, String id) async {
    return await Firestore.instance.collection('users').document(useid).collection('created').document('quizzes').setData({
      id: name,
    }, merge : true);
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
    var db = await Firestore.instance.document('users/'+useid+'/results/'+quizzId+'/answers/specifics').get();
    GlobQL['Specifics'].clear();
    db.data.forEach((k, v) {
      (GlobQL['Specifics'])[k] = v;
    });
    GlobQL['Questions'].clear();
    String path = 'quizzes/';

    if (quizzId.contains('addi')) {
      path += 'addition/'+quizzId;
    } else if (quizzId.contains('subt')) {
      path += 'subtraction/'+quizzId;
    } else if (quizzId.contains('multi')) {
      path += 'multiplication/'+quizzId;
    } else if (quizzId.contains('divi')) {
      path += 'division/'+quizzId;
    } else {
      path = quizzId;
    }

    var db1 = await Firestore.instance.collection('quiz/'+path+'/questions').getDocuments();
    var m = db1.documents;

    m.forEach((element) {
      (GlobQL['Questions'])[element.documentID] = element.data['Question'];
    });
  }

  Future getPrevResults() async{
    var db = await Firestore.instance.collection('users').document(useid).collection('results').getDocuments();
    var res = db.documents;
    GlobQL.clear();
    GlobQL['Questions'] = new Map<String, String>();
    GlobQL['Specifics'] = new Map<String, String>();

    res.forEach((element) {
      GlobQL[element.documentID] = new Map<String, String>();
      (GlobQL[element.documentID])['Name'] = element.data['name'];
      (GlobQL[element.documentID])['Code'] = element.documentID;
      (GlobQL[element.documentID])['Max'] = element.data['max'];
      (GlobQL[element.documentID])['Result'] = element.data['result'];
    });
  }

  Future getCreatedQuizzes() async {
    GlobQL.clear();
    var db = await Firestore.instance.collection('users').document(useid).collection('created').document('quizzes').get();
    if (db.data == null) {
      return;
    }
    var decend = (b,a) => a.toString().compareTo(b.toString());
    var templist = db.data.keys.toList();
    templist.sort(decend);
    GlobQL['Quizzes'] = new Map<String, String>();
    templist.forEach((e) {
      GlobQL['Quizzes'][e] = db.data[e];
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