import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String image, text, number;
  const ItemCard({
    Key key,
    @required this.image,
    this.text,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            width: size.width * 0.25,
            height: size.height * 0.18,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(image),
                if((number != null) || (text != null))
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
        ],
      ),
    );
  }
}
