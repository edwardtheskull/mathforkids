import 'package:cloud_firestore/cloud_firestore.dart';

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

  Stream<QuerySnapshot> get users {
    return mathCollection.snapshots();
  }
}