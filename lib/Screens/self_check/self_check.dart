import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/model/answer_model.dart';
import 'package:toast/toast.dart';
import '../../constants.dart';

//Author: Qianzhen

class SelfCheck extends StatefulWidget {
  _SelfCheckState createState() => _SelfCheckState();
}

class _SelfCheckState extends State<SelfCheck> {
  int current = 0;
  int total = 5;

  List<AnswerModel> answers = [
    AnswerModel(
        trouble: 'Have you\nexperienced any\nof the following\nsymptoms:',
        replenish: 'Fever,Cough,Sneezing,\nSor Throat, Difficult in Breathing'),
    AnswerModel(trouble: 'Have you\nlost your sense\nof smell or taste？'),
    AnswerModel(
        trouble:
            'Have you\nexperienced constant pain\nor pressure in your chest?'),
    AnswerModel(trouble: 'Have you\nhad a congestion\nor runny nose?'),
    AnswerModel(trouble: 'Have you\never experienced vomiting\nor nausea?'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body());
  }

  Widget body() {
    int _index = min(current, 4);
    AnswerModel _answerModel = answers[_index];
    var size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      bottom: false,
      child: SingleChildScrollView(
        child: Container(
          color: kPrimaryColor2,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
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
                            Expanded(
                              child: Text(
                                "Self Check up \nfor Covid-19",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: textWhite),
                              ),
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
                                  Expanded(
                                    child: Container(
                                      height: 2.5,
                                      child: LinearProgressIndicator(
                                          backgroundColor: Colors.grey,
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.white),
                                          value: current / total),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "$current/$total",
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
                                _answerModel.trouble,
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
                                _answerModel.replenish ?? '',
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
                              Visibility(
                                visible: current < 5,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: (size.width - 120) / 2,
                                      child: FlatButton(
                                          color: textWhite,
                                          onPressed: answerNo,
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
                                          onPressed: answerYes,
                                          child: Text(
                                            "Yes",
                                            style: TextStyle(fontSize: 18),
                                          )),
                                    )
                                  ],
                                ),
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
        ),
      ),
    );
  }

  void answerNo() {
    next();
  }

  void answerYes() {
    next();
  }

  void next() {
    setState(() {
      current++;
    });
    if (current == 5) {
      Toast.show("finish !", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  }
}
