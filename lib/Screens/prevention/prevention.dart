import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/model/prevention_model.dart';

const TextStyle DeepTextStyle = TextStyle(
    fontSize: 20,
    color: Color.fromRGBO(10, 84, 255, 1.0),
    fontWeight: FontWeight.w500);

const TextStyle BlackextStyle =
    TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500);

class Prevention extends StatefulWidget {
  @override
  _PreventionState createState() => _PreventionState();
}

class _PreventionState extends State<Prevention> {
  Size get _size => MediaQuery.of(context).size;
  MediaQueryData get _media => MediaQuery.of(context);
  int _page = 0;
  PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: PageView(
            controller: _controller,
            children: _models.map((e) => pageViewItem(e)).toList(),
            onPageChanged: (page) {
              setState(() {
                _page = page;
              });
            },
          )),
          Container(
              margin: EdgeInsets.only(bottom: _media.padding.bottom + 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        if (_page != 3) {
                          _page += 1;
                          _controller.jumpToPage(_page);
                        }
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      )),
                  tip(),
                  SizedBox(width: 20),
                  Container(
                      width: 90,
                      child: _page == 3
                          ? FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Color.fromRGBO(10, 84, 255, 1.0),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Next',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ))
                          : null),
                ],
              ))
        ],
      ),
    );
  }

  Widget tip() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(4, (index) {
            return _page == index
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromRGBO(10, 84, 255, 0.5)),
                        borderRadius: BorderRadius.circular(6)),
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(10, 84, 255, 0.5),
                        shape: BoxShape.circle),
                  );
          }),
        ),
      ),
    );
  }

  Widget pageViewItem(PreventionModel model) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: _media.padding.top + 40),
          child: Image.asset(
            model.image,
            width: _size.width * 4 / 5,
            height: _size.width * 4 / 5,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(height: 50, child: model.richText),
        SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            model.describe,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  List<PreventionModel> get _models => <PreventionModel>[
        PreventionModel(
            image: 'assets/images/tip1.png',
            richText: tip1,
            describe:
                'Keep your distance from others\nto protect them from getting sick too.'),
        PreventionModel(
            image: 'assets/images/tip2.png',
            richText: tip2,
            describe:
                'Wash your hands with soap and water,scrub\nyour hands for at least 20 seconds'),
        PreventionModel(
            image: 'assets/images/tip3.png',
            richText: tip3,
            describe:
                'Consider wearing aface mask when you are\nsick with a cough or sneezing'),
        PreventionModel(
            image: 'assets/images/tip4.png',
            richText: tip4,
            describe:
                'Staying at home will help control the spread of the virus to friends,ths wider community'),
      ];

  RichText get tip1 => RichText(
          text: TextSpan(text: 'Avoid', style: BlackextStyle, children: [
        TextSpan(
          text: ' Close',
          style: DeepTextStyle,
        ),
        TextSpan(
          text: ' Contact',
          style: BlackextStyle,
        ),
      ]));

  RichText get tip2 => RichText(
          text: TextSpan(text: 'Clean Your ', style: BlackextStyle, children: [
        TextSpan(
          text: 'Hands ',
          style: DeepTextStyle,
        ),
        TextSpan(
          text: 'Often',
          style: BlackextStyle,
        ),
      ]));
  RichText get tip3 => RichText(
          text: TextSpan(text: 'Wear a ', style: BlackextStyle, children: [
        TextSpan(
          text: 'facemask ',
          style: DeepTextStyle,
        ),
        TextSpan(
          text: 'if you\n are ',
          style: BlackextStyle,
        ),
        TextSpan(
          text: 'sick',
          style: DeepTextStyle,
        ),
      ]));
  RichText get tip4 => RichText(
          text: TextSpan(text: 'Stay at ', style: BlackextStyle, children: [
        TextSpan(
          text: 'home',
          style: DeepTextStyle,
        ),
      ]));
}
