import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/constants.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        color: kPrimaryColorLight,
        height: 1.5,
      ),
    );
  }
}