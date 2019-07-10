/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';

enum kMoreOptionsKeys {
  clearAll,
  moreApps,
  about,
  share,
  writeReview,
  sendUsEmail,
  likeUs,
  followUs,
}

Map<int, String> kMoreOptionsMap = {
  kMoreOptionsKeys.clearAll.index: 'Clear All Done',
  kMoreOptionsKeys.moreApps.index: 'More Apps',
  kMoreOptionsKeys.about.index: 'About',
  kMoreOptionsKeys.share.index: 'Share',
  kMoreOptionsKeys.writeReview.index: 'Write a Review',
  kMoreOptionsKeys.sendUsEmail.index: 'Help Me',
  kMoreOptionsKeys.likeUs.index: 'Like Us',
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
}
