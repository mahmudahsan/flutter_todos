/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */

import 'package:flutter/material.dart';
import 'package:flutter_todos/constants.dart';
import 'package:flutter_todos/widgets/header.dart';
import 'package:flutter_todos/widgets/todo.dart';
import 'package:flutter_todos/widgets/done.dart';

void main() => runApp(TodosApp());

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      home: Scaffold(
        backgroundColor: Color(0xfffff5eb),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Header(),
              SizedBox(
                height: 50,
              ),
              Todo(),
              SizedBox(
                height: 50,
              ),
              Done(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Add Task');
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Color(0xffffca3e47),
        ),
      ),
    );
  }
}
