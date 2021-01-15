import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/model/travel_history.dart';
import 'package:flutter_covid_app_lab_1/model/user.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_covid_app_lab_1/Screens/qrcode_screen/add_travel_log.dart';

//author: ting sen
class QRScreen extends StatefulWidget {
  QRScreen({Key key}) : super(key: key);

  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> implements AddTravelRecord {
  GlobalKey qrKey = GlobalKey();
  AddTravelRecordPresenter _presenter;
  String qrText;
  String place;
  dynamic token;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _getData();
    _presenter = AddTravelRecordPresenter(this);
  }

  _getData() async {
    token = await FlutterSession().get("token");
  }

  _showSnackBar(String text, Duration time) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(text),
      duration: time,
    ));
  }

  QRViewController controller;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Container(
        child: Scaffold(
          key: scaffoldKey,
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: QRView(
                  key: qrKey,
                  overlay: QrScannerOverlayShape(
                    borderRadius: 15,
                    borderColor: Colors.red,
                    borderWidth: 5,
                    cutOutSize: 300,
                  ),
                  onQRViewCreated: _onQRViewCreate,
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Scan result: $qrText'),
                    Text('Decode result: $place'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 5,
                          child: ElevatedButton(
                            onPressed: () {
                              if (place != null) {
                                User user = User.map(token);
                                TravelHistory log = TravelHistory(
                                    user.username, place, DateTime.now().toString());
                                _presenter.addNewLog(log);
                              } else {
                                _showSnackBar(
                                  'Not a valid QR code.',
                                  Duration(seconds: 2),
                                );
                              }
                            },
                            child: Text('Check-in'),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 5,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/travel_history');
                            },
                            child: Text('View Travel History'),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Text('Warning'),
          content: Text('Do you really want to logout?'),
          actions: [
            FlatButton(
              child: Text('Yes'),
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                await preferences.clear();
                Navigator.of(c).popUntil(ModalRoute.withName('/'));
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () => Navigator.pop(c, false),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreate(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        var map;
        bool scanIsJson = false;
        qrText = scanData.code;

        try {
          map = jsonDecode(qrText) as Map<String, dynamic>;
          scanIsJson = true;
        } on FormatException {}

        if (scanIsJson == true) {
          place = map['place'];
        } else {
          place = null;
        }
      });
    });
  }

  @override
  void onAddError(Error error) {
    _showSnackBar(
      error.toString(),
      Duration(seconds: 4),
    );
    print(error.toString());
  }

  @override
  void onAddSuccess(bool res) {
    if (res == true) {
      _showSnackBar(
        'Successfully checked-in.',
        Duration(seconds: 2),
      );
    } else {
      _showSnackBar(
        'Check-in failed.',
        Duration(seconds: 2),
      );
    }
  }
}
