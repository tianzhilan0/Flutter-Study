import 'package:blocstudy/common/common.dart';
import 'package:blocstudy/res/index.dart';
import 'package:blocstudy/utils/ObjectUtil.dart';
import 'package:blocstudy/utils/RegexUtil.dart';
import 'package:blocstudy/utils/TimelineUtil.dart';
import 'package:flutter/material.dart';


class Utils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  // static String getPinyin(String str) {
  //   return PinyinHelper.getShortPinyin(str).substring(0, 1).toUpperCase();
  // }

  // static Color getCircleBg(String str) {
  //   String pinyin = getPinyin(str);
  //   return getCircleAvatarBg(pinyin);
  // }

  // static Color getCircleAvatarBg(String key) {
  //   return circleAvatarMap[key];
  // }

  // static Color getChipBgColor(String name) {
  //   String pinyin = PinyinHelper.getFirstWordPinyin(name);
  //   pinyin = pinyin.substring(0, 1).toUpperCase();
  //   return nameToColor(pinyin);
  // }

  static Color nameToColor(String name) {
    // assert(name.length > 1);
    final int hash = name.hashCode & 0xffff;
    final double hue = (360.0 * hash / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
  }

  static String getTimeLine(BuildContext context, int timeMillis) {
//    LogUtil.e("countryCode: " +
//        Localizations.localeOf(context).countryCode +
//        "   languageCode: " +
//        Localizations.localeOf(context).languageCode);
    return TimelineUtil.format(timeMillis,
        locale: Localizations.localeOf(context).languageCode,
        dayFormat: DayFormat.Common);
  }

  static double getTitleFontSize(String title) {
    if (ObjectUtil.isEmpty(title) || title.length < 10) {
      return 18.0;
    }
    int count = 0;
    List<String> list = title.split("");
    for (int i = 0, length = list.length; i < length; i++) {
      String ss = list[i];
      if (RegexUtil.isZh(ss)) {
        count++;
      }
    }

    return (count >= 10 || title.length > 16) ? 14.0 : 18.0;
  }

  /// 0 不升级
  /// 1 升级
  /// > x 强升
  static int getUpdateStatus(String version, {String local}) {
    if (ObjectUtil.isEmpty(version)) return 0;
    String locVersion = local ?? AppConfig.version;
    int remote = int.tryParse(version.replaceAll('.', ''));
    int loc = int.tryParse(locVersion.replaceAll('.', ''));
    if (remote <= loc) {
      return 0;
    } else {
      return remote - loc;
    }
  }

  static bool isNeedLogin(String pageId) {
    if (pageId == Ids.titleCollection) {
      return true;
    }
    return false;
  }

  static int getLoadStatus(bool hasError, List data) {
    if (hasError) return LoadStatus.fail;
    if (data == null) {
      return LoadStatus.loading;
    } else if (data.isEmpty) {
      return LoadStatus.empty;
    } else {
      return LoadStatus.success;
    }
  }
}
