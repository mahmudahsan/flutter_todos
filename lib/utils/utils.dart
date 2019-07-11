/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:flutter_todos/utils/colors.dart';

enum kMoreOptionsKeys {
  clearAll,
  moreApps,
  about,
  writeReview,
  shareApp,
  followUs,
}

Map<int, String> kMoreOptionsMap = {
  kMoreOptionsKeys.clearAll.index: 'Clear Done',
  kMoreOptionsKeys.moreApps.index: 'More Apps',
  kMoreOptionsKeys.about.index: 'About',
  kMoreOptionsKeys.writeReview.index: 'Write a Review',
  kMoreOptionsKeys.shareApp.index: 'Share',
  kMoreOptionsKeys.followUs.index: 'Follow Us',
};

class Utils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  static String getWelcomeMessage() {
    final hour = DateTime.now().hour;
    String msg;

    if (hour < 12) {
      msg = 'Good Morning';
    } else if (hour < 18) {
      msg = 'Good Afternoon';
    } else {
      msg = 'Good Evening';
    }

    return msg;
  }

  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  static String getPlatformSpecificUrl({String iOSUrl, String androidUrl}) {
    if (Platform.isIOS) {
      return iOSUrl;
    } else if (Platform.isAndroid) {
      return androidUrl;
    }
  }

  static void showCustomDialog(BuildContext context,
      {String title,
      String msg,
      String noBtnTitle: 'Close',
      Function onConfirm,
      String confirmBtnTitle: 'Yes'}) {
    final dialog = AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: <Widget>[
        if (onConfirm != null)
          RaisedButton(
            color: Color(TodosColor.kPrimaryColorCode),
            onPressed: () {
              onConfirm();
              Navigator.pop(context);
            },
            child: Text(
              confirmBtnTitle,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        RaisedButton(
          color: Color(TodosColor.kSecondaryColorCode),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            noBtnTitle,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (x) => dialog);
  }
}
