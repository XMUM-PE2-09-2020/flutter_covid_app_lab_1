import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/Controller/BottomNavigationBar/BottomNavigationBarController.dart';
import 'package:flutter_covid_app_lab_1/Screens/login_screen/components/logo_name_and_slogan.dart';
import 'package:flutter_covid_app_lab_1/Screens/login_screen/components/rounded_buttons.dart';
import 'package:flutter_covid_app_lab_1/Screens/register_screen/signup_screen.dart';

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
                LogoNameAndSlogan(),
                SizedBox(
                  height: size.height * 0.05,
                ),
                RoundedInputField(
                  icon: Icons.person,
                  hintText: "Phone Number",
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
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BottomNavigationBarController();
                        },
                      ),
                    );
                  },
                ),
                NoAccount(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );
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
