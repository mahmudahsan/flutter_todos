/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_todos/service/twitter_config.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';

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

Future<Map<String, String>> signInWithFacebook() async {
  String facebookToken = await getTokenForFacebook();
  print('Facebook Token: ' + facebookToken);

  final AuthCredential credential = FacebookAuthProvider.getCredential(
    accessToken: facebookToken,
  );

  final FirebaseUser user = await _auth.signInWithCredential(credential);
  assert(user.email != null);
  assert(user.displayName != null);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  if (user != null) {
    return {'username': '', 'uid': user.uid};
  }

  return null;
}

Future<String> getTokenForFacebook() async {
  final facebookLogin = FacebookLogin();
  final result = await facebookLogin.logInWithReadPermissions(['email']);

  switch (result.status) {
    case FacebookLoginStatus.loggedIn:
      return result.accessToken.token;
    case FacebookLoginStatus.cancelledByUser:
      print('User Cancelled Login Process');
      break;
    case FacebookLoginStatus.error:
      print(result.errorMessage);
      break;
  }

  return null;
}

Future<Map<String, String>> signInWithTwitter() async {
  final Map<String, String> twitterAuth = await getTokenAndSecretForTwitter();

  final AuthCredential credential = TwitterAuthProvider.getCredential(
      authToken: twitterAuth['token'], authTokenSecret: twitterAuth['secret']);
  final FirebaseUser user = await _auth.signInWithCredential(credential);

  assert(user.email != null);
  assert(user.displayName != null);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  if (user != null) {
    return {'username': '', 'uid': user.uid};
  }

  return null;
}

Future<Map<String, String>> getTokenAndSecretForTwitter() async {
  final twitterLogin = new TwitterLogin(
    consumerKey: kTwitterConsumerKey,
    consumerSecret: kTwitterSecretKey,
  );

  final TwitterLoginResult result = await twitterLogin.authorize();

  switch (result.status) {
    case TwitterLoginStatus.loggedIn:
      var session = result.session;
      return {'token': session.token, 'secret': session.secret};
    case TwitterLoginStatus.cancelledByUser:
      print('User Cancelled Login Process');
      break;
    case TwitterLoginStatus.error:
      print(result.errorMessage);
      break;
  }

  return null;
}
