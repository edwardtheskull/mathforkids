import 'package:mathforkids/screens/Authenticate/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //crete user obj from FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(username: user.uid) : null;
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
      return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }
}