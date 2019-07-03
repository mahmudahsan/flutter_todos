/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      child: Container(
        padding: EdgeInsets.only(left: 15.0, top: 30.0),
        child: Text(
          'Good Morning',
          style: Theme.of(context)
              .textTheme
              .headline
              .copyWith(fontFamily: 'Lobster Two', fontSize: 30),
        ),
      ),
    );
  }
}
