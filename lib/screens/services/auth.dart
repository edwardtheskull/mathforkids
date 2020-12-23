import 'package:mathforkids/screens/Authenticate/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mathforkids/screens/services/database.dart';


class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //crete user obj from FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged
    .map(_userFromFirebaseUser);
  }


  //sign in
  Future signIn() async{
    try {
      AuthResult res = await _auth.signInWithEmailAndPassword();
      FirebaseUser user = res.user;
      print(user);
      return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email and pwd
  Future signInWithEmailAndPassword(String username, String password) async{
    try {
      AuthResult res = await _auth.signInWithEmailAndPassword(email: username, password: password);
      FirebaseUser user = res.user;
      print(user);
      return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }

  //register with email and pwd
  Future registerWithEmailAndPassword(String role, String name, String username, String password) async{
    try{
      AuthResult res = await _auth.createUserWithEmailAndPassword(email: username, password: password);
      FirebaseUser user = res.user;

      await DatabaseService(uid: user.uid).updateUserData(name, role);
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //forgot password
  Future forgotPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async{
    try {
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}