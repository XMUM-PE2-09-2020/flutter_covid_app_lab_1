import 'package:flutter/material.dart';

import '../../../constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final testContainer = Container(
      key: Key('homescreen'),
    );
    return Stack(
      children: <Widget>[
        testContainer,
        Container(
          margin: EdgeInsets.only(
            bottom: size.height * 0.6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(
                900,
                290,
              ),
              bottomRight: Radius.elliptical(
                900,
                290,
              ),
            ),
            color: kPrimaryColorLight,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: size.height * 0.62,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(
                900,
                350,
              ),
              bottomRight: Radius.elliptical(
                900,
                350,
              ),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kPrimaryColorLight,
                kPrimaryColor,
              ],
              stops: [0.0, 0.75],
            ),
          ),
        ),
        child,
      ],
    );
  }
}
