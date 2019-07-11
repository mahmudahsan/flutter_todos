/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'package:flutter_todos/utils/colors.dart';

class SharedWidget {
  static Widget getCardHeader(
      {@required BuildContext context,
      @required String text,
      Color textColor = Colors.white,
      int backgroundColorCode = TodosColor.kPrimaryColorCode,
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

  static Widget getOnDismissDeleteBackground() {
    return Container(
      alignment: Alignment.centerRight,
      color: Colors.red[300],
      padding: EdgeInsets.only(right: 10),
      child: Text(
        'DELETE',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
