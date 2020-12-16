import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/vms/vm_covid19.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("1111");
      Covid19VM.of(context).covid19WeedGet().then((value){
        print("222");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container()
    );
  }
}