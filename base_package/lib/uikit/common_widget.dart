export 'package:base_package/constant/color_value.dart';
export 'package:base_package/constant/textstyle.dart';
export 'package:base_package/constant/style.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base_package/constant/color_value.dart';
import 'package:base_package/constant/textstyle.dart';

import 'custom_view.dart';

///输入框
typedef void TextFieldDidChanged(String value);
typedef void TextFieldDidTap();
TextStyle ownStyle = TextStyle(
    fontFamily: 'NotoSansBold', fontSize: 13, fontWeight: FontWeight.w600);

class CommonWidget {
  static Widget imageButton(String name,
      {String libName,
      EdgeInsetsGeometry padding,
      EdgeInsetsGeometry margin,
      Color color,
      BoxDecoration decoration,
      VoidCallback callback,
      double width,
      double height,
      double scale}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: decoration ??
            BoxDecoration(
              color: Colors.transparent,
            ),
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        child: Image.asset(name, color: color, scale: scale, package: libName),
      ),
      onTap: callback,
    );
  }

  /// 按键带文字
  static Widget textButton(String text,
      {TextStyle textStyle,
      TextAlign textAlign,
      Color backgroundColor = Colors.transparent,
      BoxDecoration decoration,
      double width,
      double height,
      EdgeInsets padding,
      EdgeInsets margin,
      bool enable = true,
      AlignmentGeometry alignment,
      BuildContext context,
      VoidCallback callBack,
      Gradient textGradient}) {
    return GestureDetector(
      child: Container(
          margin: margin,
          padding: padding,
          alignment: alignment ?? Alignment.center,
          height: height,
          width: width,
          color: decoration != null ? null : backgroundColor,
          decoration: textGradient != null ? null : decoration,
          child: textGradient == null
              ? Text(text, maxLines: 1, textAlign: textAlign, style: textStyle)
              : GradientText(text,
                  gradient: textGradient,
                  textAlign: textAlign,
                  style: textStyle,
                  maxLines: 1)),
      onTap: () {
        if (callBack != null && enable) callBack();
      },
    );
  }

  ///文字和图片的位置，默认是文字->图片
  ///     bool ltr = true,
  /// 按键可以有文字和image
  static Widget customButton(
      {String text,
      Image image,
      bool ltr = true,
      TextStyle textStyle,
      TextAlign textAlign,
      BoxDecoration decoration,
      Color backGroundColor,
      EdgeInsets padding,
      bool enable = true,
      bool needTip = false,
      BuildContext context,
      double width,
      double height,
      double imageSize,
      Color imageColor,
      VoidCallback callBack,
      bool isAutoSize = false,
      double intervel,
      int maxLines}) {
    return GestureDetector(
      child: Container(
          padding: padding,
          alignment: Alignment(0, 0),
          height: height,
          width: width,
          color: decoration != null ? null : backGroundColor,
          decoration: decoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildButtonChild(text, image, height, width,
                ltr: ltr,
                textAlign: textAlign,
                textStyle: ownStyle.merge(textStyle),
                imageSize: imageSize,
                imageColor: imageColor,
                intervel: intervel,
                isAutoSize: isAutoSize,
                maxLines: maxLines),
          )),
      onTap: () {
        if (callBack != null && enable) callBack();
      },
    );
  }

  static List<Widget> _buildButtonChild(
      String text, Image image, double height, double width,
      {TextStyle textStyle,
      bool ltr,
      String package,
      TextAlign textAlign,
      double imageSize,
      Color imageColor,
      bool isAutoSize = false,
      double intervel = 0,
      int maxLines}) {
    final children = <Widget>[];
    Widget _text = Container();
    if (text != null) {
      var textWidget;
      if (isAutoSize) {
        textWidget = AutoSizeText(text,
            maxLines: maxLines ?? 1,
            maxFontSize: textStyle?.fontSize ?? 17,
            minFontSize: 1,
            textAlign: textAlign,
            style: textStyle);
      } else {
        textWidget = Text(text,
            maxLines: maxLines ?? 1,
            overflow: TextOverflow.ellipsis,
            textAlign: textAlign,
            style: textStyle);
      }

      textWidget = Container(
        padding: EdgeInsets.only(
            right: ltr ? intervel : 0, left: ltr ? 0 : intervel),
        child: textWidget,
      );
      _text = width != null ? Expanded(child: textWidget) : textWidget;
    }
    Widget _image;
    _image = image == null ? Container() : image;
    ltr ? children.addAll([_text, _image]) : children.addAll([_image, _text]);
    return children;
  }

  /// 创建barButton,放在导航栏上的button
  static Widget barButton(IconData iconData,
      {Color color,
      AlignmentGeometry alignment,
      double size,
      EdgeInsets padding,
      double width = 60,
      double height = 30,
      VoidCallback callBack}) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        child: Container(
          padding: padding,
          width: width,
          height: height,
          color: Colors.transparent,
          alignment: alignment ?? Alignment.center,
          child: Icon(iconData, color: color ?? Colors.white, size: size ?? 20),
        ),
        onTap: callBack,
      ),
    );
  }

  ///自选Iocn图标
  static Widget customIcon(IconData iconData,
      {Color color, VoidCallback callBack, double iconSize}) {
    return IconButton(
        icon: Icon(
          iconData,
          color: color,
        ),
        iconSize: iconSize ?? 24,
        onPressed: callBack);
  }

  ///自选Iocn图标
  static Widget customIconWithGest(IconData iconData,
      {Color color, GestureTapCallback callBack, double size}) {
    return GestureDetector(
        onTap: callBack,
        child: Icon(
          iconData,
          color: color,
          size: size,
        ));
  }

  ///自定义image ICON
  static Widget imageIcon(Image image,
      {EdgeInsets margin,
      EdgeInsets padding,
      VoidCallback callBack,
      Decoration decoration}) {
    return GestureDetector(
      child: Container(
          decoration: decoration,
          color: decoration != null ? null : Colors.transparent,
          margin: margin ?? EdgeInsets.fromLTRB(8, 8, 8, 8),
          padding: padding ?? EdgeInsets.all(3),
          child: image),
      onTap: callBack,
    );
  }

