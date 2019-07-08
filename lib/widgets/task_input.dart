/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'package:flutter_todos/widgets/shared.dart';

class TaskInput extends StatefulWidget {
  @override
  _TaskInputState createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 6),
              width: 40,
              child: Icon(
                Icons.add,
                color: Color(0xffca3e47),
                size: 30,
              ),
            ),
            Expanded(
              child: TextField(
                minLines: 1,
                maxLines: 3,
                decoration: InputDecoration(
                    hintText: 'What do you want to do?',
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
