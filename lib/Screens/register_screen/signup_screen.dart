import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/Screens/login_screen/components/logo_name_and_slogan.dart';
import 'package:flutter_covid_app_lab_1/Screens/login_screen/components/no_account.dart';
import 'package:flutter_covid_app_lab_1/Screens/login_screen/components/rounded_buttons.dart';
import 'package:flutter_covid_app_lab_1/Screens/login_screen/components/rounded_input_field.dart';
import 'package:flutter_covid_app_lab_1/Screens/login_screen/login_screen.dart';
import 'components/or_divider.dart';
import 'components/social_icon.dart';

//Author: Ting Sen
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Container(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    LogoNameAndSlogan(),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    RoundedInputField(
                      icon: Icons.phone,
                      hintText: "Phone Number",
                      onSaved: (value) {},
                    ),
                    RoundedInputField(
                      icon: Icons.email,
                      hintText: "Email Address",
                      onSaved: (value) {},
                    ),
                    RoundedInputField(
                      icon: Icons.person,
                      hintText: "Username",
                      onSaved: (value) {},
                    ),
                    RoundedInputField(
                      obscureText: true,
                      icon: Icons.lock,
                      hintText: "Password",
                      suffixIcon: Icons.visibility,
                      onSaved: (value) {},
                    ),
                    RoundedButton(
                      text: "REGISTER",
                      press: () {},
                    ),
                    NoAccount(
                      login: false,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                    OrDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SocialIcon(
                          iconSrc: "assets/icons/facebook.svg",
                          press: () {},
                        ),
                        SocialIcon(
                          iconSrc: "assets/icons/twitter.svg",
                          press: () {},
                        ),
                        SocialIcon(
                          iconSrc: "assets/icons/google-plus.svg",
                          press: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
