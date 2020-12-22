import 'package:flutter_covid_app_lab_1/utils/data_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/Screens/home_screen/statistics.dart';
import 'package:flutter_covid_app_lab_1/Screens/prevention/prevention.dart';
import 'package:flutter_covid_app_lab_1/Screens/self_check/self_check.dart';
import 'package:flutter_covid_app_lab_1/constants.dart';
import 'package:flutter_covid_app_lab_1/vms/vm_covid19.dart';
import 'background.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            width: size.width,
            child: Background(
              child: Column(
                children: <Widget>[
                  Container(
                    width: size.width,
                    height: size.height * 0.25,
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Text(
                          'Good Morning, Paul!',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Text(
                          'All cases updated',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Last updated on ${DateTime.now().day} ${DateUtil.getMonth(DateTime.now(), short:true)} ${DateTime.now().year}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      ItemCard(
                        image: "assets/images/confirmed.png",
                        text: 'Confirmed',
                        number: Covid19VM.of(context, true).covid19totalModel?.data?.summary?.totalCases?.toString()?? "0",
                        press: () {},
                      ),
                      ItemCard(
                        image: "assets/images/recovered.png",
                        text: 'Recovered',
                        number: Covid19VM.of(context, true).covid19totalModel?.data?.summary?.recovered?.toString()?? "0",
                        press: () {},
                      ),
                      ItemCard(
                        image: "assets/images/death.png",
                        text: 'Death',
                        number: Covid19VM.of(context, true).covid19totalModel?.data?.summary?.deaths?.toString()?? "0",
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  Row(
                    children: <Widget>[
                      ItemCard(
                        image: "assets/images/self-check.png",
                        text: 'Self-Check',
                        press: () {
                          Navigator.of(context).pushNamed('/self_check');
                        },
                      ),
                      ItemCard(
                        image: "assets/images/prevention.png",
                        text: 'Prevention',
                        press: () {
                          Navigator.of(context).pushNamed('/prevention');
                        },
                      ),
                      ItemCard(
                        image: "assets/images/nearby.png",
                        text: 'Nearby',
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    children: <Widget>[
                      ItemCard(
                        image: "assets/images/statistics.png",
                        text: 'Statistics',
                        press: () {
                           Navigator.of(context).pushNamed('/statistics');
                        },
                      ),
                      ItemCard(
                        image: "assets/images/contacts.png",
                        text: 'Contacts',
                        press: () {},
                      ),
                      ItemCard(
                        image: "assets/images/news.png",
                        text: 'News',
                        press: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
