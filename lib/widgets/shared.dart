/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';

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
