import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/Screens/login_screen/components/rounded_buttons.dart';
import 'package:flutter_covid_app_lab_1/constants.dart';

import 'no_account.dart';
import 'rounded_input_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                RoundedInputField(
                  icon: Icons.person,
                  hintText: "Email Address",
                  onChanged: (value) {},
                ),
                RoundedInputField(
                  obscureText: true,
                  icon: Icons.lock,
                  hintText: "Password",
                  suffixIcon: Icons.visibility,
                  onChanged: (value) {},
                ),
                RoundedButton(
                  text: "LOGIN",
                  press: () {},
                ),
                NoAccount(
                  press: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );*/
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
