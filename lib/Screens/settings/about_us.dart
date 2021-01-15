import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatefulWidget {
  @override
  _AboutUsViewState createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("About us")
      ),
      body: Center(
        child: Text("Covid-19 app is dedicated to cutting edge covid-19 information", textAlign: TextAlign.center,)
      )
    );
  }
}