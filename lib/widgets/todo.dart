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
                height: 50,
              ),
              for (int i = 0; i < 2; ++i)
                getTaskItem('Sample Task adf asdfa sdf adsf ad adf adsf $i',
                    index: i, onTap: () {
                  print('Index $i');
                }),
            ],
          ),
        ),
        SharedWidget.getCardHeader(text: 'TO DO'),
      ],
    );
  }

  Widget getTaskItem(String text,
      {@required int index, @required Function onTap}) {
    final double height = 80.0;
    return Container(
        height: height,
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: onTap,
              child: Row(
                children: <Widget>[
                  Container(
                    height: height - 10,
                    width: 7,
                    decoration: BoxDecoration(
                      color: TodosColor.leadingTaskColor(index),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Text(
                        text,
                        overflow: TextOverflow.clip,
                        style: Theme.of(context).textTheme.title.copyWith(),
                      ),
                    ),
                  ),
                ],
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
