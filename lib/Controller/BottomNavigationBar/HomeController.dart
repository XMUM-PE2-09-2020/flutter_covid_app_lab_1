import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/Screens/home_screen/home_screen.dart';
import 'package:flutter_covid_app_lab_1/Screens/notify_screen/notify_screen.dart';
import 'package:flutter_covid_app_lab_1/Screens/qrcode_screen/qrcode_screen.dart';
import 'package:flutter_covid_app_lab_1/Screens/settings/personal.dart';

//Author: Ting Sen
class HomeController extends StatefulWidget {
  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  final List<Widget> pages = [
    HomeScreen(
      key: PageStorageKey('HomeScreen'),
    ),
    QRScreen(
      key: PageStorageKey('QRScreen'),
    ),
    NotifyScreen(
      key: PageStorageKey('NotifyScreen'),
    ),
    Personal(
      key: PageStorageKey('Personal'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: "QR Code",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
        body: PageStorage(
          child: pages[_selectedIndex],
          bucket: bucket,
        ),
      ),
    );
  }
}
