import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatefulWidget {
  final double width;
  final double height;
  final Color bgColor;
  final Color fgColor;
  final BorderRadius borderRadius;
  final double value;

  CustomLinearProgressIndicator(
    {
      this.width,
      this.height,
      @required this.bgColor,
      @required this.fgColor,
      this.borderRadius,
      @required this.value
    }
  );

  @override
  _CustomLinearProgressIndicatorState createState() => _CustomLinearProgressIndicatorState();
}

class _CustomLinearProgressIndicatorState extends State<CustomLinearProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                                  width:  widget.width,
                                  height:  widget.height,
                                  child:ClipRRect(
                                    borderRadius: widget.borderRadius,
                                    child:LinearProgressIndicator(
                                      backgroundColor: widget.bgColor,
                                      valueColor: AlwaysStoppedAnimation(widget.fgColor),
                                      value: widget.value, 
                                    )
                                  )
                                );
  }
}
