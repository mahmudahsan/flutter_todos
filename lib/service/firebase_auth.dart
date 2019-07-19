/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class FirebaseAuthentication {
  static final FirebaseAuthentication instance = FirebaseAuthentication._();

  FirebaseAuthentication._();

  Future<bool> isUserSignedIn() async {
    final FirebaseUser currentUser = await _auth.currentUser();
    return currentUser != null;
  }

  void signOut() {
    try {
      _auth.signOut();
    } catch (error) {
      print(error);
    }
  }

  void onAuthenticationChange(Function isLogin) {
    _auth.onAuthStateChanged.listen((FirebaseUser user) {
      if (user != null) {
        isLogin(true);
      } else {
        isLogin(false);
      }
    });
  }

  Future<Map<String, String>> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);

    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    if (user != null) {
      return {'username': user.displayName, 'uid': user.uid};
    }
    return null;
  }
}
