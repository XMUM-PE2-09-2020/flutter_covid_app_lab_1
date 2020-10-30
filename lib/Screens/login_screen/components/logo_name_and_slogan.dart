import 'package:flutter/material.dart';

import '../../../constants.dart';

class LogoNameAndSlogan extends StatelessWidget {
  const LogoNameAndSlogan({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Image.asset(
          "assets/images/coronavirus.png",
          height: size.height * 0.25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Corona",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColorLight),
            ),
            Text(
              "Tracer",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          "Caring for the future",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        )
      ],
    );
  }
}
