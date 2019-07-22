/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

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
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

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

//Future<Map<String, String>> signInWithFacebook() async {
//  final AuthCredential credential = FacebookAuthProvider.getCredential(
//    accessToken: _tokenController.text,
//  );
//
//  final FirebaseUser user = await _auth.signInWithCredential(credential);
//  assert(user.email != null);
//  assert(user.displayName != null);
//  assert(!user.isAnonymous);
//  assert(await user.getIdToken() != null);
//
//  final FirebaseUser currentUser = await _auth.currentUser();
//  assert(user.uid == currentUser.uid);
//  setState(() {
//    if (user != null) {
//      _message = 'Successfully signed in with Facebook. ' + user.uid;
//    } else {
//      _message = 'Failed to sign in with Facebook. ';
//    }
//  });
//}
