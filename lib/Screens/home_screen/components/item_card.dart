import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String image, text, number;
  final Function press;
  const ItemCard({
    Key key,
    @required this.image,
    this.text,
    this.number,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Material(
              child: Ink(
                width: size.width * 0.25,
                height: size.height * 0.18,
                child: InkWell(
                  onTap: press,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(image),
                      if ((number != null) || (text != null))
                        Column(
                          children: [
                            if (text != null) Text(text),
                            if (number != null)
                              Text(
                                number,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
