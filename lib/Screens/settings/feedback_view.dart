import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class FeedBackView extends StatefulWidget {
  @override
  _FeedBackViewState createState() => _FeedBackViewState();
}

class _FeedBackViewState extends State<FeedBackView> {
  bool clickable = false;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feedback"),
          ),
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
            margin: EdgeInsets.only(
                left: 17, right: 17, top: 10, bottom: 10),
            height: 146,
            decoration: BoxDecoration(
                color: Color(0xFFF9F9F9),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: TextField(
              maxLines: 4,
              // keyboardType: type,
              maxLength: 50,
              controller: controller,
              // obscureText: isPassWord,
              onChanged: (value) {
                setState(() {
                  clickable = value.length > 0;
                });
              },

              // cursorColor: ZColors.primaryColor,
              // inputFormatters: inputFormatters, //只允许输入数字
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "",
                  // hintStyle: pingFangM(15, color: Color(0xFFCCCCCC)),
                  contentPadding: EdgeInsets.all(10)),
            )),
        Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 50,
                  width: 341,
                  child: Center(
                      child: Text("submit",
                          style: TextStyle(color: Colors.white)
                          )
                          ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color:
                          clickable ? Theme.of(context).primaryColor : Color(0xFFB9B9B9))),
              onTap: () {
                if (clickable) {
                  Toast.show("submit success", context);
                  Navigator.pop(context);
                }
              },
            ))
      ]),
    );
  }
}
