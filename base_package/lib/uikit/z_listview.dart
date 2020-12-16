import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//listview state基本数据类
mixin ZBaseListState {
  static final double paddingTop = 15.0; //
  static final double paddingBottom = 15.0; //默认的padding的上下间距
  final padding = EdgeInsets.fromLTRB(0, paddingTop, 0, paddingBottom);
  final margin = EdgeInsets.all(0);

  final BoxDecoration decoration = null;
  final backgroundColor = Color.fromRGBO(244, 245, 246, 1.0);
}

class ZListView<T> extends StatefulWidget {
  ZListView(
      {this.title,
      this.bottom,
      this.margin,
      this.padding,
      this.childrens,
      this.backgroundColor = Colors.transparent,
      this.width,
      this.height,
      this.header})
      : assert(childrens != null || title != null || bottom != null);
  final dynamic title;
  final Widget bottom;
  final Widget header;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final List<Widget> childrens;
  final double width;
  final double height;
  final Color backgroundColor;

  @override
  _GmListViewState createState() => _GmListViewState<T>();
}

class _GmListViewState<T> extends State<ZListView<T>> with ZBaseListState {
  final _childrens = <Widget>[];
  @override
  void initState() {
    super.initState();
    if (widget.header != null) {
      _childrens.add(widget.header);
    }
    if (widget.title != null) {
      _childrens.add(buildTitle());
    }
    if (widget.childrens != null) {
      _childrens.addAll(widget.childrens);
    }
    if (widget.bottom != null) {
      _childrens.add(buildBottom());
    }
  }

  @override
  void didUpdateWidget(ZListView<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _childrens.removeRange(0, _childrens.length);
    if (widget.header != null) {
      _childrens.add(widget.header);
    }
    if (widget.title != null) {
      _childrens.add(buildTitle());
    }

    if (widget.childrens != null) {
      _childrens.addAll(widget.childrens);
    }

    if (widget.bottom != null) {
      _childrens.add(buildBottom());
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        return Container(
          color: widget.backgroundColor,
          width: widget.width ?? size.maxWidth,
          height: widget.height,
          margin: widget.margin ?? margin,
          padding: widget.padding ?? padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _childrens,
          ),
        );
      },
    );
  }

  Widget buildTitle() {
    return widget.title is Widget
        ? widget.title
        : Container(
            child: Text(widget.title,
                style: TextStyle(color: Colors.grey, fontSize: 14)),
            padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
            margin: EdgeInsets.only(top: 10, bottom: 5),
          );
  }

  Widget buildBottom() {
    return widget.bottom;
  }
}
