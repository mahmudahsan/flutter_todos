/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */

import 'package:flutter/material.dart';
import 'package:flutter_todos/widgets/shared.dart';
import 'package:flutter_todos/model/model.dart' as Model;
import 'package:flutter_todos/utils/colors.dart';

class Done extends StatefulWidget {
  final Function onTap;
  final Function onDeleteTask;
  final List<Model.Todo> dones;

  Done({@required this.dones, this.onTap, this.onDeleteTask});

  @override
  _DoneState createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: Color(0xffbcbab8),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              if (widget.dones == null || widget.dones.length == 0)
                Container(
                  height: 10,
                ),
              if (widget.dones != null)
                for (int i = widget.dones.length - 1; i >= 0; --i)
                  getTaskItem(
                    widget.dones[i].title,
                    index: i,
                    onTap: () {
                      widget.onTap(pos: i);
                    },
                  ),
            ],
          ),
        ),
        SharedWidget.getCardHeader(
            context: context,
            text: 'DONE',
            backgroundColorCode: TodosColor.kSecondaryColorCode,
            customFontSize: 16),
      ],
    );
  }

  Widget getTaskItem(String text,
      {@required int index, @required Function onTap}) {
    final double height = 50.0;
    return Container(
        child: Column(
      children: <Widget>[
        Dismissible(
          key: Key(text + '$index'),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            widget.onDeleteTask(todo: widget.dones[index]);
          },
          background: SharedWidget.getOnDismissDeleteBackground(),
          child: InkWell(
            onTap: onTap,
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    height: height,
                    child: Icon(
                      Icons.check,
                      color: Colors.grey[300],
                    ),
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
                              color: Colors.grey[300],
                              decoration: TextDecoration.lineThrough,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 0.5,
          child: Container(
            color: Colors.white54,
          ),
        ),
      ],
    ));
  }
}
