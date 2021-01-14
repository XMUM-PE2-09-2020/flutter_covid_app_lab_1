import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/model/user.dart';
import 'package:flutter_covid_app_lab_1/Screens/login_screen/components/logo_name_and_slogan.dart';
import 'package:flutter_covid_app_lab_1/Screens/login_screen/components/no_account.dart';
import 'package:flutter_covid_app_lab_1/Screens/login_screen/components/rounded_buttons.dart';
import 'package:flutter_covid_app_lab_1/Screens/login_screen/components/rounded_input_field.dart';
import 'package:flutter_covid_app_lab_1/Screens/register_screen/register_presenter.dart';
import 'package:flutter_session/flutter_session.dart';
import 'components/or_divider.dart';
import 'components/social_icon.dart';

//Author: Ting Sen
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    implements RegisterPageContruct {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  String _username, _email, _password;
  int _phoneNumber;
  RegisterPagePresenter _registerPresenter;
  User _user;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    _registerPresenter = RegisterPagePresenter(this);
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(text),
      duration: Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var registerBtn = RoundedButton(
      key: Key('signup_button'),
      text: "REGISTER",
      press: () {
        if (formKey.currentState.validate()) {
          setState(() {
            isLoading = true;
            formKey.currentState.save();
            _user = User(_username, _password, _email, _phoneNumber);
            _registerPresenter.doRegister(_user);
          });
        }
      },
    );

    final phoneNumberField = RoundedInputField(
      key: Key('signup_phone_input_field'),
      icon: Icons.phone,
      hintText: "Phone Number",
      onSaved: (value) => _phoneNumber = int.parse(value),
    );
    final emailField = RoundedInputField(
      key: Key('signup_email_input_field'),
      icon: Icons.email,
      hintText: "Email Address",
      onSaved: (value) => _email = value,
    );
    final usernameField = RoundedInputField(
      key: Key('signup_username_input_field'),
      icon: Icons.person,
      hintText: "Username",
      onSaved: (value) => _username = value,
    );
    final passwordField = RoundedInputField(
      key: Key('signup_password_input_field'),
      obscureText: true,
      icon: Icons.lock,
      hintText: "Password",
      suffixIcon: Icons.visibility,
      onSaved: (value) => _password = value,
    );
    final registerForm = Form(
      key: formKey,
      child: Column(
        children: [
          phoneNumberField,
          emailField,
          usernameField,
          passwordField,
        ],
      ),
    );

    var body = SingleChildScrollView(
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
                  registerForm,
                  registerBtn,
                  NoAccount(
                    login: false,
                    press: () {
                      Navigator.of(context).pushNamed('/login');
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
    );

    return Scaffold(
      key: scaffoldKey,
      body: body,
    );
  }

  @override
  void onRegisterError(Error error) {
    _showSnackBar(error.toString());
    print(error.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  Future<void> onRegisterSuccess(bool res) async {
    if (res == true) {
      _showSnackBar(_user.username.toString() + ' signed up successfully.');
      await FlutterSession().set("token", _user);

      setState(() {
        isLoading = false;
      });

      Future.delayed(
          Duration(seconds: 2), () => Navigator.of(context).pushNamed('/home'));
    } else {
      _showSnackBar('Sign up failed. Username existed.');

      setState(() {
        isLoading = false;
      });
    }
  }
}
