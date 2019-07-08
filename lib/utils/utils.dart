/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';

class Utils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}
