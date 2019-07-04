/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */

import 'package:flutter/material.dart';
import 'package:flutter_todos/widgets/shared.dart';

class Done extends StatefulWidget {
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
        SharedWidget.getCardHeader(
            text: 'DONE', backgroundColorCode: 0xff34465d),
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
                  margin: EdgeInsets.only(top: 5, left: 5),
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
