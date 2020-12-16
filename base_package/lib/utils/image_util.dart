import 'package:cached_network_image/cached_network_image.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:base_package/uikit/common_widget.dart';

class ImageUtils {
  static String rootUrl = "assest/images/";

  static String scan = '${rootUrl}scan.png';
  static String search = '${rootUrl}search.png';
  static String iconRailWaySmall = '${rootUrl}icon_railway_big.png';
  static String iconRailWayBig = '${rootUrl}icon_railway_small.png';
  static String iconNote = '${rootUrl}note.png';
  static String iconSuona = '${rootUrl}suona.png';
  static String iconReimbursement = '${rootUrl}reimbursement.png';
  static String iconMoney = '${rootUrl}money.png';
  static String iconCommon = '${rootUrl}common.png';
  static String didi = '${rootUrl}didi.png';
  static String qq = '${rootUrl}qq.png';
  static String railway = '${rootUrl}railway.png';
  static String weixin = '${rootUrl}weixin.png';
  static String xinlang = '${rootUrl}xinlang.png';
  static String icon_work_bg = '${rootUrl}icon_work_bg.png';
  static String data1 = '${rootUrl}data1.png';
  static String data2 = '${rootUrl}data2.png';
  static String data3 = '${rootUrl}data3.png';
  static String data4 = '${rootUrl}data4.png';
  static String data5 = '${rootUrl}data5.png';
  static String data6 = '${rootUrl}data6.png';
  static String data7 = '${rootUrl}data7.png';
  static String data8 = '${rootUrl}data8.png';
  static String data9 = '${rootUrl}data9.png';
  static String data10 = '${rootUrl}data10.png';
  static String data11 = '${rootUrl}data11.png';
  static String data12 = '${rootUrl}data12.png';
  static String data13 = '${rootUrl}data13.png';
  static String data14 = '${rootUrl}data14.png';
  static String data15 = '${rootUrl}data15.png';

  static Image newImage(String res,
      {double scale,
      Color color,
      BlendMode colorBlendMode,
      Key key,
      Rect centerSlice,
      BoxFit fit}) {
    return Image.asset(res,
        key: key,
        fit: fit,
        color: color,
        colorBlendMode: colorBlendMode,
        scale: scale ?? 3,
        centerSlice: centerSlice);
  }

  static Image newNetImage(String res,
      {double scale = 2.6,
      BoxFit fit,
      bool providerImg = false,
      String loadingIcon}) {
    if (providerImg) {
      return Image(
          fit: fit,
          image: NetworkImage(res, scale: scale),
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Image.asset(loadingIcon, fit: fit, scale: scale);
          });
    }

    return Image.network(
      res,
      fit: fit,
      scale: scale,
    );
  }

  static DecorationImage newNetDecorationImageProvider(String res,
      {double scale = 2.6, BoxFit fit}) {
    return DecorationImage(image: NetworkImage(res, scale: scale), fit: fit);
  }

  static Image tip() {
    return Image.asset(
      "lib/asset/images/invite_tip.png",
      width: 178,
    );
  }

  static Image lineLong() {
    return Image.asset(
      "lib/asset/images/invite_line_long.png",
      width: 28,
    );
  }

  static Image lineShort() {
    return Image.asset(
      "lib/asset/images/invite_line_short.png",
      width: 20,
    );
  }

  static Image errorImage({double width, double height}) {
    return Image.asset(
      "assest/images/personal_logo.png",
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }

  static Widget cachedNetworImg(String imgUrl,
      {String placeholder, BorderRadiusGeometry borderRadius}) {
    return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(0)),
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          placeholder: (context, url) => placeholder == null
              ? errorImage()
              : Image.asset(placeholder, fit: BoxFit.cover),
          errorWidget: placeholder == null
              ? (context, url, error) => errorImage()
              : (context, url, error) =>
                  Image.asset(placeholder, fit: BoxFit.cover),
          fit: BoxFit.cover,
        ));
  }

  static Widget cachedImg(String imgUrl,
      {double height,
      double width,
      Widget placeholder,
      Widget error,
      double radius = 0}) {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: SizedBox(
          height: height,
          width: width,
          child: CachedNetworkImage(
            imageUrl: imgUrl ?? '',
            placeholder: (context, url) => placeholder == null
                ? Container(
                    color: ZColors.lineColor,
                  )
                : placeholder,
            errorWidget: (context, url, error) => placeholder == null
                ? Container(
                    color: ZColors.lineColor,
                  )
                : placeholder,
            fit: BoxFit.cover,
          ),
        ));
  }
}
