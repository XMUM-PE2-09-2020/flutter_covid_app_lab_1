import 'package:flutter/material.dart';
import '../../constants.dart';


//Author: Qianzhen
class SelfCheck extends StatelessWidget {
  const SelfCheck({
    Key key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    @override
    var size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: textWhite,
                  ),
                ),
              ),
              Container(
                height: size.height,
                color: kPrimaryColor2,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 215,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Self Check up \nfor Covid-19",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                  color: textWhite),
                            ),
                            Image.asset("assets/images/image_2.png")
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 185),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(70))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 65,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          height: 3,
                                          width: 53,
                                          decoration: BoxDecoration(
                                              color: textWhite,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                        ),
                                        Container(
                                          height: 3,
                                          width: size.width - 137,
                                          decoration: BoxDecoration(
                                              color: textWhite.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "1/10",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 19,
                                        color: textWhite),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Have you\nexperienced any\nof the following\nsymptoms:",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: textWhite,
                                    height: 1.6),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Fever,Cough,Sneezing,\nSor Throat, Difficult in Breathing",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    height: 1.7,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: textWhite),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: (size.width - 120) / 2,
                                    child: FlatButton(
                                        color: textWhite,
                                        onPressed: () {
                                          // your no function here
                                        },
                                        child: Text(
                                          "No",
                                          style: TextStyle(fontSize: 18),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Container(
                                    width: (size.width - 120) / 2,
                                    child: FlatButton(
                                        color: textWhite,
                                        onPressed: () {
                                          // your yes function here
                                        },
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(fontSize: 18),
                                        )),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
