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
              getTaskItem(
                'Sample Task adf asdfa sdf adsf',
                index: 0,
                onTap: () {
                  print('Index 0');
                },
              ),
              getTaskItem(
                'Features slightly rounded corners and a drop shadow, giving it a 3D effect. ',
                index: 1,
                onTap: () {
                  print('Index 1');
                },
              ),
              getTaskItem(
                'property allows you to control the drop shadow effect. Setting the elevation to 24, for example, visually lifts the Card further from the surface and causes the shadow to become more dispersed. For a list of supported elevation values, see Elevation in the Material guidelines. Specifying an unsupported value disables the drop shadow entirely.',
                index: 2,
                onTap: () {
                  print('Index 2');
                },
              ),
            ],
          ),
        ),
        SharedWidget.getCardHeader(text: 'TO DO'),
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
                    color: TodosColor.leadingTaskColor(index),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
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
