import 'package:firebase_auth/firebase_auth.dart';
class AuthenticationServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Registration with email and password
  Future createNewUser(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (e) {
      print(e.string());
    }
  }

  //Login
  Future loginUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.string());
    }
  }

  //Log Out
  Future logOut()async{
    try {
      return _auth.signOut();
    } catch (e) {
      print(e.string());
      return null;
    }
  }
}
