/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'dart:math';

class TodosColor {
  static const kPrimaryColorCode = 0xffca3e47;
  static const kSecondaryColorCode = 0xff34465d;

  static TodosColor sharedInstance = TodosColor._();

  List<Color> storedColors;

  TodosColor._() {
    storedColors = List.generate(100, (pos) {
      return Color.fromARGB(0xff - pos * 10, Random().nextInt(255),
          Random().nextInt(255), Random().nextInt(255));
    });
  }

  Color leadingTaskColor(int pos) {
    switch (pos) {
      case 0:
        return Colors.red[900];
      case 1:
        return Colors.green[900];
      case 2:
        return Colors.blue[900];
    }

    if (pos < storedColors.length) {
      return storedColors[pos];
    }

    // default case when need more than 100 colors
    return Color.fromARGB(0xff - pos * 10, Random().nextInt(255),
        Random().nextInt(255), Random().nextInt(255));
  }
}
