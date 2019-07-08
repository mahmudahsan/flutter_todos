/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */

import 'package:flutter/material.dart';
import 'package:flutter_todos/constants.dart';
import 'package:flutter_todos/widgets/header.dart';
import 'package:flutter_todos/widgets/task_input.dart';
import 'package:flutter_todos/widgets/todo.dart';
import 'package:flutter_todos/widgets/done.dart';
import 'package:flutter_todos/model/model.dart' as Model;
import 'package:flutter_todos/utils/utils.dart';

void main() => runApp(TodosApp());

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        backgroundColor: Color(0xfffff5eb),
      ),
      title: kAppTitle,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String welcomeMsg = 'Good Morning';
  List<Model.Todo> todos;
  List<Model.Todo> dones;

  @override
  void initState() {
    super.initState();
    getTodosAndDones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            Utils.hideKeyboard(context);
          },
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Theme.of(context).backgroundColor,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Header(
                                      msg: welcomeMsg,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: 10, top: 35),
                                      width: 30,
                                      child: GestureDetector(
                                        onTap: () {
                                          print('More Settings Clicked');
                                        },
                                        child: Icon(
                                          Icons.more_vert,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: TaskInput(
                                  onSubmitted: addTaskInTodo,
                                ), // Add Todos
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                expandedHeight: 180,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    switch (index) {
                      case 0:
                        return Todo(
                          todos: todos,
                          onTap: markTodoAsDone,
                        ); // Active todos
                      case 1:
                        return SizedBox(
                          height: 30,
                        );
                      default:
                        return Done(
                          dones: dones,
                          onTap: markDoneAsTodo,
                        ); // Done todos
                    }
                  },
                  childCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getTodosAndDones() {
    todos = Model.Model.sharedInstance.getTodos();
    dones = Model.Model.sharedInstance.getDones();
  }

  void addTaskInTodo({@required TextEditingController controller}) {
    final inputText = controller.text.trim();

    if (inputText.length > 0) {
      // Add todos
      setState(() {
        Model.Todo todo = Model.Todo(
          id: todos.length,
          text: inputText,
          status: 0,
          created: DateTime.now(),
        );
        Model.Model.sharedInstance.addTodo(todo);

        getTodosAndDones();
      });
    }

    controller.text = '';
  }

  void markTodoAsDone({@required int pos}) {
    setState(() {
      Model.Model.sharedInstance.markTodoAsDone(pos);
      getTodosAndDones();
    });
  }

  void markDoneAsTodo({@required int pos}) {
    setState(() {
      Model.Model.sharedInstance.markDoneAsTodo(pos);
      getTodosAndDones();
    });
  }
}
