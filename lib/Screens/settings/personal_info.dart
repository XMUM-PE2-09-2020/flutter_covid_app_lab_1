import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Persional info")
      )
      ,body: Container(
        child: Column(
          children: [
            getItem("Usename"),
            getItem("Email"),
            getItem("Phone")
          ]
        )
      )
    );
  }

  Widget getItem(title){
    return Container(
      margin: EdgeInsets.all(10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text("")
        ]
      )
    );
  }
}