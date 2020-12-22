import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/Controller/BottomNavigationBar/HomeController.dart';
import 'package:flutter_covid_app_lab_1/Screens/login_screen/login_screen.dart';
import 'package:flutter_covid_app_lab_1/Screens/register_screen/signup_screen.dart';
import 'package:flutter_covid_app_lab_1/constants.dart';
import 'package:flutter_covid_app_lab_1/vms/vm_covid19.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

final routes = {
  '/login': (BuildContext context) => LoginScreen(),
  '/register': (BuildContext context) => SignUpScreen(),
  '/home': (BuildContext context) => HomeController(),
  '/': (BuildContext context) => LoginScreen()
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Covid19VM>(create: (_) => Covid19VM()),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid App',
      routes: routes,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
