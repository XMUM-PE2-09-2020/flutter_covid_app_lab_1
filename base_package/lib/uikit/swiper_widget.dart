import 'dart:async';

import 'package:flutter/material.dart';

class SwiperWidget extends StatefulWidget {
  final int itemCount;

  final ScrollPhysics physics;

  final IndexedWidgetBuilder itemBuilder;

  final int duration;

  final Axis scrollDirection;

  const SwiperWidget(
      {Key key,
      @required this.itemCount,
      this.physics,
      @required this.itemBuilder,
      this.duration = 2000,
      this.scrollDirection = Axis.horizontal})
      : super(key: key);
  @override
  _SwiperWidgetState createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  PageController _controller;

  Timer _timer;

  int _maxCount = 0;

  int _itemCount = 0;

  int _duration = 0;

  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = PageController();

    _itemCount = widget.itemCount;

    _maxCount = _itemCount * 10000;

    _duration = widget.duration;

    _timer = Timer.periodic(Duration(milliseconds: _duration), (timer) {
      _controller.animateToPage(_currentIndex++,
          duration: Duration(milliseconds: 200), curve: Curves.linear);
    });
  }

  @override
  void didUpdateWidget(covariant SwiperWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.itemCount != widget.itemCount) {
      _itemCount = widget.itemCount;
      _maxCount = _itemCount * 10000;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemBuilder: (context, index) {
        if (widget.itemBuilder != null) {
          int _index = index % _itemCount;
          return widget.itemBuilder(context, _index);
        }
        return Container();
      },
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      itemCount: _maxCount,
      physics: widget.physics,
      scrollDirection: widget.scrollDirection,
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    _timer?.cancel();
    _controller = null;
    _timer = null;
    super.dispose();
  }
}
