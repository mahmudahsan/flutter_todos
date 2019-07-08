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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).backgroundColor,
              floating: true,
              actions: <Widget>[
                Text('hi'),
              ],
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
                                    margin: EdgeInsets.only(right: 10, top: 35),
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
                              child: TaskInput(),
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
                      return Todo();
                    case 1:
                      return SizedBox(
                        height: 30,
                      );
                    default:
                      return Done();
                  }
                },
                childCount: 3,
              ),
            ),
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          setState(() {});
//          print('Add Task');
//        },
//        child: Icon(
//          Icons.add,
//          color: Colors.white,
//        ),
//        backgroundColor: Color(0xffffca3e47),
//      ),
    );
  }
}