//-------------------------------常用TextField-------------------👆---//

//创建带有背景图层的textField
  static Widget customTextField(
      {Decoration decoration,
      Color backGroundColor,
      List<TextInputFormatter> inputFormatters,
      FocusNode node,
      bool autofocus,
      TextStyle textStyle,
      TextFieldDidChanged textFieldDidChanged,
      TextFieldDidTap textDidTap,
      EdgeInsets margin,
      String placeHold,
      double width,
      TextAlign textAlian,
      TextStyle placeStyle,
      Color cursorColor,
      TextEditingController controller,
      TextInputType keyboardType,
      bool security = false,
      bool enable}) {
    return Container(
      width: width,
      margin: margin,
      color: decoration == null ? backGroundColor : null,
      decoration: decoration,
      child: TextField(
        obscureText: security,
        focusNode: node,
        enabled: enable ?? true,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        textAlign: textAlian ?? TextAlign.left,
        autofocus: autofocus ?? false,
        style: textStyle ?? pingFangM(16, color: ZColors.textColor),
        cursorColor: cursorColor ?? ZColors.textColor,
        decoration: InputDecoration(
            fillColor: Colors.red,
            contentPadding:
                EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 10),
            border: InputBorder.none,
            hintStyle: placeStyle ??
                pingFangB(16, color: Color(0xFFD8D8D8).withOpacity(0.5)),
            hintText: placeHold ?? '请输入'),
        onChanged: textFieldDidChanged,
        onTap: textDidTap,
      ),
    );
  }

  /// 渐变按钮，不可点击时为灰色
  static Widget button(String text,
      {TextStyle textStyle,
      TextAlign textAlign,
      Color backgroundColor,
      BoxDecoration decoration,
      double width,
      double height,
      EdgeInsets padding,
      EdgeInsets margin,
      bool enable = true,
      AlignmentGeometry alignment,
      BuildContext context,
      VoidCallback callBack}) {
    return GestureDetector(
      child: Container(
          margin: margin,
          padding: padding,
          alignment: alignment ?? Alignment.center,
          height: height,
          width: width,
          color: decoration == null ? backgroundColor : null,
          decoration: decoration,
          child:
              Text(text, maxLines: 1, textAlign: textAlign, style: textStyle)),
      onTap: () {
        if (callBack != null && enable) callBack();
      },
    );
  }

  static Text TextNoto(String data,
      {Key key,
      TextStyle style,
      StrutStyle strutStyle,
      TextAlign textAlign,
      TextDirection textDirection,
      Locale locale,
      bool softWrap,
      TextOverflow overflow,
      double textScaleFactor,
      int maxLines,
      String semanticsLabel,
      TextWidthBasis textWidthBasis}) {
    return Text(data,
        style: ownStyle.merge(style),
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis);
  }
}
