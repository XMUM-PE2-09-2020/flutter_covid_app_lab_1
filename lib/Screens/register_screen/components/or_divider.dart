import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'divider_line.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: size.width * 0.8,
        child: Row(
          children: <Widget>[
            DividerLine(),
            Text(
              "OR",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            DividerLine(),
          ],
        ),
      ),
    );
  }
}
