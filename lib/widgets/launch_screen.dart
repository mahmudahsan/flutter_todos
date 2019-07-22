/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'package:flutter_todos/widgets/header.dart';
import 'package:flutter_todos/constants.dart';
import 'package:flutter_todos/utils/colors.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_todos/service/authentication.dart' as FirebaseAuth;

class LaunchScreen extends StatefulWidget {
  bool shouldPopOnSkip;

  LaunchScreen({this.shouldPopOnSkip = true});

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  bool isUserSignedIn = false;

  @override
  void initState() {
    super.initState();

    FirebaseAuth.onAuthenticationChange((bool isLogin) {
      if (isLogin) {
        setState(() {
          isUserSignedIn = true;
        });
      } else {
        setState(() {
          isUserSignedIn = false;
        });
      }
    });

    //MyFirebase().getAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Card(
          color: Colors.white,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Header(
                    msg: kAppTitle,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                getLine(),
                if (isUserSignedIn) getSignedOut(),
                if (!isUserSignedIn) getSignIn(),
                getLine(marginTop: 15, marginBottom: 10),
                if (!isUserSignedIn) getManualSignIn(),
                if (!isUserSignedIn) getLine(marginTop: 10),
                if (isUserSignedIn) getSynchronizedMessage(),
                if (isUserSignedIn)
                  getSkip(context, 'Go Back',
                      Color(TodosColor.kSecondaryColorCode)),
                if (!isUserSignedIn)
                  getSkip(context, 'Skip', Color(TodosColor.kPrimaryColorCode)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getLine({double marginTop = 0, double marginBottom = 0}) {
    return Container(
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      child: SizedBox(
        height: 0.5,
        width: double.infinity,
        child: Container(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget getSignedOut() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
        onPressed: () {
          FirebaseAuth.signOut();
        },
        child: Text('Logout'),
      ),
    );
  }

  Widget getSynchronizedMessage() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        'Data will be synchronized and backup automatically.',
        style: TextStyle(fontSize: Theme.of(context).textTheme.title.fontSize),
      ),
    );
  }

  Widget getSignIn() {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'Synchronize and backup your data',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FacebookSignInButton(
                onPressed: facebookSignIn,
              ),
              SizedBox(
                height: 5,
              ),
              GoogleSignInButton(
                onPressed: googleSignIn,
                darkMode: true, // default: false
              ),
              SizedBox(
                height: 5,
              ),
              TwitterSignInButton(
                onPressed: twitterSignIn,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getManualSignIn() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: ButtonTheme(
        minWidth: double.infinity,
        child: Column(
          children: <Widget>[
            getButton(context, title: 'Create Account', onPress: () {}),
            getButton(context, title: 'Sign In', onPress: () {}),
          ],
        ),
      ),
    );
  }

  Widget getSkip(BuildContext context, String title, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ButtonTheme(
        minWidth: double.infinity,
        child: getButton(context, title: title, color: color, onPress: () {
          if (widget.shouldPopOnSkip) {
            Navigator.pop(context);
          } else {
            print('I do not know what to do');
          }
        }),
      ),
    );
  }

  Widget getButton(BuildContext context,
      {String title,
      @required Function onPress,
      Color color = Colors.blueAccent}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 50,
      child: RaisedButton(
        onPressed: onPress,
        color: color,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: Theme.of(context).textTheme.title.fontSize),
        ),
      ),
    );
  }

  void googleSignIn() async {
    try {
      Map<String, String> user = await FirebaseAuth.signInWithGoogle();
      if (user != null) {
        print('User Name: ' + user['username']);
        print('User uid: ' + user['uid']);
      } else {
        print('User not authenticated');
      }
    } catch (error) {
      print(error);
    }
  }

  void facebookSignIn() async {
    try {
      Map<String, String> user = await FirebaseAuth.signInWithFacebook();
      if (user != null) {
        print('User Name: ' + user['username']);
        print('User uid: ' + user['uid']);
      } else {
        print('User not authenticated');
      }
    } catch (error) {
      print(error);
    }
  }

  void twitterSignIn() async {
    try {
      Map<String, String> user = await FirebaseAuth.signInWithTwitter();
      if (user != null) {
        print('User Name: ' + user['username']);
        print('User uid: ' + user['uid']);
      } else {
        print('User not authenticated');
      }
    } catch (error) {
      print(error);
    }
  }
}
