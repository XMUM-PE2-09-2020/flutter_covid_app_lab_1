import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:base_package/extensions/extension_hup.dart';

import 'common_widget.dart';

const double _kNavBarPersistentHeight = 44.0;

class HXAppBar extends StatefulWidget implements PreferredSizeWidget {
  HXAppBar(
      {Key key,
      this.title = "",
      this.backImg,
      this.titleColor,
      this.backgroundColor,
      this.backgroundGradient,
      this.trailing,
      this.bottom,
      this.leading,
      bool automaticallyImplyLeading,
      double actionSize,
      this.statusStyle,
      this.child,
      double barHeight = _kNavBarPersistentHeight})
      : this.automaticallyImplyLeading = automaticallyImplyLeading ?? false,
        this.actionSize = actionSize ?? 20.0,
        this.barHeight = barHeight,
        preferredSize =
            Size.fromHeight(barHeight + (bottom?.preferredSize?.height ?? 0.0)),
        super(key: key);

  final bool automaticallyImplyLeading;
  final dynamic title;
  final Color backgroundColor;
  final Gradient backgroundGradient;
  final Color titleColor;
  final double actionSize;
  final double barHeight;
  final Widget trailing;
  final Widget leading;
  final Widget backImg;
  final SystemUiOverlayStyle statusStyle;

  ///child为自定义appBar,传child时其他参数无效(title, trailing, leading)
  final Widget child;

  @override
  _HXAppBarState createState() => _HXAppBarState();

  @override
  final Size preferredSize;

  final PreferredSizeWidget bottom;
}

class _HXAppBarState extends State<HXAppBar> {
  SystemUiOverlayStyle _overlayStyle = SystemUiOverlayStyle.dark;
  MediaQueryData get mediaData => MediaQuery.of(context);
  bool padding = false;

  @override
  void initState() {
    super.initState();
    _overlayStyle = widget.statusStyle ?? SystemUiOverlayStyle.dark;
  }

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    final canPop = parentRoute?.canPop ?? false;

    Widget leading = widget.leading;

    if (leading == null && widget.automaticallyImplyLeading) {
      if (canPop) {
        leading = Material(
          color: Colors.transparent,
          child: GestureDetector(
            child: Container(
              color: Colors.transparent,
              alignment: Alignment(-0.6, 0),
              width: 70.0,
              child: widget.backImg ??
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black87,
                    size: widget.actionSize,
                  ),
            ),
            onTap: () {
              Navigator.maybePop(context);
            },
          ),
        );
      } else {
        leading = Container();
      }
    }

    if (leading != null) {
      leading = Align(
        alignment: AlignmentDirectional.centerStart,
        child: leading,
      );
    }
    return Semantics(
      container: true,
      explicitChildNodes: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: _overlayStyle,
        child: Container(
          decoration: BoxDecoration(
             gradient: widget.backgroundGradient,
            color: widget.backgroundColor,
          ),
          
          padding: EdgeInsets.only(top: mediaData.padding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: widget.child ??
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //这里不要加width相关的设置，其他地方会有影响,暂时外部自己加pading属性调整
                        Container(
                          child: leading,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: widget.title is Widget
                                ? widget.title
                                : CommonWidget.TextNoto(
                                    widget.title.toString(),
                                    style: pingFangM(20.0, color: widget.titleColor ?? ZColors.textColor),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                  ),
                          ),
                        ),
                        //这里不要加width相关的设置，其他地方会有影响
                        Container(
                          child: widget.trailing,
                        )
                      ],
                    ),
              ),
              Container(
                child: widget.bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
