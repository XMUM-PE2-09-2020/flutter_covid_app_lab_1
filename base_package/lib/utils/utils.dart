import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class Utils {
  ///widget顶级NavigatorState
  static GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  

  static List<TextInputFormatter> getNumberFormatters() {
    var formatters = <TextInputFormatter>[];
    formatters.add(WhitelistingTextInputFormatter.digitsOnly);
    return formatters;
  }

  static String getTime(int timeSamp) {
    var dataFormart = new DateFormat("yyyy-MM-dd");
    var dateTime = new DateTime.fromMillisecondsSinceEpoch(timeSamp);
    String formartResult = dataFormart.format(dateTime);
    return formartResult;
  }

  static String chatTime(String time) {
    return _dateFormat(time);
  }

  static String symInfoTime(String time) {
    return _dateFormat(time, format: 'MM月dd日 HH:MM');
  }

  static String _dateFormat(String time, {String format = 'yyyy-MM-dd'}) {
    DateTime date = DateTime.tryParse(time ?? '');
    if (date == null) {
      return '';
    }
    DateFormat dataFormart = new DateFormat(format);
    return dataFormart.format(date);
  }

  static Function debounce(
    Function func, [
    Duration delay = const Duration(milliseconds: 300),
  ]) {
    Timer timer;
    Function target = () {
      if (timer?.isActive ?? false) {
        timer?.cancel();
      }
      timer = Timer(delay, () {
        func?.call();
      });
    };
    return target;
  }

  /// 返回对应的Rect区域...
  static Rect getRectFromKey(BuildContext currentContext) {
    var object = currentContext?.findRenderObject();
    var translation = object?.getTransformTo(null)?.getTranslation();
    var size = object?.semanticBounds?.size;

    if (translation != null && size != null) {
      return new Rect.fromLTWH(
          translation.x, translation.y, size.width, size.height);
    } else {
      return null;
    }
  }

  static String toTagString(List<String> list) {
    String s = "";
    list?.forEach((element) {
      int index = list.indexOf(element);
      if (index == 0) {
        s += "$element";
      } else {
        s += ",$element";
      }
    });
    print("tagList: $s");
    return s;
  }
}
