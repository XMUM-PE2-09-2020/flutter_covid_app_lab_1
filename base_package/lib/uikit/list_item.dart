import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double padding_top = 15.0; //
const double padding_bottom = 15.0; //默认的padding的上下间距

//item state基本数据类
mixin BaseItemState {
  final padding = EdgeInsets.all(0);
  final margin = EdgeInsets.all(0);

  final BoxDecoration decoration = null;
  final backgroundColor = Colors.white;
}

///---------------------------------------------------------单元格1widget

///item有状态和数据类型之分，这些数据不同item有不同的表现
class ListItem<T> extends StatefulWidget {
  ListItem(
      {this.leading,
      this.content,
      this.subContent,
      this.trailing,
      this.backgroundColor,
      this.height,
      this.margin,
      this.padding,
      this.decoration,
      this.effectColor = const Color.fromRGBO(244, 245, 246, 1.0),
      this.effectAble = false,
      Key key,
      this.callback,
      this.contentPadding,
      this.contentMargin})
      : assert(decoration == null ||
            (decoration != null && backgroundColor == null)),
        super(key: key);

  final Widget leading;
  final Widget content;
  final Widget subContent;

  final Widget trailing;
  final double height;
  final Color backgroundColor;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BoxDecoration decoration;
  final VoidCallback callback;
  final EdgeInsets contentPadding;
  final EdgeInsets contentMargin;
  //这两个属性是控制点击效果的 默认是不开启
  final Color effectColor;
  final bool effectAble;

  @override
  _ListItemState<T> createState() => _ListItemState<T>();
}

//---------------------------------------------------------单元格1state
class _ListItemState<T> extends State<ListItem> with BaseItemState {
  Color _color;
  Color _originColor;

  BoxDecoration _boxDecoration;

  @override
  void initState() {
    super.initState();
    _color = widget.backgroundColor;
    _boxDecoration = widget.decoration;
    _originColor = _boxDecoration == null
        ? (_color ?? backgroundColor)
        : _boxDecoration.color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: StatefulBuilder(builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Container(
            ///编辑状态下，系统类型的item会是:height + 10
            height: widget.height,
            color: _boxDecoration == null ? (_color ?? backgroundColor) : null,
            margin: widget.margin ?? margin,
            padding: widget.padding ?? padding,
            decoration: _boxDecoration ?? decoration,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(child: widget.leading),
                Expanded(
                    child: Container(
                  margin: widget.contentMargin,
                  padding: widget.contentPadding == null
                      ? widget.leading == null
                          ? EdgeInsets.only(left: 15)
                          : EdgeInsets.zero
                      : widget.contentPadding,
                  child: widget.subContent == null
                      ? widget.content
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: widget.content,
                            ),
                            Container(
                              child: widget.subContent,
                            )
                          ],
                        ), //
                )),
                Container(
                  child: widget.trailing,
                )
              ],
            ),
          );
        }),
        onTap: widget.callback,
        onTapUp: (detail) {
          tapEffectPlugin(_originColor);
        },
        onTapDown: (detail) {
          tapEffectPlugin(widget.effectColor);
        },
        onTapCancel: () {
          tapEffectPlugin(_originColor);
        });
  }

  void tapEffectPlugin(Color color) {
    if (!widget.effectAble) {
      return;
    }
    setState(() {
      if (widget.decoration != null) {
        _boxDecoration = BoxDecoration(
            color: color,
            shape: widget.decoration.shape,
            image: widget.decoration.image,
            border: widget.decoration.border,
            boxShadow: widget.decoration.boxShadow,
            borderRadius: widget.decoration.borderRadius,
            gradient: widget.decoration.gradient,
            backgroundBlendMode: widget.decoration.backgroundBlendMode);
      } else {
        _color = color;
      }
    });
  }
}
