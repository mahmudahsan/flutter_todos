/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'package:flutter_todos/widgets/header.dart';
import 'package:flutter_todos/constants.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Card(
        margin: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 500,
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
                height: 50,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: ButtonTheme(
                        minWidth: double.infinity,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text('Offline Only'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text('Sync and backup'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {},
                          child: Text('Facebook'),
                        ),
                        RaisedButton(
                          onPressed: () {},
                          child: Text('Google'),
                        ),
                        RaisedButton(
                          onPressed: () {},
                          child: Text('Twitter'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
