import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

//methods that will interact wth firebas auth
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on Firebase user

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change using stream

  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser); //less verbose
  }
  //sign in anon

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //email and password sign-in

  //register with email and password

  //sign out

}
