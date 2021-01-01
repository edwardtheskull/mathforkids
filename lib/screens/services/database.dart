import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mathforkids/screens/Authenticate/user.dart';
import 'package:mathforkids/screens/Authenticate/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference mathCollection = Firestore.instance.collection('users');

  Future updateUserData(String name, String role, String username) async{
    resultColl();
    return await Firestore.instance.collection('users').document(uid).setData({
      'name': name,
      'role' : role,
      'username': username,
    });   Firestore.instance.collection('users').document(uid).collection('result1').document("res1").setData({});
  }
  Future resultColl() async{
    return await Firestore.instance.collection('users').document(uid).collection('result1').document("res1").setData({
        'quizid': '331562615',
        'result': '33',
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

