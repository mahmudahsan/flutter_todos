/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'package:flutter_todos/widgets/shared.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              for (int i = 0; i < 3; ++i)
                Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.donut_large),
                      title: Text('Develop a new todo app'),
                    ),
                    Divider(),
                  ],
                ),
            ],
          ),
        ),
        Shared().getCardHeader(text: 'TO DO'),
      ],
    );
  }
}
