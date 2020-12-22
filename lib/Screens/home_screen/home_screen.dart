import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/vms/vm_covid19.dart';
import 'components/body.dart';

//Author: Ting Sen
class HomeScreen extends StatefulWidget {
   const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() { 
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Covid19VM.of(context).covid19TotalGet();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
