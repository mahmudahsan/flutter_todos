/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'package:flutter_todos/widgets/shared.dart';
import 'package:flutter_todos/model/model.dart' as Model;
import 'package:flutter_todos/utils/colors.dart';

class Todo extends StatefulWidget {
  final List<Model.Todo> todos;

  Todo({@required this.todos});

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
                height: 50,
              ),
              for (int i = 0; i < widget.todos.length; ++i)
                getTaskItem(
                  widget.todos[i].text,
                  index: i,
                  onTap: () {
                    print('Index $i');
                  },
                ),
            ],
          ),
        ),
        SharedWidget.getCardHeader(
            context: context, text: 'TO DO', customFontSize: 16),
      ],
    );
  }

  Widget getTaskItem(String text,
      {@required int index, @required Function onTap}) {
    final double height = 50.0;
    return Container(
        child: Column(
      children: <Widget>[
        InkWell(
          onTap: onTap,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 5),
                  height: height,
                  width: 7,
                  decoration: BoxDecoration(
                    color: TodosColor.sharedInstance.leadingTaskColor(index),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 10, top: 10, right: 20, bottom: 10),
                    child: Text(
                      text,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.title.copyWith(
                            color: Color(0xff373640),
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 0.5,
          child: Container(
            color: Colors.grey,
          ),
        ),
      ],
    ));
  }
}
