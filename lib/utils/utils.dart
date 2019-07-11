/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:flutter_todos/constants.dart';

enum kMoreOptionsKeys {
  clearAll,
  moreApps,
  about,
  writeReview,
  followUs,
}

Map<int, String> kMoreOptionsMap = {
  kMoreOptionsKeys.clearAll.index: 'Clear Done',
  kMoreOptionsKeys.moreApps.index: 'More Apps',
  kMoreOptionsKeys.about.index: 'About',
  kMoreOptionsKeys.writeReview.index: 'Write a Review',
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

  static String showPlatformSpecificUrl({String iOSUrl, String androidUrl}) {
    if (Platform.isIOS) {
      return iOSUrl;
    } else if (Platform.isAndroid) {
      return androidUrl;
    }
  }
}
