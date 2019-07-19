/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'package:flutter_todos/widgets/header.dart';
import 'package:flutter_todos/constants.dart';
import 'package:flutter_todos/service/firebase_auth.dart';

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

    FirebaseAuthentication.instance.onAuthenticationChange((bool isLogin) {
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
      body: Card(
        margin: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 380,
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
              SizedBox(
                height: 10,
              ),
              getLine(),
              if (!isUserSignedIn) getSkip(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getLine() {
    return SizedBox(
      height: 0.5,
      width: double.infinity,
      child: Container(
        color: Colors.grey,
      ),
    );
  }

  Widget getSignedOut() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
        onPressed: () {
          FirebaseAuthentication.instance.signOut();
        },
        child: Text('Logout'),
      ),
    );
  }

  Widget getSignIn() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Synchronize and backup your data'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text('Facebook'),
              ),
              RaisedButton(
                onPressed: () async {
                  try {
                    Map<String, String> user = await FirebaseAuthentication
                        .instance
                        .signInWithGoogle();
                    if (user != null) {
                      print('User Name: ' + user['username']);
                      print('User uid: ' + user['uid']);
                    } else {
                      print('User not authenticated');
                    }
                  } catch (error) {
                    print(error);
                  }
                },
                child: Text('Google'),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Twitter'),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: ButtonTheme(
              minWidth: double.infinity,
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    child: Text('Create Account'),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text('Sign In'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSkip() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ButtonTheme(
        minWidth: double.infinity,
        child: RaisedButton(
          onPressed: () {
            if (widget.shouldPopOnSkip) {
              Navigator.pop(context);
            } else {
              print('I do not know what to do');
            }
          },
          child: Text('Skip'),
        ),
      ),
    );
  }
}
