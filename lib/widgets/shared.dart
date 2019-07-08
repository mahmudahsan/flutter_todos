/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'dart:math';

class SharedWidget {
  static Widget getCardHeader(
      {@required BuildContext context,
      @required String text,
      Color textColor = Colors.white,
      int backgroundColorCode = 0xffca3e47,
      double customFontSize}) {
    customFontSize ??= Theme.of(context).textTheme.title.fontSize;

    return Container(
      width: 85,
      alignment: AlignmentDirectional.center,
      margin: EdgeInsets.only(left: 32),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(backgroundColorCode),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: textColor,
          fontSize: customFontSize,
        ),
      ),
    );
  }
}

class TodosColor {
  static Color leadingTaskColor(int pos) {
    switch (pos) {
      case 0:
        return Colors.red[900];
      case 1:
        return Colors.green[900];
      case 2:
        return Colors.blue[900];
    }

    return Color.fromARGB(0xff - pos * 10, Random().nextInt(255),
        Random().nextInt(255), Random().nextInt(255));
  }
}
