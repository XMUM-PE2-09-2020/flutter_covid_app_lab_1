import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/Screens/news/news_view.dart';
import 'package:flutter_covid_app_lab_1/Screens/settings/personal_info.dart';
import 'package:toast/toast.dart';

import 'about_us.dart';
import 'feedback_view.dart';

class Personal extends StatefulWidget {
  const Personal({Key key}) : super(key: key);
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal>
    with AutomaticKeepAliveClientMixin {
  String _nickName = '';
  String _phoneNum = '';
  String _avatar;
  Map _personalData = {};
  String _fileSize = '0M';

  BuildContext _context;

  String _version = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 19.5,
                ),
                personalInfo(), //修改个人信息
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                ),
                logOut(), //退出登录
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget logoWithHeader() {
    return Column(
      children: [
        Row(
          children: [
            /**/
            Image.asset(
              'assest/images/personal_logo.png',
              width: 35.2,
              height: 35,
            ),
            SizedBox(
              width: 5.5,
            ),
            Text(
              '',
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _personalData['trueName'] ?? '',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${_personalData['department']}(${_personalData['signatureTitle']})' ??
                        '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget personalInfo() {
    List titleArr = ['Personal info', 'Feedback', 'About us'];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: Colors.white,
      ),
      child: Column(
        children: titleArr.asMap().keys.map((index) {
          return GestureDetector(
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PersonalInfo();
                      },
                    ),
                  );
                  break;
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FeedBackView();
                      },
                    ),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AboutUsView();
                      },
                    ),
                  );
                  break;
              }
            },
            child: Container(
              height: 44,
              margin: EdgeInsets.only(left: 18, right: 8),
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    titleArr[index],
                  ),
                  Container(
                    width: 200,
                    height: 44,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 11,
                        ),
                        Icon(
                          Icons.chevron_right,
                          // color: ZColors.textGreyColor9,
                          size: 16,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget logOut() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 0, right: 0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        color: Theme.of(context).primaryColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Container(
          alignment: Alignment.center,
          child: Text('LOGOUT', style: TextStyle(color: Colors.white)),
        ),
      ),
    ); //登录按钮
  }

  @override
  bool get wantKeepAlive => true;
}
