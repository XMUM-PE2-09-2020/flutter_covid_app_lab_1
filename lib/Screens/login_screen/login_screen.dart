import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/Models/user.dart';
import 'package:flutter_covid_app_lab_1/Screens/register_screen/signup_screen.dart';

import 'components/logo_name_and_slogan.dart';
import 'components/no_account.dart';
import 'components/rounded_buttons.dart';
import 'components/rounded_input_field.dart';
import 'login_presenter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    implements LoginPageContract {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading;
  String _username, _password;
  LoginPagePresenter _presenter;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    _presenter = LoginPagePresenter(this);
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var loginForm = Form(
      key: formKey,
      child: Column(
        children: [
          RoundedInputField(
            icon: Icons.person,
            hintText: "Username",
            onSaved: (value) => _username = value,
            validator: (value) {
              if (value.isEmpty) {
                return 'Field required';
              }
              return null;
            },
          ),
          RoundedInputField(
            obscureText: true,
            icon: Icons.lock,
            hintText: "Password",
            suffixIcon: Icons.visibility,
            onSaved: (value) => _password = value,
            validator: (value) {
              if (value.isEmpty) {
                return 'Field required';
              }
              return null;
            },
          ),
        ],
      ),
    );

    var loginBtn = RoundedButton(
      text: "LOGIN",
      press: () {
        if (formKey.currentState.validate()) {
          setState(() {
            isLoading = true;
            formKey.currentState.save();
            _presenter.doLogin(_username, _password);
          });
        }
      },
    );

    var body = SingleChildScrollView(
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
                loginForm,
                loginBtn,
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

    return new Scaffold(
      key: scaffoldKey,
      body: body,
    );
  }

  @override
  void onLoginError(Error error) {
    _showSnackBar(error.toString());
    setState(() {
      isLoading = false;
    });
    print(error.toString());
  }

  @override
  void onLoginSuccess(User user) {
    _showSnackBar(user.toString());
    setState(() {
      isLoading = false;
    });
    Navigator.of(context).pushNamed('/home');
  }
}
