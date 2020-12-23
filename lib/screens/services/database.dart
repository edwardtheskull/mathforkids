import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mathforkids/screens/Authenticate/user.dart';
import 'package:mathforkids/screens/Authenticate/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference mathCollection = Firestore.instance.collection('users');

  Future updateUserData(String name, String role) async{
    return await mathCollection.document(uid).setData({
      'name': name,
      'role' : role,
    });
  }

  List<User> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return User(
        name: doc.data['name'] ?? '',
        role: doc.data['role'] ?? '',
      );
    }).toList();
  }

  Stream<List<User>> get users {
    return mathCollection.snapshots()
    .map(_userListFromSnapshot);
  }
}