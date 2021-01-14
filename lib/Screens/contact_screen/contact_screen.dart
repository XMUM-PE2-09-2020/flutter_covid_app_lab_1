import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/constants.dart';

//author: ting sen
class ContactScreen extends StatelessWidget {
  const ContactScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColorLight,
      appBar: _buildAppBar(context),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
              vertical: kDefaultPadding / 2,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(5, 5), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding / 2,
                vertical: kDefaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Centers for Disease Control and Prevention',
                    style: TextStyle(
                      color: textWhite,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    '1600 Clifton Road,',
                    style: TextStyle(
                      color: textWhite,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Atlanta,',
                    style: TextStyle(
                      color: textWhite,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'GA 30329 USA',
                    style: TextStyle(
                      color: textWhite,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    '800-CDC-INFO | (800-232-4636) | TTY: (888) 232-6348',
                    style: TextStyle(
                      color: textWhite,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
              vertical: kDefaultPadding / 2,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: textWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(5, 5), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding / 2,
                vertical: kDefaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Note',
                    style: TextStyle(
                      color: textBlack,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'CDC does not see patients and is unable to diagnose your illness, provide treatment, prescribe medication, or refer you to specialists.',
                    style: TextStyle(
                      color: textBlack,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'If you have a medical emergency, please see your health care provider or the nearest emergency room. If you are a health care provider, please contact your state epidemiologist or local health department.',
                    style: TextStyle(
                      color: textBlack,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColorDark,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text('Contact Us'),
    );
  }
}
