import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/model/user.dart';
import 'package:flutter_session/flutter_session.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  User user;
  @override
  void initState() {
    super.initState();
    FlutterSession().get("token").then((value){
      user = User.map(value);
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Persional info")
      )
      ,body: Container(
        child: Column(
          children: [
            getItem("Usename", user?.username?.toString()??""),
            getItem("Email", user?.email?.toString()??""),
            getItem("Phone", user?.phoneNumber?.toString()??"")
          ]
        )
      )
    );
  }

  Widget getItem(title, value){
    return Container(
      margin: EdgeInsets.all(10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value)
        ]
      )
    );
  }
}