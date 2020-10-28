import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/constants.dart';
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
                          'Last updated on 20 Oct 2020',
                          style: TextStyle(
                            color: Colors.white,
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
                        number: '8960',
                      ),
                      ItemCard(
                        image: "assets/images/recovered.png",
                        text: 'Recovered',
                        number: '3221',
                      ),
                      ItemCard(
                        image: "assets/images/death.png",
                        text: 'Death',
                        number: '169',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Row(
                    children: <Widget>[
                      ItemCard(
                        image: "assets/images/self-check.png",
                        text: 'Self-Check',
                      ),
                      ItemCard(
                        image: "assets/images/prevention.png",
                        text: 'Prevention',
                      ),
                      ItemCard(
                        image: "assets/images/nearby.png",
                        text: 'Nearby',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Row(
                    children: <Widget>[
                      ItemCard(
                        image: "assets/images/statistics.png",
                        text: 'Statistics',
                      ),
                      ItemCard(
                        image: "assets/images/contacts.png",
                        text: 'Contacts',
                      ),
                      ItemCard(
                        image: "assets/images/news.png",
                        text: 'News',
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
